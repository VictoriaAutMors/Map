import 'package:flutter/material.dart';

import '../pages/home.dart';
import '../pages/settings.dart';

Widget _buildMenuItem(
    BuildContext context, Widget title, String routeName, String currentRoute) {
  var isSelected = routeName == currentRoute;

  return ListTile(
    title: title,
    selected: isSelected,
    onTap: () {
      if (isSelected) {
        Navigator.pop(context);
      } else {
        Navigator.pushReplacementNamed(context, routeName);
      }
    },
  );
}

Drawer buildDrawer(BuildContext context, String currentRoute) {
  return Drawer(
    child: ListView(
      children: <Widget>[
        const DrawerHeader(
          child: Center(
            child: Text('Menu'),
          ),
        ),
        _buildMenuItem(
          context,
          const Text('Map'),
          HomePage.route,
          currentRoute,
        ),
        _buildMenuItem(context,
            const Text('Settings'),
            Settings.route,
            currentRoute)

      ],
    ),
  );
}
