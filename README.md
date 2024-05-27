# 🔍 WayFinder

*A new way to find your way*

## 🤔 What is this app for?

The purpose of Way Finder is to use its full potential in finding a path from point A to point B using the points it generates. The path finding algorithm prioritizes to keep the length between points as short as possible, so the path may not be the shortest, but the shapes created can be amazing.

## ▶️ How to run?

#### For compiled binaries go to [Releases](https://github.com/vilible/way_finder/releases).

### 🖥️ Windows

1. Install [Flutter SDK](https://flutter.dev/) and the latest version of [Visual Studio IDE](https://visualstudio.microsoft.com/pl/) with **Desktop development with C++** workload that allows you to run apps on Windows
2. In a CMD with a path set to the project folder, run this command:
    ```
    flutter build windows
    ```
3. In `<project>\build\windows\x64\runner\Release` you can find a compiled executable that you can run
4. Have fun with ***WayFinder***!

### 📱 Android

1. Install [Flutter SDK](https://flutter.dev/) and the latest version of [Android Studio](https://developer.android.com/studio) that allows you to compile apps on Android
2. In a CMD with a path set to the project folder, run this command:
    ```
    flutter build apk
    ```
3. In `<project>\build\app\outputs\flutter-apk` you can find a compiled APK that you can run on your mobile phone
4. Have fun with ***WayFinder***!

## 📝 Current plans

- [x] Port the app on Android devices respecting the Material 3 design rules,
- [ ] Add ability to change colors of different graph elements
- [x] Optimize points generation and path finding