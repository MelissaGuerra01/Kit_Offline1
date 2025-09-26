import 'package:flutter/material.dart';
//import 'Screens/Kit_Ofline/notes.dart';
//import 'package:flutter_application_1/Screens/Setting_Screen.dart';
//import 'package:flutter_application_1/Screens/hub_screen.dart';
import 'screens/hub_screen.dart';
import 'screens/indice_practicas_screen.dart';
import 'screens/Setting_Screen.dart';
import 'screens/Kit_Ofline/kit_offline_screen.dart';
import 'screens/Kit_Ofline/notes.dart';
import 'screens/Kit_Ofline/Calculadora1.dart';
import 'screens/Kit_Ofline/galeria.dart';
import 'screens/Kit_Ofline/odd_or_even_game_screen.dart';

// Archivos de prácticas, a ser reemplazados con los tuyos
import 'hello_world_ten.dart';
import 'hello_world_add.dart';
import 'registration_form.dart';
import 'rock_paper_scissors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // El tema inicial debe ser el del sistema, como se indica en las instrucciones
  ThemeMode _themeMode = ThemeMode.system;

  void toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light
          ? ThemeMode.dark
          : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AppHub Portafolio',
      // Esto elimina la etiqueta de "DEBUG"
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      // Esta línea controla el cambio de tema
      themeMode: _themeMode,
      initialRoute: '/',
      routes: {
        '/': (context) => const HubScreen(),
        '/practices': (context) => const PracticesIndexScreen(),
        '/settings': (context) => SettingsScreen(toggleTheme: toggleTheme),
        '/kit_offline': (context) => const KitOfflineScreen(),
        '/notes': (context) => const NotesScreen(),
        '/imc': (context) => const IMCCalculatorScreen(),
        '/gallery': (context) => const LocalGalleryScreen(),
        '/odd_even': (context) => const OddOrEvenGameScreen(),

        // Rutas de prácticas. Estas clases se reemplazarán por tus archivos
        '/practice/hello_world_ten': (context) =>
            const HelloWorldTenTimesScreen(),
        '/practice/hello_world_add': (context) => const HelloWorldAddScreen(),
        '/practice/registration_form': (context) =>
            const RegistrationFormScreen(),
        '/practice/rock_paper_scissors': (context) =>
            const RockPaperScissorsScreen(),
      },
    );
  }
}
