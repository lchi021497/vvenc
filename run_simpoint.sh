if [ "$#" -ne 3 ]; then
    echo "Usage: ./run_simpoints.sh CONFIG_FILE PRESET DINTERVAL"
    exit -1
fi

CURR=$(pwd)
LLVM_SIMPOINT=/home/canna/LLVM-SimPoints  # path to LLVM_Simpoint repo
LLVM_TOOLS=$CURR/scripts

cd $LLVM_SIMPOINT
make clean
# compile LLVM simpoint bitcode
clang -emit-llvm -O3 -c -DINTERVAL=$3 -o count.bc count_bb/count.cpp
cp count.bc $CURR
cd $CURR

echo "linking to executable.."
# link library binaries to from encoder library binary
llvm-link-4.0 $(find source/Lib/apputils/CMakeFiles/apputils.dir -name "*.o") $(find source/Lib/vvenc/CMakeFiles/vvenc.dir -name "*.o" $(printf "! -name %s " "vvencCfg.cpp.o")) -o encLib.o

#llvm-link-4.0 source/App/vvencFFapp/CMakeFiles/vvencFFapp.dir/EncApp.cpp.o source/App/vvencFFapp/CMakeFiles/vvencFFapp.dir/encmain.cpp.o source/Lib/vvenc/CMakeFiles/vvenc.dir/vvencCfg.cpp.o -o encApp2.o
echo "linking with count.bc.."
# link encoder binary with LLVM simpoint bitcode to form encoder_count bitcode
llvm-link-4.0 encLib.o  ./count.bc -o encoder_count.bc

echo "running optimization pass.."
# load libNumBlock to count access # to code blocks
opt -load $LLVM_TOOLS/libNumBlocks.so -numBlocks < encoder_count.bc > encoder_count_renamed.bc
llvm-dis encoder_count_renamed.bc

opt-4.0 -load $LLVM_SIMPOINT/count_bb/build/countBB/libcountBB.so -countBB encoder_count_renamed.bc  -o encoder_count_opt.bc
llvm-dis encoder_count_opt.bc

# linking binaries to form encoder main program
llvm-link-4.0 encoder_count_opt.bc source/App/vvencFFapp/CMakeFiles/vvencFFapp.dir/EncApp.cpp.o source/App/vvencFFapp/CMakeFiles/vvencFFapp.dir/encmain.cpp.o source/Lib/vvenc/CMakeFiles/vvenc.dir/vvencCfg.cpp.o -o encoder_count_final.bc

echo "compiling with O3.."
llc-4.0 -O3 encoder_count_final.bc
echo "compiling into executable"
#$clang -lm -lstdc++ -DTARGET_SIMD_X86 -O3 -DNDEBUG -flto -fno-fat-lto-objects encoder_count_opt.bc -o encoder  -pthread
clang -lm -lstdc++ -DTARGET_SIMD_X86 -O3 -DNDEBUG -flto -fno-fat-lto-objects encoder_count_final.bc -o encoder ../../lib/release-static/libvvenc.a ../../lib/release-static/libapputils.a -pthread


echo "running executable on sequence video.."
time ./encoder -c ../../cfg/$1.cfg -c ../../cfg/randomaccess_$2.cfg -b out -o reconstruct

echo "running SimPoint.."
$LLVM_SIMPOINT/SimPoint.3.2/bin/simpoint -maxK 30 -loadFVFile count.bb -saveSimpoints simpoints -saveSimpointWeights weights -saveLabels labels

opt-4.0 -load ./scripts/libLineNumbers.so -intervalFile count.bb -lineNumbers < encoder_count_renamed.ll > /dev/null || echo "keep running.."
python ./scripts/format.py count.bb > count2.bb
rm count.bb
mv count2.bb count.bb
python ./scripts/line_counts.py block_debug.txt 

if [ ! -d "$1" ]; then
	mkdir $1
fi

if [ ! -d "$1/$2" ]; then
	mkdir $1/$2
fi

if [ ! -d "$1/$2/$3" ]; then
	mkdir "$1/$2/$3"
fi

DEST_DIR="$1/$2/$3"
mv simpoints $DEST_DIR
mv weights $DEST_DIR
mv labels $DEST_DIR
mv count.bb $DEST_DIR
mv block_debug.txt $DEST_DIR
mv interval_debug.txt $DEST_DIR
mv line_count.pkl $DEST_DIR
