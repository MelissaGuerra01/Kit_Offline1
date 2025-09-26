import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blueGrey),
            child: Text(
              'Menú del Portafolio',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Inicio (Hub)'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          ListTile(
            leading: const Icon(Icons.list_alt),
            title: const Text('Índice de Prácticas'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/practices');
            },
          ),
          ExpansionTile(
            leading: const Icon(Icons.apps),
            title: const Text('Proyecto: Kit Offline'),
            children: <Widget>[
              ListTile(
                title: const Text('Notas rápidas'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/notes');
                },
              ),
              ListTile(
                title: const Text('Calculadora de IMC'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/imc');
                },
              ),
              ListTile(
                title: const Text('Galería local'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/gallery');
                },
              ),
              ListTile(
                title: const Text('Juego: Par o Impar'),
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/odd_even');
                },
              ),
            ],
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Ajustes'),
            onTap: () {
              Navigator.pushReplacementNamed(context, '/settings');
            },
          ),
        ],
      ),
    );
  }
}
