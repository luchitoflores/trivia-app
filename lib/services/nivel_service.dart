import 'package:shared_preferences/shared_preferences.dart';

class NivelService {
  // Método para guardar el número de estrellas obtenidas en un nivel específico
  static Future<void> guardarEstrellas(String nivelId, int estrellas) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('estrellas_$nivelId', estrellas);
  }

  // Método para obtener el número de estrellas obtenidas en un nivel específico
  static Future<int> obtenerEstrellas(String nivelId) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('estrellas_$nivelId') ?? 0;
  }
}
