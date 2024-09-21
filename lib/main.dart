import 'package:flutter/material.dart';
import 'package:trivia_app_flutter/screens/usuario_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quizz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UserRegistrationScreen(), // Pantalla inicial
    );
  }
}
