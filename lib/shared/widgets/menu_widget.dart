import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => print("Settings pressed"),
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () => print("About pressed"),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Household Manager'),
            onTap: () => print('Take me to household'),
          ),
        ],
      ),
    );
  }
}
