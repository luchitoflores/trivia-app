import 'package:flutter/material.dart';

class CustomTimer extends StatelessWidget {
  final int timeLeft; // Tiempo restante
  final double progress; // Progreso del círculo

  const CustomTimer({
    Key? key,
    required this.timeLeft,
    required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircularProgressIndicator(
          value: progress, // Progreso del círculo
          strokeWidth: 8.0,
          backgroundColor: Colors.grey[300],
          valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
        ),
        Text(
          '$timeLeft', // Mostrar tiempo restante
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
