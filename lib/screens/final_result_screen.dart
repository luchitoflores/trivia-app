// archivo final_result_screen.dart
import 'package:flutter/material.dart';
import 'package:trivia_app_flutter/widgets/custom_app_bar.dart';
import 'package:trivia_app_flutter/widgets/custom_panel.dart'; // Asegúrate de que esta importación sea correcta

class FinalResultScreen extends StatelessWidget {
  final bool aprobado;
  final int stars;
  final int totalQuestions;
  final int correctAnswers;
  final int timeLeft;

  const FinalResultScreen({
    Key? key,
    required this.aprobado,
    required this.stars,
    required this.totalQuestions,
    required this.correctAnswers,
    required this.timeLeft,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Resultado",
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                aprobado ? '¡Felicidades!' : 'Lo siento, no has aprobado.',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: aprobado ? Colors.green : Colors.red,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return Icon(
                    index < stars ? Icons.star : Icons.star_border,
                    color: index < stars ? Colors.yellow : Colors.grey,
                    size: 30,
                  );
                }),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Panel amarillo (Exp ganada al aprobar el nivel) con icono de energía
                  CustomPanel(
                    color: const Color.fromARGB(255, 225, 204, 12),
                    title: 'Exp Ganada',
                    result: '${stars * 10} Exp',
                    icon: Icons.flash_on,
                  ),
                  const SizedBox(width: 10),
                  // Panel azul (Acumulado del tiempo total) con icono de tiempo
                  CustomPanel(
                    color: Colors.blue,
                    title: 'Tiempo Total',
                    result: '${totalQuestions * 30 - timeLeft}s',
                    icon: Icons.timer,
                  ),
                  const SizedBox(width: 10),
                  // Panel verde (Porcentaje de preguntas correctas) con icono de "check circle"
                  CustomPanel(
                    color: Colors.green,
                    title: 'Porcentaje',
                    result: '${(correctAnswers / totalQuestions * 100).toInt()}%',
                    icon: Icons.check_circle,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, stars); // Regresa el número de estrellas obtenidas
                },
                child: const Text('Volver al Menú de Niveles'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
