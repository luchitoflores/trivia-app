import 'dart:async';
import 'dart:math';
import '../models/models.dart';

class QuestionService {
  final Nivel nivel;
  int currentQuestionIndex = 0;
  int stars = 3;
  int correctAnswers = 0;
  int totalQuestions = 0;
  int timeLeft = 30;
  double progress = 1.0;
  double linearProgress = 0.0;
  Timer? timer;

  QuestionService({required this.nivel}) {
    nivel.preguntas.shuffle(Random());
    totalQuestions = nivel.preguntas.length;
  }

  // Baraja las opciones de la pregunta actual
  List<Opcion> shuffleOptions() {
    final pregunta = nivel.preguntas[currentQuestionIndex];
    return List.from(pregunta.opciones)..shuffle(Random());
  }

  // Reinicia el temporizador
  void startTimer(Function onTimeUpdate, Function onTimeExpired) {
    timeLeft = 30;
    progress = 1.0;
    linearProgress = (currentQuestionIndex + 1) / totalQuestions;

    timer?.cancel();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      timeLeft--;
      progress = timeLeft / 30;
      onTimeUpdate();

      if (timeLeft <= 0) {
        timer.cancel();
        onTimeExpired();
      }
    });
  }

  // Verifica la respuesta seleccionada
  bool checkAnswer(int selectedOptionId) {
    final pregunta = nivel.preguntas[currentQuestionIndex];
    bool isCorrect = selectedOptionId == pregunta.respuestaCorrectaId;

    if (isCorrect) {
      correctAnswers++;
    } else {
      stars--;
    }

    return isCorrect;
  }

  // Pasa a la siguiente pregunta o finaliza
  bool nextQuestion() {
    if (currentQuestionIndex < totalQuestions - 1) {
      currentQuestionIndex++;
      return true;
    } else {
      return false;
    }
  }

  // Cancela el temporizador al salir
  void dispose() {
    timer?.cancel();
  }
}
