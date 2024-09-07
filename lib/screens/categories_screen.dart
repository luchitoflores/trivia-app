import 'package:flutter/material.dart';
import '../models/models.dart';
import 'levels_screen.dart';

class CategoriesScreen extends StatelessWidget {
  final Materia materia;

  CategoriesScreen({required this.materia});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categorías - ${materia.nombre}'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: materia.categorias.length,
        itemBuilder: (context, index) {
          final categoria = materia.categorias[index];
          return Card(
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
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Icon(
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
