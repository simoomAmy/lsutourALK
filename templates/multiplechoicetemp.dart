
class template extends StatelessWidget { //change based on question name
  const template({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(70, 29, 124, 1),
        title: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "LSU",
                style: TextStyle(
                  color: const Color.fromRGBO(253, 208, 35, 1),
                  fontSize: 45,
                  fontFamily: 'Forza',
                ),
              ),
              TextSpan(
                text: "  Scavenger Hunt",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: 'Forza',
                ),
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text
            const Text(
              'Please locate this image on campus. Once you find it, click the button below to move on to the next step!',
              style: TextStyle(
                color: Color.fromRGBO(253, 208, 35, 1),
                fontSize: 24,
                fontFamily: 'Forza',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20), // Spacer

            // Image
            Image.asset(
              'images/ModelPlane.jpeg', // Replace with appropriate image for question

              height: 350,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20), // Spacer

            // Next Button
            ElevatedButton(
              onPressed: () {
                // Navigate to the next screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QuizPage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(70, 29, 124, 1),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                'Next',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Forza',
                ),
              ),
            ),
          ],
        ),
      ),
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
  String question = "What is the name of LSU's mascot?"; //change question
  List<String> options = ["Fred", "Mike", "Murphy", "Earl"]; //change answer choices
  int correctAnswerIndex = 1; // "Mike" is correct, changes correct answer
  int? selectedAnswerIndex;
  bool isCorrect = false; // Track if the answer is correct

  void checkAnswer(int index) {
    setState(() {
      selectedAnswerIndex = index;
      isCorrect = (index == correctAnswerIndex);
    });
  }

  void goHome() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (context) => const MyHomePage(
                title: '',
              )),
      (Route<dynamic> route) => false, // Remove all routes
    );
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
                  onPressed: selectedAnswerIndex == null
                      ? () => checkAnswer(index)
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedAnswerIndex == null
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
                  color: selectedAnswerIndex == correctAnswerIndex
                      ? Colors.green
                      : Colors.red,
                ),
                textAlign: TextAlign.center,
              ),
            SizedBox(height: 20),
            if (isCorrect)
              ElevatedButton(
                onPressed: goHome, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text("Next", style: TextStyle(fontSize: 18)),
              ),
          ],
        ),
      ),
    );
  }
}
