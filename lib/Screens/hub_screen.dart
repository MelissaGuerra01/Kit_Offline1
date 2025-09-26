import 'package:flutter/material.dart';
import '../app_drawer.dart'; //importa el menu

class HubScreen extends StatelessWidget {
  const HubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AppHub Portafolio')),
      drawer: const AppDrawer(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Practicas Anteriores//
              Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                //Ruta de navegacion de las practicas//
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/practices');
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: const Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: [
                        //Lista de Iconos//
                        Icon(
                          Icons.list_alt,
                          size: 50,
                          color: Colors.blueAccent,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Prácticas Anteriores',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Revisa todas las prácticas realizadas.',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Kit Offline//
              Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                //Ruta de navegacion de Kit Offline//
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/kit_offline');
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: const Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      //Iconos de la aplicacion//
                      children: [
                        Icon(Icons.apps, size: 50, color: Colors.green),
                        SizedBox(height: 10),
                        Text(
                          'Proyecto: Kit Offline',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Accede a los 4 módulos del proyecto.',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //Ajustes de las Card//
              const SizedBox(height: 20),
              Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                //Ruta de navegacion de Ajustes//
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/settings');
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: const Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      //Iconos de Ajustes//
                      children: [
                        Icon(Icons.settings, size: 50, color: Colors.grey),
                        SizedBox(height: 10),
                        Text(
                          'Ajustes',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Personaliza la apariencia de la app.',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
