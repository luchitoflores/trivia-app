import 'package:flutter/material.dart';
import '../data/data.dart';
import '../themes/theme.dart'; // Importa el archivo theme.dart
import 'categories_screen.dart';
import '../widgets/custom_app_bar.dart';

class SubjectsScreen extends StatelessWidget {
  const SubjectsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Asignaturas - Materias',
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: materias.length,
        itemBuilder: (context, index) {
          final materia = materias[index];
          // Usar el color de acuerdo al índice
          final colorIndex = index % AppColors.cardColors.length;
          final cardColor = AppColors.cardColors[colorIndex];

          return Card(
            color: cardColor, // Establecer el color del card
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoriesScreen(materia: materia),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        materia.nombre,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward,
                      color: Colors.blue,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
