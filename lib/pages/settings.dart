import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

import 'settings_screen.dart';

class Settings extends StatelessWidget {
  static const String route = '/settings';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      title: 'Settings',
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

