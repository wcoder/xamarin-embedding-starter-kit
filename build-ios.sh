#!/usr/bin/env bash

PROJECT_NAME=DotNet.IosLibrary
OUTPUT_PATH=output-ios
IOS_PROJECT_PATH=../ios/
CONFIG=Release

cd dotnet

# Restore NuGet
nuget restore DotNet.sln

# Build Xamarin library
rm -Rf $PROJECT_NAME/bin/$CONFIG/
msbuild $PROJECT_NAME/$PROJECT_NAME.csproj /p:Configuration=$CONFIG

# Clean
rm -Rf $OUTPUT_PATH
rm -Rf $IOS_PROJECT_PATH/$PROJECT_NAME.framework

# Run E4K
mono ../e4k/objcgen/bin/Debug/objcgen.exe \
    --gen=ObjectiveC \
    --platform=iOS \
    --target=framework \
    --outdir=$OUTPUT_PATH \
    --compile \
    --verbose \
    $PROJECT_NAME/bin/$CONFIG/$PROJECT_NAME.dll

# Copy .framework to iOS project
cp -R $OUTPUT_PATH/$PROJECT_NAME.framework $IOS_PROJECT_PATH
