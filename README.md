# Xamarin Embedding Starter Kit

[.NET Embedding](https://docs.microsoft.com/en-us/xamarin/tools/dotnet-embedding/) starter kit for mobile development.

## Requirements

- Android (Java):
  - Xamarin.Android 7.5 or later
  - Android Studio 3.x with Java 1.8
- iOS (Obj-C):
  - macOS 10.12 (Sierra) or later
  - Xcode 8.3.2 or later
  - Mono 5.0

> Android NDK v15 ([Embeddinator-4000/issues#574](https://github.com/mono/Embeddinator-4000/issues/574))

## Features

- Shared code;
- Navigation between Xamarin and Native;
- Tests

## Structure

Main folders of starter kit:

- `e4k` - sources of E4K as submodule;
- `dotnet` - shared .NET code & Xamarin libraries for Android and iOS;
- `android` - sample Android project (Java);
- `ios` - sample iOS project (Obj-C).

## Getting started

1. Clone the repository with submodules;
2. Build E4K from sources ([see below](#build-e4k-from-sources));
3. Open `dotnet/DotNet.sln` via Visual Studio for Mac;
4. Write your code, compile in Release;
5. Execute scripts for embedding ([see below](#embedding));
6. Open Android/iOS native projects for the check.

## Build E4K from sources

`./build-e4k.sh` - build E4K from sources (default: all)
  - android - parameter for build only for Android (`./build-e4k.sh android`)
  - ios - parameter for build only for iOS (`./build-e4k.sh ios`)

## Embedding

Before embedding to the native libraries need to build projects with Visual Studio with Release configuration.

`./build-android.sh` - embedding **DotNet.AndroidLibrary** to **aar** and copy to Android native project folder;

`./build-ios.sh` - embedding **DotNet.IosLibrary** to **framework** and copy to iOS native project folder;

### Output folders

- `output-android/` - E4K generated output for Android library.
- `output-ios/` - E4K generated output for iOS library.

## Troubleshoots

Most problems related to E4K and dependencies, see here: https://github.com/mono/Embeddinator-4000/issues

## Additional info

- `.framework` size: https://github.com/mono/Embeddinator-4000/issues/601#issuecomment-370909815
- limitations with arrays on Android: https://github.com/mono/Embeddinator-4000/pull/508


&nbsp;

---
&copy; 2018 Yauheni Pakala | MIT
