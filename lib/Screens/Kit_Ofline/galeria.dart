import 'package:flutter/material.dart'; // Importa la biblioteca de Flutter.
import '../../app_drawer.dart'; // Importa el menú

class LocalGalleryScreen extends StatelessWidget {
  const LocalGalleryScreen({super.key});

  final List<String> _imagePaths = const [
    // Lista de rutas a las imágenes locales.
    'assets/imagenes/Img1.jpeg',
    'assets/imagenes/Img2.jpeg',
    'assets/imagenes/Img3.jpeg',
    'assets/imagenes/Img5.jpeg',
    'assets/imagenes/Img6.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Galería Local')),
      drawer: const AppDrawer(),
      body: GridView.builder(
        // GridView.builder construye la cuadrícula de forma dinámica.
        padding: const EdgeInsets.all(8.0),
        // Define la estructura
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: _imagePaths.length, // Número de imágenes en la lista.
        itemBuilder: (context, index) {
          return GestureDetector(
            // GestureDetector detecta toques
            onTap: () {
              showDialog(
                // Muestra un diálogo al tocar una imagen.
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Imagen ${index + 1}'),
                    content: Image.asset(_imagePaths[index]),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Cerrar'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: Hero(
              tag: 'imageHero${index + 1}',
              // Muestra la imagen local desde los assets.
              child: Image.asset(_imagePaths[index], fit: BoxFit.cover),
            ),
          );
        },
      ),
    );
  }
}
