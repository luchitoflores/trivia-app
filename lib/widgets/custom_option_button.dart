import 'package:flutter/material.dart';

class CustomOptionButton extends StatelessWidget {
  final String texto;
  final bool isSelected;
  final bool isCorrect;
  final bool isIncorrect; // Nueva propiedad
  final VoidCallback onPressed;

  const CustomOptionButton({
    Key? key,
    required this.texto,
    required this.isSelected,
    required this.isCorrect,
    required this.isIncorrect, // Nueva propiedad en el constructor
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color color;

    if (isSelected) {
      color = Colors.blue; // Botón seleccionado
    } else if (isIncorrect) {
      color = Colors.red; // Botón incorrecto
    } else {
      color = isCorrect ? Colors.green : Colors.grey; // Color según la respuesta
    }

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
            ),
            onPressed: onPressed,
            child: Text(texto),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
