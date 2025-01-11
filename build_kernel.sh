#!/bin/bash

export KBUILD_BUILD_USER="Mizumo_prjkt"

# Summon some toolchains

git-init_() {
    git submodule init && git submodule update
}

build() {
    export PLATFORM_VERSION=13
    export ARCH=arm64
    
    make  ARCH=arm64 mizkernel-a13xx_defconfig -j64
    make  ARCH=arm64 -j64
}

START_BUILD_TIME_RAW=$(TZ="Asia/Manila" date +%T)
START_BUILD_DATE_RAW=$(TZ="Asia/Manila" date +%F)
START_BUILD_TIME_AND_DATE="$START_BUILD_TIME_RAW - $START_BUILD_DATE_RAW"
echo "Starting Compile of A13 Kernel"
echo "Start Build: $START_BUILD_TIME_AND_DATE"

git-init_
build

echo "Build Ended :D"
END_BUILD_TIME_RAW=$(TZ="Asia/Manila" date +%T)
END_BUILD_DATE_RAW=$(TZ="Asia/Manila" date +%F)
END_BUILD_TIME_AND_DATE="$END_BUILD_TIME_RAW - $END_BUILD_DATE_RAW"
echo "Build Ended: $END_BUILD_TIME_AND_DATE"