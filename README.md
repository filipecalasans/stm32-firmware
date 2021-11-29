
# Setting Up Toolchain

* Download gcc-arm-none-eabi from ARM website in:

https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads

* Even if we opt for using llvm-clang as the cross-compiler, you can re-use the 
prebuilt compiler libraries gcc-arm-none-eabi. Some of the librareis you will need are:

    * libgcc - low-level compiler runtime library. 
    
    > Most of the routines in libgcc handle arithmetic operations that the target processor cannot perform directly. This includes integer multiply and divide on some machines, and all floating-point and fixed-point operations on other machines. libgcc also includes routines for exception handling, and a handful of miscellaneous operations.

    * newlib: Contains libc and libm for bare-metal firmwares.
    
    > Newlib is a C standard library implementation intended for use on embedded systems. It is a conglomeration of several library parts, all under free software licenses that make them easily usable on embedded products.

# File Origin & Project Organization & License

This project is composed of several header/sources made availalbe by the chip vendor (STMMicroelectornics)
that helps to ease development. Those files are meant to describe the underlying CPU and memory mappend
peripherals in a ergonomic and developer friedly way. This will avoid for example that we need to look at the
datasheets for each peripheral mapped address.

The files were laid out in this project on a directory structure that can ease re-using this same project 
definition for other `SoC + Board`  combination.

##  Startup Code and Linker scripts

* https://github.com/STMicroelectronics/cmsis_device_f3

License Apache 2.0: https://github.com/STMicroelectronics/cmsis_device_f3/blob/master/LICENSE.md

Provides `stm32fXX.h` device peripheral layer header files located in `platform/stm32f30x`.

# ARM CMSIS (Cortex Microcontroller Softare Interface Standard) for Cortex-M4

* You can download the files from `arch/arm-cortex-m4` from the following ARM repo: 

https://github.com/ARM-software/CMSIS/tree/master/CMSIS/Include

License: https://github.com/ARM-software/CMSIS/blob/master/CMSIS/CMSIS_END_USER_LICENCE_AGREEMENT.pdf


# St-link tools

In order to flash and debug firmware for stm32 based boards with support to st-link, you 
should install the st-link tools. The st-link tools can be found in the repo:

https://github.com/stlink-org/stlink


Installation steps for Linux:


## Install libusb dependncy from source

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

## Install libusb from package manager:

```bash
# Install prebuilt libusb from package manager.

# Ubuntu/debian: libusb
sudo apt-get install libusb-1.0-0-dev
```

## Install st-link tools

* Required to have CMake installed.

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

