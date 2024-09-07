import 'package:flutter/material.dart';
import '../data/data.dart';
import 'categories_screen.dart';

class SubjectsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Asignaturas - Materias'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: materias.length,
        itemBuilder: (context, index) {
          final materia = materias[index];
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
