import 'package:flutter/material.dart';
import '../models/models.dart';
import 'questions_screen.dart';
import "../services/nivel_service.dart";

class LevelsScreen extends StatefulWidget {
  final Categoria categoria;

  LevelsScreen({required this.categoria});

  @override
  _LevelsScreenState createState() => _LevelsScreenState();
}

class _LevelsScreenState extends State<LevelsScreen> {
  @override
  void initState() {
    super.initState();
    _cargarEstrellas();
  }

  Future<void> _cargarEstrellas() async {
    for (var nivel in widget.categoria.niveles) {
      nivel.estrellasObtenidas = await NivelService.obtenerEstrellas(nivel.nombre);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Niveles - ${widget.categoria.nombre}'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: widget.categoria.niveles.length,
        itemBuilder: (context, index) {
          final nivel = widget.categoria.niveles[index];
          return Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: InkWell(
              onTap: () async {
                final resultado = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuestionsScreen(nivel: nivel),
                  ),
                );

                if (resultado != null && resultado is int) {
                  setState(() {
                    nivel.estrellasObtenidas = resultado;
                  });
                  await NivelService.guardarEstrellas(nivel.nombre, resultado);
                }
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        nivel.nombre,
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(3, (i) {
                        return Icon(
                          i < nivel.estrellasObtenidas ? Icons.star : Icons.star_border,
                          color: i < nivel.estrellasObtenidas ? Colors.yellow : Colors.grey,
                          size: 20,
                        );
                      }),
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
