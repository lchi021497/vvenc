# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.23

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /opt/cmake-3.23.0-rc1-linux-x86_64/bin/cmake

# The command to remove a file.
RM = /opt/cmake-3.23.0-rc1-linux-x86_64/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/canna/vvenc

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/canna/vvenc

# Include any dependencies generated for this target.
include source/Lib/apputils/CMakeFiles/apputils.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include source/Lib/apputils/CMakeFiles/apputils.dir/compiler_depend.make

# Include the progress variables for this target.
include source/Lib/apputils/CMakeFiles/apputils.dir/progress.make

# Include the compile flags for this target's objects.
include source/Lib/apputils/CMakeFiles/apputils.dir/flags.make

source/Lib/apputils/CMakeFiles/apputils.dir/ParseArg.cpp.o: source/Lib/apputils/CMakeFiles/apputils.dir/flags.make
source/Lib/apputils/CMakeFiles/apputils.dir/ParseArg.cpp.o: source/Lib/apputils/ParseArg.cpp
source/Lib/apputils/CMakeFiles/apputils.dir/ParseArg.cpp.o: source/Lib/apputils/CMakeFiles/apputils.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/canna/vvenc/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object source/Lib/apputils/CMakeFiles/apputils.dir/ParseArg.cpp.o"
	cd /home/canna/vvenc/source/Lib/apputils && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT source/Lib/apputils/CMakeFiles/apputils.dir/ParseArg.cpp.o -MF CMakeFiles/apputils.dir/ParseArg.cpp.o.d -o CMakeFiles/apputils.dir/ParseArg.cpp.o -c /home/canna/vvenc/source/Lib/apputils/ParseArg.cpp

source/Lib/apputils/CMakeFiles/apputils.dir/ParseArg.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/apputils.dir/ParseArg.cpp.i"
	cd /home/canna/vvenc/source/Lib/apputils && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/canna/vvenc/source/Lib/apputils/ParseArg.cpp > CMakeFiles/apputils.dir/ParseArg.cpp.i

source/Lib/apputils/CMakeFiles/apputils.dir/ParseArg.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/apputils.dir/ParseArg.cpp.s"
	cd /home/canna/vvenc/source/Lib/apputils && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/canna/vvenc/source/Lib/apputils/ParseArg.cpp -o CMakeFiles/apputils.dir/ParseArg.cpp.s

source/Lib/apputils/CMakeFiles/apputils.dir/VVEncAppCfg.cpp.o: source/Lib/apputils/CMakeFiles/apputils.dir/flags.make
source/Lib/apputils/CMakeFiles/apputils.dir/VVEncAppCfg.cpp.o: source/Lib/apputils/VVEncAppCfg.cpp
source/Lib/apputils/CMakeFiles/apputils.dir/VVEncAppCfg.cpp.o: source/Lib/apputils/CMakeFiles/apputils.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/canna/vvenc/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object source/Lib/apputils/CMakeFiles/apputils.dir/VVEncAppCfg.cpp.o"
	cd /home/canna/vvenc/source/Lib/apputils && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT source/Lib/apputils/CMakeFiles/apputils.dir/VVEncAppCfg.cpp.o -MF CMakeFiles/apputils.dir/VVEncAppCfg.cpp.o.d -o CMakeFiles/apputils.dir/VVEncAppCfg.cpp.o -c /home/canna/vvenc/source/Lib/apputils/VVEncAppCfg.cpp

source/Lib/apputils/CMakeFiles/apputils.dir/VVEncAppCfg.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/apputils.dir/VVEncAppCfg.cpp.i"
	cd /home/canna/vvenc/source/Lib/apputils && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/canna/vvenc/source/Lib/apputils/VVEncAppCfg.cpp > CMakeFiles/apputils.dir/VVEncAppCfg.cpp.i

source/Lib/apputils/CMakeFiles/apputils.dir/VVEncAppCfg.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/apputils.dir/VVEncAppCfg.cpp.s"
	cd /home/canna/vvenc/source/Lib/apputils && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/canna/vvenc/source/Lib/apputils/VVEncAppCfg.cpp -o CMakeFiles/apputils.dir/VVEncAppCfg.cpp.s

