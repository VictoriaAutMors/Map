import 'package:flutter/material.dart';
import 'package:map/pages/settings_screen.dart';

import './pages/home.dart';
import './pages/widgets.dart';
import './pages/settings_screen.dart';
import 'package:sqflite/sqflite.dart';

void main() => runApp(MyApp());

class Coordinates {
  final int height;
  final int width;
  Coordinates({this.height, this.width});
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Map Example',
      theme: ThemeData(primarySwatch: mapBoxBlue, brightness: Brightness.light),
      darkTheme:
          ThemeData(primarySwatch: mapBoxBlue, brightness: Brightness.dark),
      home: HomePage(),
      routes: <String, WidgetBuilder>{
        WidgetsPage.route: (context) => WidgetsPage(),
        SettingsScreen.route: (context) => SettingsScreen(),
      },
    );
  }
}

const int _bluePrimary = 0xFF395afa;
const MaterialColor mapBoxBlue = MaterialColor(
  _bluePrimary,
  <int, Color>{
    50: Color(0xFFE7EBFE),
    100: Color(0xFFC4CEFE),
    200: Color(0xFF9CADFD),
    300: Color(0xFF748CFC),
    400: Color(0xFF5773FB),
    500: Color(_bluePrimary),
    600: Color(0xFF3352F9),
    700: Color(0xFF2C48F9),
  },
);
