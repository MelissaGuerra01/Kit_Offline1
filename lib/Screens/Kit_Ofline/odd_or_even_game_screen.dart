//importa las bibliotecas de Flutter y dart:math//
import 'dart:math';
import 'package:flutter/material.dart';
import '../../app_drawer.dart'; //importa el menu//

class OddOrEvenGameScreen extends StatefulWidget {
  const OddOrEvenGameScreen({super.key});

  @override
  State<OddOrEvenGameScreen> createState() => _OddOrEvenGameScreenState();
}

class _OddOrEvenGameScreenState extends State<OddOrEvenGameScreen> {
  String _userChoice = ''; //eleccion de usuario
  int _userNumber = -1; //numero elegido por el usuario
  int _cpuNumber = 0; //numero aleatorio de la Maquina
  int _userScore = 0; //puntuacion del usuario
  int _cpuScore = 0; //puntuacion para la Maquina

  void _playGame() {
    //funcion logica del juego
    if (_userChoice.isEmpty || _userNumber == -1) {
      //Verificacion que el usuario haya elegido
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          //muestra un mesaje de advertencia
          content: Text('Por favor, elige par/impar y un número.'),
        ),
      );
      return;
    }

    setState(() {
      _cpuNumber = Random().nextInt(6); //genera numeros Aleatorios entre 0 y 5
      final sum = _userNumber + _cpuNumber;
      final isEven = sum % 2 == 0; //calcula la suma de los numeros
      final isUserWinner =
          (_userChoice == 'par' && isEven) ||
          (_userChoice == 'impar' && !isEven);

      String resultMessage =
          'Tú elegiste $_userChoice y $_userNumber, la CPU eligió $_cpuNumber. '
          'La suma es $sum, que es ${isEven ? 'par' : 'impar'}.';

      if (isUserWinner) {
        _userScore++;
        resultMessage += ' ¡Ganaste!';
      } else {
        _cpuScore++;
        resultMessage += ' ¡Perdiste!';
      }

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(resultMessage)));
    });
  }

  void _resetGame() {
    //Funcion Reiniciar Marcador
    setState(() {
      _userScore = 0;
      _cpuScore = 0;
      _userChoice = '';
      _userNumber = -1;
    });
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Marcador reiniciado.')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Juego: Par o Impar')),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text('Elige Par o Impar', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              //opcion 'par'
              children: [
                ChoiceChip(
                  label: const Text('Par'),
                  selected: _userChoice == 'par',
                  onSelected: (selected) {
                    setState(() {
                      _userChoice = selected ? 'par' : '';
                    });
                  },
                ),
                //opcion 'impar'
                const SizedBox(width: 10),
                ChoiceChip(
                  label: const Text('Impar'),
                  selected: _userChoice == 'impar',
                  onSelected: (selected) {
                    setState(() {
                      _userChoice = selected ? 'impar' : '';
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text('Elige tu número (0-5)', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              children: List.generate(6, (index) {
                return ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _userNumber = index;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    //estilos del boton
                    backgroundColor: _userNumber == index
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.surface,
                    foregroundColor: _userNumber == index
                        ? Theme.of(context).colorScheme.onPrimary
                        : Theme.of(context).colorScheme.onSurface,
                  ),
                  child: Text('$index'),
                );
              }),
            ),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: _playGame, child: const Text('Jugar')),
            const SizedBox(height: 20),
            //muestra el marcador
            Text(
              'Marcador: Tú $_userScore - $_cpuScore CPU',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            //boton para reiniciar el marcador
            OutlinedButton(
              onPressed: _resetGame,
              child: const Text('Reiniciar Marcador'),
            ),
          ],
        ),
      ),
    );
  }
}
