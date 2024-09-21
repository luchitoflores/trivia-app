import 'package:flutter/material.dart';
import '../models/models.dart';

class LevelCard extends StatelessWidget {
  final Nivel nivel;
  final Color color;
  final VoidCallback? onTap;
  final bool isUnlocked;
  final double opacity;
  final List<IconData> starIcons; // Para los íconos de estrella
  final List<Color> starColors; // Para los colores de las estrellas

  const LevelCard({
    Key? key,
    required this.nivel,
    required this.color,
    this.onTap,
    required this.isUnlocked,
    required this.opacity,
    required this.starIcons,
    required this.starColors,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: onTap,
        child: Opacity(
          opacity: opacity,
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
                      starIcons[i],
                      color: starColors[i],
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
  }
}
