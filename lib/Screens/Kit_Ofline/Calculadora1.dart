import 'package:flutter/material.dart'; // Importa la biblioteca de Flutter.
import '../../app_drawer.dart'; // Importa el menú

// Maneja los campos de texto y el resultado.
class IMCCalculatorScreen extends StatefulWidget {
  const IMCCalculatorScreen({super.key});

  @override
  State<IMCCalculatorScreen> createState() => _IMCCalculatorScreenState();
}

// Clase de estado para IMCCalculatorScreen.
class _IMCCalculatorScreenState extends State<IMCCalculatorScreen> {
  // validacion del formulario.
  final _formKey = GlobalKey<FormState>();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  // Función para calcular el IMC.
  void _calculateIMC() {
    // Valida el formulario. Si es válido, continúa.
    if (_formKey.currentState!.validate()) {
      final double weight = double.parse(_weightController.text);
      final double height = double.parse(_heightController.text);
      final double imc = weight / (height * height);

      String category;
      Color color;

      // Asigna la categoría y el color según el valor del IMC.
      if (imc < 18.5) {
        category = 'Bajo peso';
        color = Colors.blue;
      } else if (imc < 24.9) {
        category = 'Peso normal';
        color = Colors.green;
      } else if (imc < 29.9) {
        category = 'Sobrepeso';
        color = Colors.orange;
      } else {
        category = 'Obesidad';
        color = Colors.red;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Tu IMC es: ${imc.toStringAsFixed(2)} ($category)'),
          backgroundColor: color,
        ),
      );
    }
  }

  // Función para limpiar los campos del formulario.
  void _clearForm() {
    // Reinicia el estado del formulario.
    _formKey.currentState!.reset();
    _heightController.clear();
    _weightController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora de IMC')),
      drawer: const AppDrawer(),
      // Permite que la pantalla sea desplazable.
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _heightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Estatura (m)',
                    border: OutlineInputBorder(),
                    hintText: 'Ej. 1.75',
                  ),
                  // Función de validación del campo.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingresa tu estatura';
                    }
                    if (double.tryParse(value) == null ||
                        double.parse(value) <= 0) {
                      return 'Ingresa un número positivo válido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _weightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Peso (kg)',
                    border: OutlineInputBorder(),
                    hintText: 'Ej. 70.5',
                  ),
                  // Función de validación del campo.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, ingresa tu peso';
                    }
                    if (double.tryParse(value) == null ||
                        double.parse(value) <= 0) {
                      return 'Ingresa un número positivo válido';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: _clearForm,
                        child: const Text('Limpiar'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      // Botón para calcular el IMC.
                      child: ElevatedButton(
                        onPressed: _calculateIMC,
                        child: const Text('Calcular'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
