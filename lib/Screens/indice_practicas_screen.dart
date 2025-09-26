import 'package:flutter/material.dart';
import '../app_drawer.dart';

class PracticesIndexScreen extends StatelessWidget {
  const PracticesIndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Índice de Prácticas')),
      drawer: const AppDrawer(),
      body: ListView(
        children: <Widget>[
          _buildPracticeListTile(
            context,
            'Práctica 1: 10 Hola Mundo',
            '/practice/hello_world_ten',
          ),
          _buildPracticeListTile(
            context,
            'Práctica 2: Agregar Hola Mundo',
            '/practice/hello_world_add',
          ),
          _buildPracticeListTile(
            context,
            'Práctica 3: Formulario de Registro',
            '/practice/registration_form',
          ),
          _buildPracticeListTile(
            context,
            'Práctica 4: Juego',
            '/practice/rock_paper_scissors',
          ),
          // Añade más prácticas aquí si tienes más
        ],
      ),
    );
  }

  Widget _buildPracticeListTile(
    BuildContext context,
    String title,
    String routeName,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(title),
        trailing: const Icon(Icons.chevron_right),
        onTap: () {
          Navigator.pushNamed(context, routeName);
        },
      ),
    );
  }
}
