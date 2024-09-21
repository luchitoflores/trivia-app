import 'package:flutter/material.dart';

class CustomPanel extends StatelessWidget {
  // Inicialización con valores predeterminados
  final Color color;
  final String title;  // Título predeterminado
  final IconData icon;  // Icono predeterminado
  final String result; 
  const CustomPanel({
    super.key,
    required this.color,
    required this.title,
    required this.icon,
    required this.result

    });

  

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: color, width: 2),
        ),
        child: Column(
          children: [
            // Encabezado redondeado con color del panel
            Container(
              decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Texto en blanco
                  ),
                ),
              ),
            ),
            // Cuerpo completamente blanco con el resultado y el icono
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icon, color: color, size: 24), // Icono con el color del panel
                  const SizedBox(width: 8),
                  Text(
                    result,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: color, // Color del texto acorde al panel
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
