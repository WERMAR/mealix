import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../modules/home/pages/household_manager_page.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.home),
            title: Text(local.menuHouseholdManager),
            onTap: () {
              Navigator.of(context).pop();
              context.push(HouseholdManagerPage.routeLocation);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text(local.menuSettings),
            onTap: () => print("Settings pressed"),
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: Text(local.menuAbout),
            onTap: () => print("About pressed"),
          ),
        ],
      ),
    );
  }
}
