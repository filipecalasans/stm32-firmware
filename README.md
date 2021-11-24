
# Setting Up Toolchain

* Download gcc-arm-none-eabi from ARM website in:

https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-rm/downloads

* Even if we opt for using llvm-clang as the cross-compiler, you can re-use the 
prebuilt compiler libraies and newlib shipped with gcc-arm-none-eabi. Some of the
librareis you will need are:

    * libgcc - low-level compiler runtime library. 
    
    > Most of the routines in libgcc handle arithmetic operations that the target processor cannot perform directly. This includes integer multiply and divide on some machines, and all floating-point and fixed-point operations on other machines. libgcc also includes routines for exception handling, and a handful of miscellaneous operations.

    * newlib: Contains libc and libm for bare-metal firmwares.
    
    > Newlib is a C standard library implementation intended for use on embedded systems. It is a conglomeration of several library parts, all under free software licenses that make them easily usable on embedded products.
