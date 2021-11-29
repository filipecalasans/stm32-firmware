# Base CMake Project for firmware development using STM32F devices


## Setting Up the Toolchain

* Download gcc-arm-none-eabi from ARM website in:

https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads

* Even if we opt for using llvm-clang as the cross-compiler, you can re-use the 
prebuilt compiler libraries gcc-arm-none-eabi. Some of the librareis you will need are:

    * libgcc - low-level compiler runtime library. 
    
    > Most of the routines in libgcc handle arithmetic operations that the target processor cannot perform directly. This includes integer multiply and divide on some machines, and all floating-point and fixed-point operations on other machines. libgcc also includes routines for exception handling, and a handful of miscellaneous operations.

    * newlib: Contains libc and libm for bare-metal firmwares.
    
    > Newlib is a C standard library implementation intended for use on embedded systems. It is a conglomeration of several library parts, all under free software licenses that make them easily usable on embedded products.

### Toolchain Location

This repo make some assumptions about the toolchain location as follow:

### GCC

ARM GCC toolchain is provided in `tools/gcc-arm-none-eabi-10.3`. The paths can be updated accordingnly in `./build.sh`. Toolchain definitions can be found in `cmake/toolchain/gcc.cmake`  and `cmake/toolchain/sysroot.cmake`.

### LLVM

* TODO: Define llvm toolchain cmake file.

## File Origin, Project Organization & License

This project is composed of several header/sources made availalbe by the chip vendor (STMMicroelectornics)
that helps to ease development. Those files are meant to describe the underlying CPU and memory mappend
peripherals in a ergonomic and developer friedly way. This will avoid for example that we need to look at the
datasheets for each peripheral mapped address.

The files were laid out in this project on a directory structure that can ease re-using this same project 
definition for other `SoC + Board`  combination.

###  Startup Code and Linker scripts

* https://github.com/STMicroelectronics/cmsis_device_f3

License Apache 2.0: https://github.com/STMicroelectronics/cmsis_device_f3/blob/master/LICENSE.md

Provides `stm32fXX.h` device peripheral layer header files located in `platform/stm32f30x`.

## ARM CMSIS (Cortex Microcontroller Softare Interface Standard) for Cortex-M4

* You can download the files from `arch/arm-cortex-m4` from the following ARM repo: 

https://github.com/ARM-software/CMSIS/tree/master/CMSIS/Include

License: https://github.com/ARM-software/CMSIS/blob/master/CMSIS/CMSIS_END_USER_LICENCE_AGREEMENT.pdf


## St-link tools

In order to flash and debug firmware for stm32 based boards with support to st-link, you 
should install the st-link tools. The st-link tools can be found in the repo:

https://github.com/stlink-org/stlink


Installation steps for Linux:


### Install libusb dependncy from source

```bash 

# Compile and Install libusb from source.

# Install dependency: libudev
sudo apt-get install libudev-dev

# Download source from the latest release:
https://github.com/libusb/libusb/releases/

# compile and install libusb from source
cd <LIBUSB_SRC> && ./configure
make -j4
sudo make install 
```

### Install libusb from package manager:

```bash
# Install prebuilt libusb from package manager.

# Ubuntu/debian: libusb
sudo apt-get install libusb-1.0-0-dev
```

### Install st-link tools

* NOTE: Required to have CMake installed.

```bash
STLINK_REPO=https://github.com/stlink-org/stlink.git
git clone "$STLINK_REPO"
cd stlink

# Checkout latest release version, at the time of this tutorial the
# latest release tag was: v1.7.0
git checkout v1.7.0
make
sudo make install
```

### st-link without sudo

Copy the udev rules rpovided in the st-link repo to the following directory:

```bash
STLINK_SOURCE"<YOUR-ST-LINK-SRC>"
sudo cp $STLINK_SOURCE/config/udev/rules.d/49-stlinkv* /etc/udev/rules.d/
```

## Building your firmware 

```bash
./build.sh
```

## Flashing a STM32F3 based board using stlink

```bash
./flash-stm32f3.sh
``` 

## Debugging firmware using stlink

* There two options of debugger, one is to use the gdb shipped in the ARM gcc toolchain. The onther option is to 
install gdb-multiarch for debuging non-host binaries.

```bash
sudo apt-get install gdb-multiarch
```

```bash
$TOOLCHAIN/bin/arm-none-eabi-gdb
```

The following helper script will launch the debug server and connect to the debugger server.

```bash
./debug-stm32f3.sh
```

Use the following command to kill evantual reminiscent background processes:

```bash
./clean-debugger.sh
```

If you want to use Vscode GUI for a more firendly user experience, you will want to customize the scripts to only launch the debug server, and setup vscode to connect to `localhost:4500`.

### Flashing the board from the gdb console

```bash
(gdb) load out/src/main.elf
```

### TODO:

* Incorporate STD Peripheral library for STM32f3

* Make target generics on CMake so we can build for nay target platform.



