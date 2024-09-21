import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trivia_app_flutter/screens/subjects_screen.dart';

class UserRegistrationScreen extends StatefulWidget {
  const UserRegistrationScreen({super.key});

  @override
  _UserRegistrationScreenState createState() => _UserRegistrationScreenState();
}

class _UserRegistrationScreenState extends State<UserRegistrationScreen> {
  final TextEditingController _nameController = TextEditingController();
  String? _userName;
  int _xp = 100; // Ejemplo de XP inicial
  int _score = 1500; // Ejemplo de puntaje inicial
  int _stars = 5; // Ejemplo de estrellas ganadas iniciales

  @override
  void initState() {
    super.initState();
    _loadUserName(); // Cargar el nombre guardado al iniciar
  }

  // Cargar el nombre del usuario desde las preferencias locales
  void _loadUserName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _userName = prefs.getString('userName');
      // También podemos cargar la información adicional (xp, puntaje, estrellas)
      _xp = prefs.getInt('xp') ?? _xp;
      _score = prefs.getInt('score') ?? _score;
      _stars = prefs.getInt('stars') ?? _stars;
    });
  }

  // Guardar el nombre del usuario en las preferencias locales
  void _saveUserName(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', name);
    await prefs.setInt('xp', _xp); // Guardamos XP
    await prefs.setInt('score', _score); // Guardamos el puntaje
    await prefs.setInt('stars', _stars); // Guardamos estrellas
    setState(() {
      _userName = name;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: _userName == null ? _buildRegistrationForm() : _buildUserInfo(),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(), // Barra de navegación
    );
  }

  // Formulario de registro para ingresar el nombre
  Widget _buildRegistrationForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Bienvenido!',
          style: TextStyle(
            fontSize: 28,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Por favor ingresa tu nombre',
          style: TextStyle(fontSize: 18, color: Colors.white70),
        ),
        const SizedBox(height: 30),
        TextField(
          controller: _nameController,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            labelText: 'Nombre',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            if (_nameController.text.isNotEmpty) {
              _saveUserName(_nameController.text); // Guardar el nombre
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Por favor ingresa un nombre')),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: const Text(
            'Guardar',
            style: TextStyle(color: Colors.blueAccent, fontSize: 18),
          ),
        ),
      ],
    );
  }

  // Información del usuario
  Widget _buildUserInfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Hola,',
          style: TextStyle(fontSize: 28, color: Colors.white),
        ),
        Text(
          _userName!,
          style: const TextStyle(
            fontSize: 36,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'XP: $_xp',
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
        Text(
          'Puntaje: $_score',
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
        Text(
          'Estrellas: $_stars',
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ],
    );
  }

  // Barra de navegación inferior
  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      selectedItemColor: Colors.blueAccent,
      unselectedItemColor: Colors.grey,
      currentIndex: 0, // Para controlar cuál botón está activo
      onTap: (index) {
        // Navegar a las diferentes pantallas según el botón presionado
        switch (index) {
          case 0:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserRegistrationScreen()),
            );
            break;
          case 1:
            // Redirigir a la pantalla de niveles
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SubjectsScreen()),
            );
            
            break;
          case 2:
            // Redirigir a la pantalla de edición de usuario
            break;
          case 3:
            // Redirigir a la pantalla de gadgets ganados
            break;
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Inicio',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.layers),
          label: 'Niveles',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.edit),
          label: 'Editar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.extension),
          label: 'Gadgets',
        ),
      ],
    );
  }
}
