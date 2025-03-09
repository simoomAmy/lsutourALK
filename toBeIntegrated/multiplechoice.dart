import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: QuizPage(),
    );
  }
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        "LSU Scavenger Hunt",
        style: TextStyle(
          color: Colors.yellow,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
      ),
      backgroundColor: Colors.deepPurple,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  String question = "What is the name of LSU's mascot?";
  List<String> options = ["Fred", "Mike", "Murphy", "Earl"];
  int correctAnswerIndex = 1; // Paris is correct
  int? selectedAnswerIndex;

  void checkAnswer(int index) {
    setState(() {
      selectedAnswerIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
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
                  onPressed:
                      selectedAnswerIndex == null
                          ? () => checkAnswer(index)
                          : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        selectedAnswerIndex == null
                            ? Colors.deepPurple
                            : index == correctAnswerIndex
                            ? Colors.green
                            : (selectedAnswerIndex == index
                                ? Colors.red
                                : Colors.blue),
                  ),
                  child: Text(
                    options[index],
                    style: TextStyle(fontSize: 18, color: Colors.yellow),
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
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
    );
  }
}
