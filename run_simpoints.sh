if [ "$#" -ne 3 ]; then
    echo "Usage: ./run_simpoints.sh CONFIG_FILE PRESET DINTERVAL"
    exit -1
fi

CURR=$(pwd)
LLVM_SIMPOINT=/home/canna/LLVM-SimPoints

cd $LLVM_SIMPOINT
make clean
clang -emit-llvm -O3 -c -DINTERVAL=$3 -o count.bc count_bb/count.cpp
cp count.bc $CURR
cd $CURR

echo "linking to executable.."
llvm-link-4.0 $(find source/Lib/apputils/CMakeFiles/apputils.dir -name "*.o") $(find source/Lib/vvenc/CMakeFiles/vvenc.dir -name "*.o" $(printf "! -name %s " "vvencCfg.cpp.o")) -o encApp2.o

#llvm-link-4.0 source/App/vvencFFapp/CMakeFiles/vvencFFapp.dir/EncApp.cpp.o source/App/vvencFFapp/CMakeFiles/vvencFFapp.dir/encmain.cpp.o source/Lib/vvenc/CMakeFiles/vvenc.dir/vvencCfg.cpp.o -o encApp2.o
echo "linking with count.bc.."
llvm-link-4.0 encApp2.o  ./count.bc -o encoder_count.bc

opt -load $LLVM_TOOLS/libNumBlocks.so -numBlocks < encoder_count.bc > encoder_count_renamed.bc
llvm-dis encoder_count_renamed.bc

echo "running optimization pass.."
opt-4.0 -load $LLVM_SIMPOINT/count_bb/build/countBB/libcountBB.so -countBB encoder_count_renamed.bc  -o encoder_count_opt.bc
llvm-dis encoder_count_opt.bc

llvm-link-4.0 encoder_count_opt.bc source/App/vvencFFapp/CMakeFiles/vvencFFapp.dir/EncApp.cpp.o source/App/vvencFFapp/CMakeFiles/vvencFFapp.dir/encmain.cpp.o source/Lib/vvenc/CMakeFiles/vvenc.dir/vvencCfg.cpp.o -o encoder_count_final.bc

echo "compiling with O3.."
llc-4.0 -O3 encoder_count_final.bc
echo "compiling into executable"
#$clang -lm -lstdc++ -DTARGET_SIMD_X86 -O3 -DNDEBUG -flto -fno-fat-lto-objects encoder_count_opt.bc -o encoder  -pthread
clang -lm -lstdc++ -DTARGET_SIMD_X86 -O3 -DNDEBUG -flto -fno-fat-lto-objects encoder_count_final.bc -o encoder ../../lib/release-static/libvvenc.a ../../lib/release-static/libapputils.a -pthread
# clang -lm -lstdc++ -DTARGET_SIMD_X86 -O3 -DNDEBUG -flto -fno-fat-lto-objects encApp2.o -o encoder ../../lib/release-static/libvvenc.a ../../lib/release-static/libapputils.a -pthread


echo "running executable on sequence video.."
time ./encoder -c ../../cfg/$1.cfg -c ../../cfg/randomaccess_$2.cfg -b out

echo "running SimPoint.."
$LLVM_SIMPOINT/SimPoint.3.2/bin/simpoint -maxK 30 -loadFVFile count.bb -saveSimpoints simpoints -saveSimpointWeights weights -saveLabels labels

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
cp simpoints $DEST_DIR
cp weights $DEST_DIR
cp labels $DEST_DIR
cp count.bb $DEST_DIR
