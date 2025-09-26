import 'package:flutter/material.dart'; //importa la biblioteca de Flutter
import '../../app_drawer.dart'; //importa el menu

class KitOfflineScreen extends StatelessWidget {
  const KitOfflineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kit Offline')),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(
          16.0,
        ), //crea una cuadrícula con un número fijo de columnas.
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildModuleCard(
              // Llama a la función auxiliar para construir cada tarjeta de módulo.
              context,
              title: 'Notas Rápidas',
              icon: Icons.note_add_rounded,
              color: Colors.blueAccent,
              route: '/notes',
            ),
            _buildModuleCard(
              context,
              title: 'Calculadora de IMC',
              icon: Icons.monitor_weight_rounded,
              color: Colors.green,
              route: '/imc',
            ),
            _buildModuleCard(
              context,
              title: 'Galería Local',
              icon: Icons.photo_library_rounded,
              color: Colors.orange,
              route: '/gallery',
            ),
            _buildModuleCard(
              context,
              title: 'Juego: Par o Impar',
              icon: Icons.casino_rounded,
              color: Colors.purple,
              route: '/odd_even',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildModuleCard(
    // Función auxiliar privada para construir una tarjeta de módulo.
    BuildContext context, {
    required String title,
    required IconData icon,
    required Color color,
    required String route,
  }) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        borderRadius: BorderRadius.circular(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 60, color: color),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
