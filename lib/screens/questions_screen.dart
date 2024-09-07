import 'package:flutter/material.dart';
import 'dart:async'; // Para usar Timer
import 'dart:math'; // Para usar Random
import '../models/models.dart';

class QuestionsScreen extends StatefulWidget {
  final Nivel nivel;

  QuestionsScreen({required this.nivel});

  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int _currentQuestionIndex = 0;
  int _stars = 3; // Inicialmente, el jugador tiene 3 estrellas.
  int _totalQuestions = 0;
  String _feedbackMessage = '';
  bool _isButtonDisabled = false;
  int _correctOptionId = -1; // ID de la opción correcta, inicializado en -1
  int? _selectedOptionId; // ID de la opción seleccionada
  List<Opcion> _opcionesBarajadas = []; // Lista de opciones barajadas

  Timer? _timer;
  int _timeLeft = 30; // Tiempo restante en segundos
  double _progress = 1.0; // Progreso para CircularProgressIndicator (1.0 = lleno)
  double _linearProgress = 0.0; // Progreso para LinearProgressIndicator (0.0 = vacío)

  Color _feedbackColor = Colors.transparent; // Color de feedback del fondo
  bool _showFinalResult = false; // Control para mostrar el resultado final
  int _correctAnswers = 0; // Número de respuestas correctas
  int _incorrectAnswers = 0; // Número de respuestas incorrectas

  @override
  void initState() {
    super.initState();
    // Baraja las preguntas
    widget.nivel.preguntas.shuffle(Random());
    _totalQuestions = widget.nivel.preguntas.length;
    _loadQuestion(); // Cargar la primera pregunta y barajar opciones
    _startTimer(); // Inicia el temporizador al cargar la pantalla
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancela el temporizador cuando se destruye el widget
    super.dispose();
  }

  void _loadQuestion() {
    // Barajar opciones solo cuando se carga la pregunta, no cada segundo.
    final pregunta = widget.nivel.preguntas[_currentQuestionIndex];
    _opcionesBarajadas = List.from(pregunta.opciones)..shuffle(Random());
  }

  void _startTimer() {
    _timeLeft = 30; // Reinicia el tiempo a 30 segundos
    _progress = 1.0; // Reinicia el progreso del círculo a completo
    _linearProgress = (_currentQuestionIndex + 1) / _totalQuestions; // Calcula el progreso inicial
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeLeft > 0) {
          _timeLeft--; // Decrementa el tiempo
          _progress = _timeLeft / 30; // Calcula el progreso del círculo
        } else {
          _timer?.cancel();
          _checkAnswer(-1, widget.nivel.preguntas[_currentQuestionIndex]); // Considera que no respondió a tiempo
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_showFinalResult) {
      return _showFinalResultScreen(aprobado: _stars > 0);
    }

    // Verifica si se han cometido 3 errores
    if (_stars <= 0) {
      _showFinalResult = true;
      return _showFinalResultScreen(aprobado: false);
    }

    // Verifica si es la última pregunta y se ha respondido
    if (_currentQuestionIndex >= _totalQuestions) {
      _showFinalResult = true;
      return _showFinalResultScreen(aprobado: _stars > 0);
    }

