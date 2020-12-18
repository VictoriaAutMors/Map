

# flutter_map

A Dart implementation of map adviser written in Flutter.

## Installation

Add flutter_map to your pubspec:

```yaml
dependencies:
  flutter_map: any # or the latest version on Pub
```

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

## Offline maps

[Follow this guide to grab offline tiles](https://tilemill-project.github.io/tilemill/docs/guides/osm-bright-mac-quickstart/)<br>
Once you have your map exported to `.mbtiles`, you can use [mbtilesToPng](https://github.com/alfanhui/mbtilesToPngs) to unpack into `/{z}/{x}/{y}.png`.
Move this to Assets folder and add asset directories to `pubspec.yaml`. Minimum required fields for offline maps are:

```dart
Widget build(ctx) {
  return FlutterMap(
    options: MapOptions(
      center: LatLng(56.704173, 11.543808),
      zoom: 13.0,
      swPanBoundary: LatLng(56.6877, 11.5089),
      nePanBoundary: LatLng(56.7378, 11.6644),
    ),
    layers: [
      TileLayerOptions(
        tileProvider: AssetTileProvider(),
        urlTemplate: "assets/offlineMap/{z}/{x}/{y}.png",
      ),
    ],
  );
}
```

Make sure PanBoundaries are within offline map boundary to stop missing asset errors.<br>
See the `flutter_map_example/` folder for a working example.

Note that there is also `FileTileProvider()`, which you can use to load tiles from the filesystem.

## Plugins

- [flutter_map_marker_cluster](https://github.com/lpongetti/flutter_map_marker_cluster): Provides Beautiful Animated Marker Clustering functionality
- [user_location](https://github.com/igaurab/user_location_plugin): A plugin to handle and plot the current user location in FlutterMap
- [flutter_map_tappable_polyline](https://github.com/OwnWeb/flutter_map_tappable_polyline): A plugin to add `onTap` callback to `Polyline`
- [lat_lon_grid_plugin](https://github.com/mat8854/lat_lon_grid_plugin): Adds a latitude / longitude grid as plugin to the FlutterMap
- [flutter_map_marker_popup](https://github.com/rorystephenson/flutter_map_marker_popup): A plugin to show customisable popups for markers.
- [map_elevation](https://github.com/OwnWeb/map_elevation): A widget to display elevation of a track (polyline) like Leaflet.Elevation

