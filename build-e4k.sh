#!/usr/bin/env bash

function build_e4k_android {
    ./build.sh -t Generate-Android
}

function build_e4k_ios {
    nuget restore
    msbuild
}

cd e4k

git branch master
git pull && git submodule update --init --recursive

case "$@" in
    "android")
        build_e4k_android
    ;;
    "ios")
        build_e4k_ios
    ;;
    *)
        build_e4k_android
        sleep 1
        build_e4k_ios
    ;;
esac

cd ..
