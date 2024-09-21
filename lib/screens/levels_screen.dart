//levels_screen.dart
import 'package:flutter/material.dart';
import '../models/models.dart';
import 'questions_screen.dart';
import '../services/nivel_service.dart';
import '../themes/theme.dart'; // Importa el archivo theme.dart
import '../widgets/custom_app_bar.dart';

class LevelsScreen extends StatefulWidget {
  final Categoria categoria;

  const LevelsScreen({super.key, required this.categoria});

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
    for (var i = 0; i < widget.categoria.niveles.length; i++) {
      var nivel = widget.categoria.niveles[i];
      nivel.estrellasObtenidas = await NivelService.obtenerEstrellas(nivel.nombre);

      // Obtener el estado de desbloqueo desde el almacenamiento
      nivel.desbloqueado = await NivelService.obtenerDesbloqueo(nivel.nombre);

      // Desbloquear el primer nivel, y desbloquear el siguiente si el anterior tiene estrellas
      if (i == 0) {
        nivel.desbloqueado = true;
      } else if (widget.categoria.niveles[i - 1].estrellasObtenidas > 0) {
        nivel.desbloqueado = true;
      } else {
        nivel.desbloqueado = false;
      }

      // Guardar el estado de desbloqueo
      await NivelService.guardarDesbloqueo(nivel.nombre, nivel.desbloqueado);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Niveles - ${widget.categoria.nombre}',
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: widget.categoria.niveles.length,
        itemBuilder: (context, index) {
          final nivel = widget.categoria.niveles[index];
          final colorIndex = index % AppColors.cardColors.length;
          final cardColor = AppColors.cardColors[colorIndex];

          return Card(
            color: cardColor, // Establecer el color del card
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: InkWell(
              onTap: nivel.desbloqueado
                  ? () async {
                      final resultado = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuestionsScreen(nivel: nivel),
                        ),
                      );

                      if (resultado != null && resultado is int) {
                        setState(() {
                          nivel.estrellasObtenidas = resultado;

                          // Desbloquear el siguiente nivel si el actual fue completado
                          if (index < widget.categoria.niveles.length - 1) {
                            widget.categoria.niveles[index + 1].desbloqueado = true;
                            NivelService.guardarDesbloqueo(
                                widget.categoria.niveles[index + 1].nombre, true);
                          }
                        });
                        await NivelService.guardarEstrellas(nivel.nombre, resultado);
                      }
                    }
                  : null, // Si está bloqueado, no hace nada
              child: Opacity(
                opacity: nivel.desbloqueado ? 1.0 : 0.5, // Niveles bloqueados se muestran más opacos
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          nivel.nombre,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
            ),
          );
        },
      ),
    );
  }
}
