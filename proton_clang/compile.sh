#!/bin/bash
export KBUILD_BUILD_USER=KutuMoba
export KBUILD_BUILD_HOST=Kutu_Moba57

export ARCH=arm64 \
export HEADER_ARCH=arm64 \
export PATH="$HOME/proton-clang/bin:$PATH"
export HEADER_ARCH=arm64

export AR="$HOME/proton_clang/aarch64-linux-gnu/bin/ar"
export NM="$HOME/proton_clang/aarch64-linux-gnu/bin/nm"
export OBJCOPY="$HOME/proton_clang/aarch64-linux-gnu/bin/objcopy"
export OBJDUMP="$HOME/proton_clang/aarch64-linux-gnu/bin/objdump"
export STRIP="$HOME/proton_clang/aarch64-linux-gnu/bin/strip"
export CC="$HOME/proton_clang/bin/clang"

function compile() {
    make -j$(nproc --all) O=out ARCH=arm64 lavender-perf_defconfig
    make -j$(nproc --all) ARCH=arm64 O=out \
                                     AR=ar \
                                     NM=nm \
                                     OBJCOPY=objcopy \
                                     OBJDUMP=objdump \
                                     STRIP=strip \
                                     CC=clang \
                                     CROSS_COMPILE=aarch64-linux-gnu- \
                                     CROSS_COMPILE_ARM32=arm-linux-gnueabi-

}

compile
