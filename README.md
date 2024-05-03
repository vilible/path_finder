# 🔍 WayFinder

*A new way to find your way*

# 🤔 What is this app for?

The purpose of Way Finder is to use its full potential in finding a path from point A to point B using the points it generates. The path finding algorithm prioritizes to keep the length between points as short as possible, so the path may not be the shortest, but the shapes created can be amazing.

# ▶️ How to run?

#### For compiled binaries go to [Releases](https://github.com/vilible/way_finder/releases).

But, if you want to compile it yourself:
1. First of all, you need to install Flutter SDK from you [this](https://flutter.dev) website.
2. Then, you have to go to project folder and install all used packages:

    ```
    flutter pub get
    ```

3. After all these steps you can simply run the app by using this command:

    ```
    flutter run -d windows
    ```
<br>

Alternatively, if you want to build it:
1. Install the latest version of Visual Studio IDE with **Desktop development with C++** workload;
2. In a CMD with a path set to the project folder, run this command:
   
    ```
    flutter build windows
    ```

    That command compiles files to an executable where you can find in `<project_directory>\build\windows\x64\runner\Release`;
3. Have fun with ***Way Finder***!

# 📝 Current plans

- [ ] Port the app on Android devices respecting the Material 3 design rules,
- [ ] Add ability to change colors of different graph elements
- [ ] Move from Material 3 to Fluent 2 design on Windows,
- [ ] Optimize points generetion and path finding using (the algorithm used in ***Way Finder*** is required for the application to function as it was created, and the use of other path finding algorithms that would undoubtedly be more efficient than the one used in the program, such as Dijkstra's algorithm or the A* search algorithm, could change the operation of the application in a way undesirable)