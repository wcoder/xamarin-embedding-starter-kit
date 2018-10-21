#!/usr/bin/env bash

PROJECT_NAME=DotNet.AndroidLibrary
OUTPUT_PATH=output-android
ANDROID_PROJECT_PATH=../android
CONFIG=Release

cd dotnet

# Clean
rm -Rf $OUTPUT_PATH

# Restore NuGet
nuget restore DotNet.sln

# Build Xamarin library
rm -Rf $PROJECT_NAME/bin/$CONFIG/
msbuild $PROJECT_NAME/$PROJECT_NAME.csproj /p:Configuration=$CONFIG

# Run E4K
mono ../e4k/build/lib/Release/Embeddinator-4000.exe \
    --gen=Java \
    --platform=Android \
    --outdir=$OUTPUT_PATH \
    --compile \
    --verbose \
    $PROJECT_NAME/bin/$CONFIG/$PROJECT_NAME.dll

# Copy AAR to Android project
cp $OUTPUT_PATH/$PROJECT_NAME.aar $ANDROID_PROJECT_PATH/$PROJECT_NAME/$PROJECT_NAME.aar
echo $ANDROID_PROJECT_PATH/$PROJECT_NAME/$PROJECT_NAME.aar

# Build Android project
#cd $ANDROID_PROJECT_PATH
#./gradlew assembleDebug
