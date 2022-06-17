
Setup Steps:
1. run `make`, make sure build is succesful
2. copy ./scripts, run_simpoints.sh into ./build/release_static/
3. download videos from: https://drive.google.com/drive/folders/1s85AiEVpHyNpYaOWjsnl7otO1nRkbXTl?usp=sharing
4. run `./run_simpoints.sh bball fast 100000000` as an example
5. look under ./bball/fast/100000000 for output files 

** To run on ECE Cluster, replace `cmake` in Makefile with `/afs/ece.cmu.edu/class/ece643/software/xilinxVitis/petalinux/2020.2/sysroots/x86_64-petalinux-linux/usr/bin/cmake`
   to use an up-to-date cmake

Output files from run_simpoint.sh script

count.bb: Number of occurences of basic blocks in intervals (interval is tunable with third argument to run_simpoint script)
          Each line starts with "T" and represents one execution interval. The basic block is shown within two ":" marks. ":1:" 
	  means basic block 1, and basic block indexes start at 1. After the basic block index, the number of times the basic 
	  block was executed is shown. Basic blocks which were never executed are not shown.

simpoints (mapping from Interval ID -> Simpoint ID):  The results in the "simpoints" file tell you which execution intervals 
	  are important and gives each execution interval a unique number. Note that since this is using k-means with random 
	  seeding, you will receive slightly different results every time you run SimPoints. Here is how to interpret the file:

weights (weights of simpoints in execution of program): The results in the "weights" file tell you how much each interval 
	  contributes to the overall execution of the program. The weights should add up to 1. They use the same IDs as those in the simpoints file.

labels: Saves to the given file the label and distance to nearest centroid for each clustered vector.

** run `$LLVM_SIMPOINT/SimPoint.3.2/bin/simpoint` with no arguments for more info

block_debug.txt: source file lines attributed to each basic blocks 
interval_debug.txt (tentative): source file lines attributed to each interval
line_count.pkl: pickle of line count list for each basic block produced by ./scripts/line_count.py. This pickle file is used in the jupyter notebook heatmap vizualization


To Run Heatmap in jupyter Notebook:
  1. run `jupyter notebook`, make sure you have the output files in the right path.
