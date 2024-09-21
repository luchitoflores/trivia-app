import 'package:flutter/material.dart';
import '../models/models.dart';
import '../themes/theme.dart'; // Importa el archivo theme.dart
import 'levels_screen.dart';
import '../widgets/custom_app_bar.dart';

class CategoriesScreen extends StatelessWidget {
  final Materia materia;

  const CategoriesScreen({super.key, required this.materia});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Categorías - ${materia.nombre}',
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: materia.categorias.length,
        itemBuilder: (context, index) {
          final categoria = materia.categorias[index];
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
                    builder: (context) => LevelsScreen(categoria: categoria),
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
                        categoria.nombre,
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
