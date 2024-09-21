import 'package:flutter/material.dart';
import 'package:trivia_app_flutter/widgets/custum_timer.dart';
import 'dart:async'; // Para usar Timer
import 'dart:math'; // Para usar Random
import '../models/models.dart';
import '../widgets/custom_app_bar.dart'; // Para usar un AppBar personalizado
import '../screens/final_result_screen.dart'; // Importa la nueva pantalla de resultados finales

class QuestionsScreen extends StatefulWidget {
  final Nivel nivel;

  const QuestionsScreen({super.key, required this.nivel});

  @override
  _QuestionsScreenState createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int _currentQuestionIndex = 0;
  int _stars = 3; // Inicialmente, el jugador tiene 3 estrellas.
  int _totalQuestions = 0;
  bool _isButtonDisabled = false;
  int? _selectedOptionId; // ID de la opción seleccionada
  List<Opcion> _opcionesBarajadas = []; // Lista de opciones barajadas

  Timer? _timer;
  int _timeLeft = 30; // Tiempo restante en segundos
  double _progress =
      1.0; // Progreso para CircularProgressIndicator (1.0 = lleno)
  double _linearProgress =
      0.0; // Progreso para LinearProgressIndicator (0.0 = vacío)

// Color de feedback del fondo
  bool _showFinalResult = false; // Control para mostrar el resultado final
  int _correctAnswers = 0; // Número de respuestas correctas

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