    final pregunta = widget.nivel.preguntas[_currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Nivel ${widget.nivel.nombre}'),
      ),
      body: Stack(
        children: [
          // Fondo de feedback
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            color: _feedbackColor,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Barra de progreso horizontal
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: LinearProgressIndicator(
                        value: _linearProgress, // Progreso de las preguntas
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Mostrar estrellas en la parte superior
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(3, (index) {
                        return Icon(
                          index < _stars ? Icons.star : Icons.star_border,
                          color: index < _stars ? Colors.yellow : Colors.grey,
                          size: 30,
                        );
                      }),
                    ),
                    SizedBox(height: 20),
                    // Mostrar número de pregunta actual
                    Text(
                      'Pregunta ${_currentQuestionIndex + 1}/$_totalQuestions',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 20),
                    // Temporizador y círculo de progreso
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CircularProgressIndicator(
                          value: _progress, // Progreso del círculo
                          strokeWidth: 8.0,
                          backgroundColor: Colors.grey[300],
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                        ),
                        Text(
                          '$_timeLeft s', // Mostrar tiempo restante
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      pregunta.texto,
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 20),
                    ..._opcionesBarajadas.map((opcion) {
                      final isCorrect = opcion.id == pregunta.respuestaCorrectaId;
                      final isSelected = _selectedOptionId == opcion.id;
                      final color = _isButtonDisabled
                          ? (isCorrect ? Colors.green : (isSelected ? Colors.red : Colors.grey))
                          : Colors.blue;

                      return Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: color,
                              ),
                              onPressed: _isButtonDisabled ? null : () => _checkAnswer(opcion.id, pregunta),
                              child: Text(opcion.texto),
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      );
                    }).toList(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _checkAnswer(int selectedOpcionId, Pregunta pregunta) {
    _timer?.cancel(); // Cancela el temporizador cuando se selecciona una respuesta

    setState(() {
      _selectedOptionId = selectedOpcionId;
      _isButtonDisabled = true;
      _correctOptionId = pregunta.respuestaCorrectaId;

      if (selectedOpcionId == pregunta.respuestaCorrectaId) {
        _feedbackColor = Colors.green.withOpacity(0.5); // Fondo verde para respuesta correcta
        _correctAnswers++;
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            _feedbackColor = Colors.transparent; // Quitar el color de feedback
          });
          _nextQuestion(); // Avanza a la siguiente pregunta
        });
      } else if (selectedOpcionId == -1) {
        _feedbackColor = Colors.red.withOpacity(0.5); // Fondo rojo para tiempo agotado
        _stars--; // Resta una estrella por tiempo agotado
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            _feedbackColor = Colors.transparent; // Quitar el color de feedback
          });
          _nextQuestion(); // Avanza a la siguiente pregunta
        });
      } else {
        _feedbackColor = Colors.red.withOpacity(0.5); // Fondo rojo para respuesta incorrecta
        _incorrectAnswers++;
        _stars--; // Resta una estrella por respuesta incorrecta
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            _feedbackColor = Colors.transparent; // Quitar el color de feedback
          });
          _nextQuestion(); // Avanza a la siguiente pregunta
        });
      }
    });
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < _totalQuestions - 1) {
      setState(() {
        _feedbackMessage = '';
        _correctOptionId = -1;
        _selectedOptionId = null;
        _isButtonDisabled = false;
        _currentQuestionIndex++;
        _loadQuestion(); // Carga la siguiente pregunta
        _startTimer(); // Reinicia el temporizador para la siguiente pregunta
        _linearProgress = (_currentQuestionIndex + 1) / _totalQuestions; // Actualiza el progreso de la barra
      });
    } else {
      setState(() {
        _showFinalResult = true; // Muestra la pantalla de resultados finales
      });
    }
  }

  Widget _showFinalResultScreen({required bool aprobado}) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                aprobado ? '¡Felicidades!' : 'Lo siento, no has aprobado.',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: aprobado ? Colors.green : Colors.red),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return Icon(
                    index < _stars ? Icons.star : Icons.star_border,
                    color: index < _stars ? Colors.yellow : Colors.grey,
                    size: 30,
                  );
                }),
              ),
              SizedBox(height: 20),
              Text(
                'Respuestas Correctas: $_correctAnswers',
                style: TextStyle(fontSize: 18, color: Colors.green),
              ),
              Text(
                'Respuestas Incorrectas: $_incorrectAnswers',
                style: TextStyle(fontSize: 18, color: Colors.red),
              ),
              SizedBox(height: 20),
              Text(
                'Puntaje Actual: ${_stars * 10}',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Puntaje Total: ${_totalQuestions * 10}', // Asumiendo que cada pregunta vale 10 puntos
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              ElevatedButton(
  onPressed: () {
    Navigator.pop(context, _stars); // Regresa el número de estrellas obtenidas
  },
  child: Text('Volver al Menú de Niveles'),
),

            ],
          ),
        ),
      ),
    );
  }
}
