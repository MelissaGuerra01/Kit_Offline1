import 'package:flutter/material.dart'; //importa la bilioteca de Flutter
import '../../app_drawer.dart'; //importa el menu

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

//Clases de Estado
class _NotesScreenState extends State<NotesScreen> {
  final List<String> _notes = [];
  final TextEditingController _textController = TextEditingController();

  void _addNote() {
    //Funcion para agregar una nueva nota
    if (_textController.text.isNotEmpty) {
      setState(() {
        _notes.add(_textController.text);
      });
      _textController.clear();
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Nota agregada')));
    }
  }

  //Funcion para borrar las notas
  void _clearAllNotes() {
    // se actualiza la UI
    setState(() {
      _notes.clear();
    });
    //muestra un mensaje de onfirmacion
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Todas las notas han sido borradas')),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notas rápidas'),
        actions: [
          //boton de borrado
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: _clearAllNotes,
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
        //Construye la lista de notas
        itemCount: _notes.length,
        itemBuilder: (context, index) {
          return Card(
            //crea una Card para cada nota
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(title: Text(_notes[index])),
          );
        },
      ),
      //boton para agregar una nota
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Nueva Nota'),
                content: TextField(
                  controller: _textController,
                  decoration: const InputDecoration(
                    hintText: 'Escribe tu nota aquí...',
                  ),
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Cancelar'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text('Agregar'),
                    onPressed: () {
                      _addNote(); //llama a la funcio para agregar la nota
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
