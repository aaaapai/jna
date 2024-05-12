#!/bin/bash
# set -e

cmake_build () {
  ANDROID_ABI=$1
  mkdir -p build-$ANDROID_ABI
  mkdir -p lib/$ANDROID_ABI
  cd build-$ANDROID_ABI
  cmake $GITHUB_WORKSPACE -DCMAKE_BUILD_TYPE=Release -DANDROID_PLATFORM=24 -DANDROID_ABI=$ANDROID_ABI -DCMAKE_TOOLCHAIN_FILE=$ANDROID_NDK_LATEST_HOME/build/cmake/android.toolchain.cmake
  cmake --build . --clean-first
  # | echo "Build exit code: $?"
  # --verbose
  cd ..
  cd ./native
  cp build-$ANDROID_ABI/*.so lib/$ANDROID_ABI/
}

mkdir -p lib

cmake_build arm64-v8a