  void _setFeedbackColor(Color color, {int? decrementStars}) {
    if (decrementStars != null) {
      _stars -= decrementStars;
    }
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {});
      // _nextQuestion();
    });
  }

  void _loadQuestion() {
    // Barajar opciones solo cuando se carga la pregunta
    final pregunta = widget.nivel.preguntas[_currentQuestionIndex];
    _opcionesBarajadas = List.from(pregunta.opciones)..shuffle(Random());
  }

  void _checkAnswer(int selectedOpcionId, Pregunta pregunta) {
    _timer
        ?.cancel(); // Cancela el temporizador cuando se selecciona una respuesta

    // Evaluar si la respuesta es correcta
    final isCorrect = selectedOpcionId == pregunta.respuestaCorrectaId;
    setState(() {
      _selectedOptionId = selectedOpcionId;
      //_isButtonDisabled = true; // Deshabilita los botones
    });

    // Obtener el texto de la respuesta correcta
    String? correctAnswerText;
    for (var opcion in pregunta.opciones) {
      if (opcion.id == pregunta.respuestaCorrectaId) {
        correctAnswerText =
            opcion.texto; // Guarda el texto de la respuesta correcta
        break;
      }
    }

    // Mostrar el ModalBottomSheet
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        final bool isTimeOut =
            selectedOpcionId == -1; // Verifica si el tiempo se acabó
        final feedbackMessage = isTimeOut
            ? "Tiempo agotado"
            : (isCorrect ? "Correcto" : "Incorrecto");
        final responseMessage = isTimeOut
            ? "No alcanzaste a responder"
            : "Respuesta correcta: $correctAnswerText";

        // Íconos condicionales
        final icon = isTimeOut
            ? Icons.access_time // Ícono de reloj para tiempo agotado
            : (isCorrect ? Icons.check_circle_outline : Icons.cancel_outlined);
        final iconColor = isTimeOut
            ? Colors.orange // Color naranja para tiempo agotado
            : (isCorrect ? Colors.green : Colors.red);

        // Color de fondo dependiendo del estado
        final backgroundColor = isTimeOut
            ? Colors.yellow[
                100]! // Color de fondo amarillo cuando el tiempo se acaba
            : (isCorrect ? Colors.lightGreen[100]! : Colors.red[100]!);

        return Container(
          padding: const EdgeInsets.all(16.0),
          width: double
              .infinity, // Asegúrate de que el contenedor ocupe todo el ancho
          color: backgroundColor, // Establecer el color de fondo
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Centra el contenido
                children: [
                  // Texto "Correcto", "Incorrecto" o "Tiempo agotado"
                  Text(
                    feedbackMessage,
                    style: TextStyle(
                        color: isTimeOut
                            ? Colors.orange // Color naranja para tiempo agotado
                            : (isCorrect
                                ? Color(0xFF57CC02)
                                : Color(0xFFFF4B4C)),
                        fontSize: 24),
                  ),
                  const SizedBox(width: 8), // Espacio entre el texto y el ícono
                  // Ícono a la derecha del texto
                  Icon(
                    icon, // Usa el ícono correspondiente
                    color: iconColor, // Color dependiendo del estado
                    size: 32, // Tamaño del ícono
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(responseMessage),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isTimeOut
                      ? Colors.orange // Color naranja para tiempo agotado
                      : (isCorrect ? Color(0xFF57CC02) : Color(0xFFFF4B4C)),
                ),
                onPressed: () {
                  Navigator.pop(context); // Cierra el Modal
                  _nextQuestion(); // Pasa a la siguiente pregunta cuando se cierra el modal
                },
                child: const Text('Continuar'),
              ),
            ],
          ),
        );
      },
    );

    // Aquí se manejan los feedbacks, pero no se llama a _nextQuestion() directamente.
    if (isCorrect) {
      _correctAnswers++;
      _setFeedbackColor(Colors.green);
    } else if (selectedOpcionId == -1) {
      _setFeedbackColor(Colors.red, decrementStars: 1); // Tiempo agotado
    } else {
      _setFeedbackColor(Colors.red, decrementStars: 1); // Respuesta incorrecta
    }
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < _totalQuestions - 1) {
      _currentQuestionIndex++;
      _loadQuestion(); // Carga la siguiente pregunta
      _isButtonDisabled = false; // Habilita los botones nuevamente
      _startTimer(); // Reinicia el temporizador para la nueva pregunta
    } else {
      // Si se han respondido todas las preguntas, muestra el resultado final
      setState(() {
        _showFinalResult = true; // Activa el estado de resultado final
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_showFinalResult) {
       _timer?.cancel();
      return FinalResultScreen(
        aprobado: _stars > 0,
        stars: _stars,
        totalQuestions: _totalQuestions,
        correctAnswers: _correctAnswers,
        timeLeft: _timeLeft,
      );
    }

    // Verifica si se han cometido 3 errores
    if (_stars <= 0) {
     // _timer?.cancel(); // Asegúrate de detener el temporizador cuando se pierden todas las estrellas
      _showFinalResult = true;
      return FinalResultScreen(
        aprobado: false,
        stars: _stars,
        totalQuestions: _totalQuestions,
        correctAnswers: _correctAnswers,
        timeLeft: _timeLeft,
      );
    }

    // Verifica si es la última pregunta y se ha respondido
    if (_currentQuestionIndex >= _totalQuestions) {
      _showFinalResult = true;
      return FinalResultScreen(
        aprobado: _stars > 0,
        stars: _stars,
        totalQuestions: _totalQuestions,
        correctAnswers: _correctAnswers,
        timeLeft: _timeLeft,
      );
    }

    final pregunta = widget.nivel.preguntas[_currentQuestionIndex];

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Nivel ${widget.nivel.nombre}',
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Barra de progreso horizontal
              LinearProgressIndicator(
                value: _linearProgress,
                backgroundColor: Colors.grey[300],
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
              const SizedBox(height: 10),

              // Fila para mostrar estrellas, número de pregunta y temporizador
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Pregunta ${_currentQuestionIndex + 1}/$_totalQuestions',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: _buildStarRow(),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child:
                        CustomTimer(timeLeft: _timeLeft, progress: _progress),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              Text(
                pregunta.texto,
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              ..._opcionesBarajadas
                  .map((opcion) => _buildOptionButton(opcion, pregunta)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStarRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Icon(
          index < _stars ? Icons.star : Icons.star_border,
          color: index < _stars ? Colors.yellow : Colors.grey,
          size: 30,
        );
      }),
    );
  }

  Widget _buildOptionButton(Opcion opcion, Pregunta pregunta) {
    final isCorrect = opcion.id == pregunta.respuestaCorrectaId;
    final isSelected = _selectedOptionId == opcion.id;

    // Colores por defecto
    Color? backgroundColor;
    Color textColor = Colors.white;

    // Si se ha seleccionado y no está deshabilitado, asigna el color
    if (_isButtonDisabled) {
      backgroundColor =
          isCorrect ? Colors.green : (isSelected ? Colors.red : Colors.grey);
    } else {
      backgroundColor =
          Colors.grey[800]; // Color neutro cuando no está deshabilitado
    }

    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor, // Color de fondo
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15), // Bordes redondeados
              ),
              padding: const EdgeInsets.symmetric(
                  vertical: 15), // Espaciado vertical
              elevation: 5, // Sombra
            ),
            onPressed: () {
              // Llama a _checkAnswer y guarda la opción seleccionada
              _checkAnswer(opcion.id, pregunta);
              setState(() {
                _selectedOptionId =
                    opcion.id; // Actualiza la opción seleccionada
              });
            },
            child: Text(
              opcion.texto,
              style:
                  TextStyle(color: textColor, fontSize: 16), // Estilo del texto
            ),
          ),
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  void _startTimer() {
    _timeLeft = 30; // Reinicia el tiempo a 30 segundos
    _progress = 1.0; // Reinicia el progreso del círculo a completo
    _linearProgress = (_currentQuestionIndex + 1) /
        _totalQuestions; // Calcula el progreso inicial
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeLeft > 0) {
          _timeLeft--; // Decrementa el tiempo
          _progress = _timeLeft / 30; // Calcula el progreso del círculo
        } else {
          _timer?.cancel();
          _checkAnswer(
              -1,
              widget.nivel.preguntas[
                  _currentQuestionIndex]); // Considera que no respondió a tiempo
        }
      });
    });
  }
}