source/Lib/apputils/CMakeFiles/apputils.dir/YuvFileIO.cpp.o: source/Lib/apputils/CMakeFiles/apputils.dir/flags.make
source/Lib/apputils/CMakeFiles/apputils.dir/YuvFileIO.cpp.o: source/Lib/apputils/YuvFileIO.cpp
source/Lib/apputils/CMakeFiles/apputils.dir/YuvFileIO.cpp.o: source/Lib/apputils/CMakeFiles/apputils.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/canna/vvenc/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object source/Lib/apputils/CMakeFiles/apputils.dir/YuvFileIO.cpp.o"
	cd /home/canna/vvenc/source/Lib/apputils && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT source/Lib/apputils/CMakeFiles/apputils.dir/YuvFileIO.cpp.o -MF CMakeFiles/apputils.dir/YuvFileIO.cpp.o.d -o CMakeFiles/apputils.dir/YuvFileIO.cpp.o -c /home/canna/vvenc/source/Lib/apputils/YuvFileIO.cpp

source/Lib/apputils/CMakeFiles/apputils.dir/YuvFileIO.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/apputils.dir/YuvFileIO.cpp.i"
	cd /home/canna/vvenc/source/Lib/apputils && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/canna/vvenc/source/Lib/apputils/YuvFileIO.cpp > CMakeFiles/apputils.dir/YuvFileIO.cpp.i

source/Lib/apputils/CMakeFiles/apputils.dir/YuvFileIO.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/apputils.dir/YuvFileIO.cpp.s"
	cd /home/canna/vvenc/source/Lib/apputils && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/canna/vvenc/source/Lib/apputils/YuvFileIO.cpp -o CMakeFiles/apputils.dir/YuvFileIO.cpp.s

# Object files for target apputils
apputils_OBJECTS = \
"CMakeFiles/apputils.dir/ParseArg.cpp.o" \
"CMakeFiles/apputils.dir/VVEncAppCfg.cpp.o" \
"CMakeFiles/apputils.dir/YuvFileIO.cpp.o"

# External object files for target apputils
apputils_EXTERNAL_OBJECTS =

lib/release-static/libapputils.a: source/Lib/apputils/CMakeFiles/apputils.dir/ParseArg.cpp.o
lib/release-static/libapputils.a: source/Lib/apputils/CMakeFiles/apputils.dir/VVEncAppCfg.cpp.o
lib/release-static/libapputils.a: source/Lib/apputils/CMakeFiles/apputils.dir/YuvFileIO.cpp.o
lib/release-static/libapputils.a: source/Lib/apputils/CMakeFiles/apputils.dir/build.make
lib/release-static/libapputils.a: source/Lib/apputils/CMakeFiles/apputils.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/canna/vvenc/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX static library ../../../lib/release-static/libapputils.a"
	cd /home/canna/vvenc/source/Lib/apputils && $(CMAKE_COMMAND) -P CMakeFiles/apputils.dir/cmake_clean_target.cmake
	cd /home/canna/vvenc/source/Lib/apputils && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/apputils.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
source/Lib/apputils/CMakeFiles/apputils.dir/build: lib/release-static/libapputils.a
.PHONY : source/Lib/apputils/CMakeFiles/apputils.dir/build

source/Lib/apputils/CMakeFiles/apputils.dir/clean:
	cd /home/canna/vvenc/source/Lib/apputils && $(CMAKE_COMMAND) -P CMakeFiles/apputils.dir/cmake_clean.cmake
.PHONY : source/Lib/apputils/CMakeFiles/apputils.dir/clean

source/Lib/apputils/CMakeFiles/apputils.dir/depend:
	cd /home/canna/vvenc && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/canna/vvenc /home/canna/vvenc/source/Lib/apputils /home/canna/vvenc /home/canna/vvenc/source/Lib/apputils /home/canna/vvenc/source/Lib/apputils/CMakeFiles/apputils.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : source/Lib/apputils/CMakeFiles/apputils.dir/depend

