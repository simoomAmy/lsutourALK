import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fill in the Blank Quiz',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const FillInTheBlankQuiz(),
    );
  }
}

class FillInTheBlankQuiz extends StatefulWidget {
  const FillInTheBlankQuiz({super.key});

  @override
  _FillInTheBlankQuizState createState() => _FillInTheBlankQuizState();
}

class _FillInTheBlankQuizState extends State<FillInTheBlankQuiz> {
  final TextEditingController _controller = TextEditingController();
  final String correctAnswer = "Flutter";
  String feedbackMessage = "";
  Color feedbackColor = Colors.black;
  bool isCorrect = false; // Track if the answer is correct

  void checkAnswer() {
    setState(() {
      if (_controller.text.trim().toLowerCase() ==
          correctAnswer.toLowerCase()) {
        feedbackMessage = "Correct! 🎉";
        feedbackColor = Colors.green;
        isCorrect = true; // Show "Next" button
      } else {
        feedbackMessage = "Wrong! Try again ❌";
        feedbackColor = Colors.red;
        isCorrect = false; // Hide "Next" button
      }
    });
  }

  void goToNextScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const NextScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "LSU Scavenger Hunt",
          style: TextStyle(
            color: Colors.yellow,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Fill in the blank:",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "The best framework for mobile apps is ",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  width: 120,
                  child: TextField(
                    controller: _controller,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: "____",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: checkAnswer,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Submit",
                style: TextStyle(fontSize: 18, color: Colors.yellow),
              ),
            ),
            const SizedBox(height: 20),
            if (feedbackMessage.isNotEmpty)
              Text(
                feedbackMessage,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: feedbackColor,
                ),
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 20),
            if (isCorrect)
              ElevatedButton(
                onPressed: goToNextScreen, // THIS WILL BE WHERE TO EDIT TO GO TO WHATEVER SCREEN THE NEXT CHALLENGE IS ON 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text("Return to Questions", style: TextStyle(fontSize: 18)),
              ),
          ],
        ),
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Next Challenge"),
        backgroundColor: Colors.deepPurple,
      ),
      body: const Center(
        child: Text(
          "Welcome to the next challenge! 🎯",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
