import 'package:flutter/material.dart';

// Pantalla con el botón flotante "+"
class HelloWorldAddScreen extends StatefulWidget {
  const HelloWorldAddScreen({super.key});

  @override
  State<HelloWorldAddScreen> createState() => _HelloWorldAddScreenState();
}

class _HelloWorldAddScreenState extends State<HelloWorldAddScreen> {
  List<String> helloWorldMessages = [];

  void addHelloWorld() {
    setState(() {
      helloWorldMessages.add('Hola Mundo ${helloWorldMessages.length + 1}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agregar Hola Mundo')),
      floatingActionButton: FloatingActionButton(
        onPressed: addHelloWorld,
        child: const Icon(Icons.add),
      ),
      body: helloWorldMessages.isEmpty
          ? const Center(child: Text('Presiona "+" para agregar mensajes'))
          : ListView.builder(
              itemCount: helloWorldMessages.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  helloWorldMessages[index],
                  style: const TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
    );
  }
}
