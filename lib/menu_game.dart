import 'package:flutter/material.dart';
import '../../app_drawer.dart';

// Pantalla principal de la Práctica 5 con el menú de navegación.
class MenuGameScreen extends StatelessWidget {
  const MenuGameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Práctica 5')),
      drawer: const AppDrawer(), // Aquí se inserta el Drawer
      body: const Center(
        child: Text(
          '¡Bienvenido a la Práctica 5!\nUsa el menú de hamburguesa para navegar.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
