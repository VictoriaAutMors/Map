# Map Adviser
A Dart implementation of map adviser written in Flutter. 
This repository provides an example app for Android devices called Map App that can be used as a starter for your organization's mapping app which was implemented in Flutter. You can use the Map App as is, or extend it.

### Android

Ensure the following permission is present in your Android Manifest file, located in `<project root>/android/app/src/main/AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.INTERNET"/>
```

## Usage

Configure the map using `MapOptions` and layer options:

```dart
Widget build(BuildContext context) {
  return new FlutterMap(
    options: new MapOptions(
      center: new LatLng(51.5, -0.09),
      zoom: 13.0,
    ),
    layers: [
      new TileLayerOptions(
        urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
        subdomains: ['a', 'b', 'c']
      ),
      new MarkerLayerOptions(
        markers: [
          new Marker(
            width: 80.0,
            height: 80.0,
            point: new LatLng(51.5, -0.09),
            builder: (ctx) =>
            new Container(
              child: new FlutterLogo(),
            ),
          ),
        ],
      ),
    ],
  );
}
```

Alternatively initialize the map by specifying bounds instead of center and zoom.

```dart
MapOptions(
  bounds: LatLngBounds(LatLng(58.8, 6.1), LatLng(59, 6.2)),
  boundsOptions: FitBoundsOptions(padding: EdgeInsets.all(8.0)),
),
```


## Run the example

See the `example/` folder for a working example app.

To run it, in a terminal cd into the folder.
Then execute `ulimit -S -n 2048` ([ref](https://github.com/trentpiercy/trace/issues/1#issuecomment-404494469)).
Then execute `flutter run` with a running emulator.

Make sure PanBoundaries are within offline map boundary to stop missing asset errors.<br>
See the `flutter_map_example/` folder for a working example.

Note that there is also `FileTileProvider()`, which you can use to load tiles from the filesystem.

## Settings UI

### Basic Usage:
```
SettingsList(
        sections: [
          SettingsSection(
            title: 'Section',
            tiles: [
              SettingsTile(
                title: 'Language',
                subtitle: 'English',
                leading: Icon(Icons.language),
                onPressed: (BuildContext context) {},
              ),
              SettingsTile.switchTile(
                title: 'Use fingerprint',
                leading: Icon(Icons.fingerprint),
                switchValue: value,
                onToggle: (bool value) {},
              ),
            ],
          ),
        ],
      )
```

### Settings UI supports dark mode (in progress)

### Example 
```
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'screens/settings_screen.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: kIsWeb ? false : !kReleaseMode,
      builder: (_) => MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      locale: DevicePreview.of(context).locale,
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'Settings UI Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.deepPurple,
        brightness: Brightness.dark,
      ),
      home: SettingsScreen(),
    );
  }
}
```

## Map tiles

In OSM the term is much more likely to refer to 'map tiles':
- square bitmap graphics displayed in a grid arrangement to show a map
- We may also be talking about tiled map data.

Map tiles are typically 256×256 pixel images. 

Tiles are not always in these dimensions; for example there could be 64×64 pixel images for mobile use, however 256×256 pixel images are a de facto standard. 512×512 pixel seems to be the usual size of high-resolution tiles.

A "tileset" typically includes enough tiles to form a very large image, if they were shown all at once, and also several zoom levels. Generally the idea is not to show them all at once, but to display a particular area of the map on a website. 



## Plugins

#### [flutter_map_marker_cluster](https://github.com/lpongetti/flutter_map_marker_cluster): 
Provides Beautiful Animated Marker Clustering functionality
#### [user_location](https://github.com/igaurab/user_location_plugin): 
A plugin to handle and plot the current user location in FlutterMap
#### [flutter_map_tappable_polyline](https://github.com/OwnWeb/flutter_map_tappable_polyline): 
A plugin to add `onTap` callback to `Polyline`
#### [lat_lon_grid_plugin](https://github.com/mat8854/lat_lon_grid_plugin): 
Adds a latitude / longitude grid as plugin to the FlutterMap
#### [flutter_map_marker_popup](https://github.com/rorystephenson/flutter_map_marker_popup): 
A plugin to show customisable popups for markers.
#### [map_elevation](https://github.com/OwnWeb/map_elevation): 
A widget to display elevation of a track (polyline) like Leaflet.Elevation

### Installing: 
In your pubspec.yaml

```
dependencies:
  settings_ui: ^0.5.0
```

#### Add flutter_map to your pubspec:

```yaml
dependencies:
  flutter_map: 
```
