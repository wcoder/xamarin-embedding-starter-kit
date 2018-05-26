#!/usr/bin/env bash

PROJECT_NAME=DotNet.IosLibrary
OUTPUT_PATH=output-ios
CONFIG=Release

cd dotnet

# Restore NuGet
nuget restore DotNet.sln

# Build Xamarin library
rm -Rf $PROJECT_NAME/bin/$CONFIG/
msbuild $PROJECT_NAME/$PROJECT_NAME.csproj /p:Configuration=$CONFIG

# Clean
rm -Rf $OUTPUT_PATH

# Run E4K
mono ../e4k/objcgen/bin/Debug/objcgen.exe \
    --gen=ObjectiveC \
    --platform=iOS \
    --target=framework \
    --outdir=$OUTPUT_PATH \
    --compile \
    --verbose \
    $PROJECT_NAME/bin/$CONFIG/$PROJECT_NAME.dll
