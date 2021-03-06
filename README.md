# Map Adviser
A Dart implementation of map adviser written in Flutter.

This repository provides an example app for Android devices called Map App that can be used as a starter for your organization's mapping app which was implemented in Flutter. You can use the Map App as is, or extend it.

# Content
* [Development instructions](#devinst)
  * [Android](#android)
  * [Fork the repository](#fork)
  * [Clone the repositiry](#clone)
    * [Command line Git](#gitcl)
  * [Configuring a Remote for a Fork](#remote)
* [Requirements](#req)
* [Run the example](#run)
* [Menu](#menu)
* [Map tiles](#maptiles)
* [Settings UI](#settingsui)
* [Plugins](#plugins)
  * [flutter_map_marker_cluster](#p1)
  * [flutter_map_tappable_polyline](#p3)
  * [lat_lon_grid_plugin](#p4)
* [Dependencies](#dep)

## Development instruction <a name="devinst"></a>

This Maps App repo is an Android Studio Project and App Module that can be directly cloned and imported into Android Studio. In addition, you'll need to follow the steps below to obtain your client id and redirect uri. Both are required for leveraging all the features of the app.

### Android <a name="android"></a>

Ensure the following permission is present in your Android Manifest file, located in `<project root>/android/app/src/main/AndroidManifest.xml`:

```
xml
<uses-permission android:name="android.permission.INTERNET"/>
```
### Fork the repository <a name="fork"></a>

Fork the [Map App](https://github.com/VictoriaAutMors/Map/fork) repository

### Clone the repository <a name="clone"></a>
Once you have forked the repo, you can make a clone

#### Command line Git <a name="gitcl"></a>
1. Clone the Map repo
2. `cd` into the `Map` folder
3. Make your changes and create a [pull request](https://docs.github.com/en/free-pro-team@latest/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request)

### Configuring a Remote for a Fork <a name="remote"></a>

If you make changes in the fork and would like to [sync](https://docs.github.com/en/free-pro-team@latest/github/collaborating-with-issues-and-pull-requests/syncing-a-fork) those changes with the upstream repository, you must first [configure the remote](https://docs.github.com/en/free-pro-team@latest/github/collaborating-with-issues-and-pull-requests/configuring-a-remote-for-a-fork). This will be required when you have created local branches and would like to make a [pull request](https://docs.github.com/en/free-pro-team@latest/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request) to your upstream branch.

1. In the Terminal (for Mac users) or command prompt (for Windows and Linux users) type `git remote -v` to list the current configured remote repo for your fork.
2. `git remote add upstream https://github.com/VictoriaAutMors/Map.git` to specify new remote upstream repository that will be synced with the fork. You can type `git remote -v` to verify the new upstream.

If there are changes made in the Original repository, you can sync the fork to keep it updated with upstream repository.

1. In the terminal, change the current working directory to your local project
2. Type `git fetch upstream` to fetch the commits from the upstream repository
3. `git checkout master` to checkout your fork's local master branch.
4. `git merge upstream/master` to sync your local `master branch` with `upstream/master`. Note: Your local changes will be retained and your fork's master branch will be in sync with the upstream repository.

## Requirements <a name="req"></a>
* [Android Studio](https://developer.android.com/studio)

## Run the example <a name="run"></a>

See the `example/` folder for a working example app.

To run it, in a terminal cd into the folder.
Then execute `ulimit -S -n 2048` ([ref](https://github.com/trentpiercy/trace/issues/1#issuecomment-404494469)).
Then execute `flutter run` with a running emulator.

Make sure PanBoundaries are within offline map boundary to stop missing asset errors.<br>
See the `flutter_map_example/` folder for a working example.

Note that there is also `FileTileProvider()`, which you can use to load tiles from the filesystem.

## Menu <a name="menu"></a>
The menu consists of three components:
1. Map
2. Attendings (in progress)
3. Settings

![menu](images/menu.jpg)

## Map tiles <a name="maptiles"></a>

In OSM the term is much more likely to refer to 'map tiles':
- square bitmap graphics displayed in a grid arrangement to show a map
- We may also be talking about tiled map data.

Map tiles are typically 256×256 pixel images. 

Tiles are not always in these dimensions; for example there could be 64×64 pixel images for mobile use, however 256×256 pixel images are a de facto standard. 512×512 pixel seems to be the usual size of high-resolution tiles.

A "tileset" typically includes enough tiles to form a very large image, if they were shown all at once, and also several zoom levels. Generally the idea is not to show them all at once, but to display a particular area of the map on a website. 

![map](images/map.jpg)

## Settings UI <a name="settingsui"></a>

For Android, this plugin currently supports 
1. Changing language
2. Adding phone number and email address
3. Toggling between Dark and Light mode

![settings](images/settings.jpg)

## Plugins <a name="plugins"></a>

#### [flutter_map_marker_cluster](https://github.com/lpongetti/flutter_map_marker_cluster): <a name="p1"></a>
Provides Beautiful Animated Marker Clustering functionality 
#### [flutter_map_tappable_polyline](https://github.com/OwnWeb/flutter_map_tappable_polyline):  <a name="p3"></a>
A plugin to add `onTap` callback to `Polyline`
#### [lat_lon_grid_plugin](https://github.com/mat8854/lat_lon_grid_plugin): <a name="p4"></a>
Adds a latitude / longitude grid as plugin to the FlutterMap

## Dependencies: <a name="dep"></a>

```yaml
dependencies:
  flutter_map: ^0.10.1+1
  tuple: ^1.0.2
  device_preview: ^0.5.5
  font_awesome_flutter: ^8.10.1
  latlong: ^0.6.1
  positioned_tap_detector: ^1.0.2
  transparent_image: ^1.0.0
  async: ^2.1.0
  flutter_image: ^3.0.0
  cached_network_image: ^2.0.0
  path_provider: ^1.6.7
  vector_math: ^2.0.0
  proj4dart: ^1.0.4
  meta: ^1.1.0
```
  
