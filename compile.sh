#!/bin/bash
export KBUILD_BUILD_USER=KutuMoba
export KBUILD_BUILD_HOST=Kutu_Moba57
# Compile plox
function compile() {
    make -j$(nproc) O=out ARCH=arm64 lavender-perf_defconfig
    make -j$(nproc) ARCH=arm64 O=out \
                               CROSS_COMPILE=aarch64-linux-gnu- \
                               CROSS_COMPILE_ARM32=arm-linux-gnueabi-
}
compile
