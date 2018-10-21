# .NET Embedding Starter Kit
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

## Structure

Main folders of starter kit:

- `e4k` - sources of E4K as submodule;
- `dotnet` - Xamarin libraries for Android and iOS;
- `android` - Android sample project (Java);
- `ios` - iOS sample project (Obj-C).

## Getting started

1. Build E4K from sources ([see below](#build-e4k-from-sources));
2. Open `dotnet/DotNet.sln` via Visual Studio for Mac;
3. Write your code, compile in Release;
4. Execute scripts for embedding ([see below](#embedding));
5. Open Android/iOS native projects for the check.

## Build E4K from sources

Build for Android:

```sh
./build-e4k.sh android
```

Build for iOS:

```sh
./build-e4k.sh ios
```

Build for all:

```sh
./build-e4k.sh
```

## Embedding

`./build-android.sh` - embedding **DotNet.AndroidLibrary** to **aar** and copy to Android native project folder;

`./build-ios.sh` - embedding **DotNet.IosLibrary** to **framework** and copy to iOS native project folder;

## Troubleshoots

Most problems related to E4K and dependencies, see here: https://github.com/mono/Embeddinator-4000/issues

&nbsp;

---
&copy; 2018 Yauheni Pakala | MIT