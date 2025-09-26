import 'dart:math';
import 'package:flutter/material.dart';
import '../../app_drawer.dart';

// Clase del juego de Piedra, Papel o Tijera.
class RockPaperScissorsScreen extends StatefulWidget {
  const RockPaperScissorsScreen({super.key});

  @override
  State<RockPaperScissorsScreen> createState() =>
      _RockPaperScissorsScreenState();
}

class _RockPaperScissorsScreenState extends State<RockPaperScissorsScreen> {
  late GameChoice _userChoice;
  late GameChoice _deviceChoice;
  String _result = 'Elige una opción para empezar';
  int _userScore = 0;
  int _deviceScore = 0;

  final List<GameChoice> _choices = [
    GameChoice.rock,
    GameChoice.paper,
    GameChoice.scissors,
  ];

  void _playRound(GameChoice userChoice) {
    final random = Random();
    final deviceChoice = _choices[random.nextInt(_choices.length)];

    String resultMessage;
    if (userChoice == deviceChoice) {
      resultMessage = '¡Empate!';
    } else if ((userChoice == GameChoice.rock &&
            deviceChoice == GameChoice.scissors) ||
        (userChoice == GameChoice.paper && deviceChoice == GameChoice.rock) ||
        (userChoice == GameChoice.scissors &&
            deviceChoice == GameChoice.paper)) {
      resultMessage = '¡Ganaste!';
      _userScore++;
    } else {
      resultMessage = '¡Perdiste!';
      _deviceScore++;
    }

    setState(() {
      _userChoice = userChoice;
      _deviceChoice = deviceChoice;
      _result = resultMessage;
    });
  }

  void _resetScore() {
    setState(() {
      _userScore = 0;
      _deviceScore = 0;
      _result = 'Elige una opción para empezar';
    });
  }

  String _getEmoji(GameChoice choice) {
    switch (choice) {
      case GameChoice.rock:
        return '🪨';
      case GameChoice.paper:
        return '📄';
      case GameChoice.scissors:
        return '✂️';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Piedra, Papel o Tijera')),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Sección de marcador
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Text(
                      'Usuario',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '$_userScore',
                      style: const TextStyle(fontSize: 48, color: Colors.green),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      'Dispositivo',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      '$_deviceScore',
                      style: const TextStyle(fontSize: 48, color: Colors.red),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
            // Mensaje de resultado
            Text(
              _result,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            // Elecciones de la ronda
            if (_result != 'Elige una opción para empezar')
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tu elección: ${_getEmoji(_userChoice)}',
                    style: const TextStyle(fontSize: 28),
                  ),
                  const SizedBox(width: 20),
                  Text(
                    'App: ${_getEmoji(_deviceChoice)}',
                    style: const TextStyle(fontSize: 28),
                  ),
                ],
              ),
            const SizedBox(height: 40),
            // Botones para jugar
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildChoiceButton(GameChoice.rock),
                _buildChoiceButton(GameChoice.paper),
                _buildChoiceButton(GameChoice.scissors),
              ],
            ),
            const SizedBox(height: 40),
            // Botón para reiniciar el marcador
            ElevatedButton.icon(
              onPressed: _resetScore,
              icon: const Icon(Icons.refresh),
              label: const Text('Reiniciar Marcador'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChoiceButton(GameChoice choice) {
    return ElevatedButton(
      onPressed: () => _playRound(choice),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(_getEmoji(choice), style: const TextStyle(fontSize: 50)),
    );
  }
}

enum GameChoice { rock, paper, scissors }
