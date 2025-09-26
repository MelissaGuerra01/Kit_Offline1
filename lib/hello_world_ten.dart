import 'package:flutter/material.dart';

// Pantalla de los 10 "Hola Mundo" con botón para mostrar/ocultar
class HelloWorldTenTimesScreen extends StatefulWidget {
  const HelloWorldTenTimesScreen({super.key});

  @override
  State<HelloWorldTenTimesScreen> createState() =>
      _HelloWorldTenTimesScreenState();
}

class _HelloWorldTenTimesScreenState extends State<HelloWorldTenTimesScreen> {
  bool showMessages = false;

  final List<String> messages = List.generate(
    10,
    (index) => 'Hola Mundo ${index + 1}',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('10 Hola Mundo')),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  showMessages = !showMessages;
                });
              },
              child: Text(
                showMessages ? 'Ocultar Hola Mundo' : 'Mostrar Hola Mundo',
              ),
            ),
          ),
          const SizedBox(height: 20),
          if (showMessages)
            Expanded(
              child: ListView.builder(
                itemCount: messages.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    messages[index],
                    style: const TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
