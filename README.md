# TouchVGCmd - Drawing commands

## Overview

TouchVGCmd contains the following cross-platform modules using C++ and TouchVGShape module for vector drawing frameworks:

- cmdbase: Base classes for deriving more drawing commands.
- cmdbasic: Commands to draw basic shapes.
- cmdmgr: Command manager library.

This is an open source LGPL 2.1 licensed project that is in active development. Contributors and sponsors are welcome.

## Build

* Need TouchVGShape project

  > Need to download or check out **TouchVGShape** project from [github](https://github.com/rhcad/TouchVGShape) or [oschina](http://git.oschina.net/rhcad/TouchVGShape) to `../TouchVGShape` folder.

* Build for **iOS** platform on Mac OS X.

  > Open ios/TouchVGCmd.xcodeproj in Xcode, then build the library project.

* Build for **Android** platform on Mac, Linux or Windows.

  > Cd the 'android' folder of this project and type `./build.sh` to build with ndk-build. MinGW and MSYS are recommend on Windows.
  >
  > The library `libTouchVGCmd.a` will be outputed to `android/command/obj/local/armeabi`.
  
* Build for more platforms and targets

  > Cd the 'core' folder of this project and type `make` or `make all install` to generate libraries on Mac, Linux or Windows.
  > 
  > Type `make java`, `make python` or `make csharp` to generate libraries for another language applications using Java, Python or C#.
  > 
  > Type `make clean java.clean python.clean` to remove the program object files.
