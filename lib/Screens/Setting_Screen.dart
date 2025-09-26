import 'package:flutter/material.dart';
import '../../app_drawer.dart';

class SettingsScreen extends StatelessWidget {
  final Function toggleTheme;

  const SettingsScreen({super.key, required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ajustes')),
      drawer: const AppDrawer(),
      body: ListView(
        children: <Widget>[
          SwitchListTile(
            title: const Text('Modo oscuro'),
            value: Theme.of(context).brightness == Brightness.dark,
            onChanged: (bool value) {
              toggleTheme();
            },
            secondary: Icon(
              Theme.of(context).brightness == Brightness.dark
                  ? Icons.dark_mode
                  : Icons.light_mode,
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('Acerca de'),
            onTap: () {
              showAboutDialog(
                context: context,
                applicationName: 'AppHub Portafolio',
                applicationVersion: '1.0.0',
                applicationIcon: const Icon(Icons.apps),
                children: <Widget>[const Text('Desarrollado por MG.')],
              );
            },
          ),
        ],
      ),
    );
  }
}
