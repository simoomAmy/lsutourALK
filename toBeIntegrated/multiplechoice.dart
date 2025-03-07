import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  String question = "What is the capital of France?";
  List<String> options = ["Berlin", "Madrid", "Paris", "Rome"];
  int correctAnswerIndex = 2; // Paris is correct
  int? selectedAnswerIndex;

  void checkAnswer(int index) {
    setState(() {
      selectedAnswerIndex = index;
    });
    // You can add additional logic like navigating to the next question
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Quiz")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              question,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ...List.generate(options.length, (index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ElevatedButton(
                  onPressed: selectedAnswerIndex == null
                      ? () => checkAnswer(index)
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedAnswerIndex == null
                        ? Colors.blue
                        : index == correctAnswerIndex
                            ? Colors.green
                            : (selectedAnswerIndex == index
                                ? Colors.red
                                : Colors.blue),
                  ),
                  child: Text(
                    options[index],
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              );
            }),
            SizedBox(height: 20),
            if (selectedAnswerIndex != null)
              Text(
                selectedAnswerIndex == correctAnswerIndex
                    ? "Correct!"
                    : "Wrong! The correct answer is ${options[correctAnswerIndex]}.",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}
