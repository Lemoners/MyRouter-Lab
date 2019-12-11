# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/lemon/Workspace/2019_network/MyRouter-Lab

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/lemon/Workspace/2019_network/MyRouter-Lab/build

# Include any dependencies generated for this target.
include HAL/CMakeFiles/router_hal.dir/depend.make

# Include the progress variables for this target.
include HAL/CMakeFiles/router_hal.dir/progress.make

# Include the compile flags for this target's objects.
include HAL/CMakeFiles/router_hal.dir/flags.make

HAL/CMakeFiles/router_hal.dir/src/linux/router_hal.cpp.o: HAL/CMakeFiles/router_hal.dir/flags.make
HAL/CMakeFiles/router_hal.dir/src/linux/router_hal.cpp.o: ../HAL/src/linux/router_hal.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/lemon/Workspace/2019_network/MyRouter-Lab/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object HAL/CMakeFiles/router_hal.dir/src/linux/router_hal.cpp.o"
	cd /home/lemon/Workspace/2019_network/MyRouter-Lab/build/HAL && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/router_hal.dir/src/linux/router_hal.cpp.o -c /home/lemon/Workspace/2019_network/MyRouter-Lab/HAL/src/linux/router_hal.cpp

HAL/CMakeFiles/router_hal.dir/src/linux/router_hal.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/router_hal.dir/src/linux/router_hal.cpp.i"
	cd /home/lemon/Workspace/2019_network/MyRouter-Lab/build/HAL && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/lemon/Workspace/2019_network/MyRouter-Lab/HAL/src/linux/router_hal.cpp > CMakeFiles/router_hal.dir/src/linux/router_hal.cpp.i

HAL/CMakeFiles/router_hal.dir/src/linux/router_hal.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/router_hal.dir/src/linux/router_hal.cpp.s"
	cd /home/lemon/Workspace/2019_network/MyRouter-Lab/build/HAL && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/lemon/Workspace/2019_network/MyRouter-Lab/HAL/src/linux/router_hal.cpp -o CMakeFiles/router_hal.dir/src/linux/router_hal.cpp.s

HAL/CMakeFiles/router_hal.dir/src/linux/router_hal.cpp.o.requires:

.PHONY : HAL/CMakeFiles/router_hal.dir/src/linux/router_hal.cpp.o.requires

HAL/CMakeFiles/router_hal.dir/src/linux/router_hal.cpp.o.provides: HAL/CMakeFiles/router_hal.dir/src/linux/router_hal.cpp.o.requires
	$(MAKE) -f HAL/CMakeFiles/router_hal.dir/build.make HAL/CMakeFiles/router_hal.dir/src/linux/router_hal.cpp.o.provides.build
.PHONY : HAL/CMakeFiles/router_hal.dir/src/linux/router_hal.cpp.o.provides

HAL/CMakeFiles/router_hal.dir/src/linux/router_hal.cpp.o.provides.build: HAL/CMakeFiles/router_hal.dir/src/linux/router_hal.cpp.o


# Object files for target router_hal
router_hal_OBJECTS = \
"CMakeFiles/router_hal.dir/src/linux/router_hal.cpp.o"

# External object files for target router_hal
router_hal_EXTERNAL_OBJECTS =

HAL/librouter_hal.a: HAL/CMakeFiles/router_hal.dir/src/linux/router_hal.cpp.o
HAL/librouter_hal.a: HAL/CMakeFiles/router_hal.dir/build.make
HAL/librouter_hal.a: HAL/CMakeFiles/router_hal.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/lemon/Workspace/2019_network/MyRouter-Lab/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library librouter_hal.a"
	cd /home/lemon/Workspace/2019_network/MyRouter-Lab/build/HAL && $(CMAKE_COMMAND) -P CMakeFiles/router_hal.dir/cmake_clean_target.cmake
	cd /home/lemon/Workspace/2019_network/MyRouter-Lab/build/HAL && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/router_hal.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
HAL/CMakeFiles/router_hal.dir/build: HAL/librouter_hal.a

.PHONY : HAL/CMakeFiles/router_hal.dir/build

HAL/CMakeFiles/router_hal.dir/requires: HAL/CMakeFiles/router_hal.dir/src/linux/router_hal.cpp.o.requires

.PHONY : HAL/CMakeFiles/router_hal.dir/requires

HAL/CMakeFiles/router_hal.dir/clean:
	cd /home/lemon/Workspace/2019_network/MyRouter-Lab/build/HAL && $(CMAKE_COMMAND) -P CMakeFiles/router_hal.dir/cmake_clean.cmake
.PHONY : HAL/CMakeFiles/router_hal.dir/clean

HAL/CMakeFiles/router_hal.dir/depend:
	cd /home/lemon/Workspace/2019_network/MyRouter-Lab/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/lemon/Workspace/2019_network/MyRouter-Lab /home/lemon/Workspace/2019_network/MyRouter-Lab/HAL /home/lemon/Workspace/2019_network/MyRouter-Lab/build /home/lemon/Workspace/2019_network/MyRouter-Lab/build/HAL /home/lemon/Workspace/2019_network/MyRouter-Lab/build/HAL/CMakeFiles/router_hal.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : HAL/CMakeFiles/router_hal.dir/depend

