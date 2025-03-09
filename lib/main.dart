import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//test
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'LSU Scavenger Hunt'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String currentpage = 'Images/LSUM.png';
  String firstFloor = 'Images/firstF.png';
  String secondFloor = 'Images/secondF.png';
  String thirdFloor = 'Images/thirdF.png';
  String buttonOne = 'true';

  void changeMap1() {
    setState(() {
      currentpage = firstFloor;
    });
  }

  void changeMap2() {
    setState(() {
      currentpage = secondFloor;
    });
  }

  void changeMap3() {
    setState(() {
      currentpage = thirdFloor;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Color.fromRGBO(70, 29, 124, 1),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: "LSU",
                style: TextStyle(
                  color: Color.fromRGBO(253, 208, 35, 1),
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

      //above this is the app bar please do not touch
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double mapWidth = constraints.maxWidth;
            double mapHeight =
                constraints.maxHeight *
                0.80; // Adjust aspect ratio based on your image

            return Stack(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10.0,
                        vertical: 20.0,
                      ),
                      child: Column(
                        //these are the buttons
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: changeMap1,
                            child: Text('  First Floor  '),
                          ),
                          ElevatedButton(
                            onPressed: changeMap2,
                            child: Text('Second Floor'),
                          ),
                          ElevatedButton(
                            onPressed: changeMap3,
                            child: Text('  Third Floor  '),
                          ),
                        ],
                      ),
                    ), //buttons for the floors above
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30.0),
                            child: Text(
                              '    Click the buttons to find all \nthe keys and end your journey.',
                              style: TextStyle(
                                color: Color.fromRGBO(253, 208, 35, 1),
                                fontSize: 30,
                                fontFamily: 'Forza',
                              ),
                            ),
                          ),
                          SizedBox(
                            width: mapWidth,
                            height: mapHeight,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    currentpage,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                if (currentpage == 'Images/firstF.png') ...[
                                  Positioned(
                                    //Floor 1 - Picture (Vendingmachine(1stfloor).jpeg) - What floor contains a vending machine where you can purchase Monster energy drinks?
                                    top: mapHeight * 0.16,
                                    left: mapWidth * 0.33,
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) => Monster(title: ''),
                                          ),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.not_listed_location_sharp,
                                        size: 50,
                                        color: Color.fromRGBO(70, 29, 124, 1),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    //Floor 1 - Picture (Honor Society symbol(1stfloor).jpeg) - Where can the Tau Beta Pi sign be found?
                                    top: mapHeight * 0.3,
                                    left: mapWidth * 0.45,
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) => HSS(title: ''),
                                          ),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.not_listed_location_sharp,
                                        size: 50,
                                        color: Color.fromRGBO(70, 29, 124, 1),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    //Floor 1 - Picture (Robotic_Arm.jpeg) - Room 1300 - What room contains the Fanuc Robotic arm?
                                    top: mapHeight * 0.27,
                                    left: mapWidth * 0.61,
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) => Arm(title: ''),
                                          ),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.not_listed_location_sharp,
                                        size: 50,
                                        color: Color.fromRGBO(70, 29, 124, 1),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    //Floor 1 - Picture (Vendingmachine(1stfloor).jpeg) - What floor contains a vending machine where you can purchase BlueBooks?
                                    top: mapHeight * 0.7,
                                    left: mapWidth * 0.46,
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) =>
                                                    Bluebook(title: ''),
                                          ),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.not_listed_location_sharp,
                                        size: 50,
                                        color: Color.fromRGBO(70, 29, 124, 1),
                                      ),
                                    ),
                                  ),
                                ],
                                if (currentpage == 'Images/secondF.png') ...[
                                  Positioned(
                                    //Floor 2 - Picture (Among Us Mosaic.jpeg) - Room 2317 - What room can the beautiful Among Us piece be found in
                                    top: mapHeight * 0.13,
                                    left: mapWidth * 0.605,
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) => AmongUs(title: ''),
                                          ),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.not_listed_location_sharp,
                                        size: 50,
                                        color: Color.fromRGBO(70, 29, 124, 1),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    //?Floor 2 - Picture (MMR_upclose.jpeg) - Room 2348 - What floor can the MMR machine be found?
                                    top: mapHeight * 0.28,
                                    left: mapWidth * 0.459,
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) => MMR(title: ''),
                                          ),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.not_listed_location_sharp,
                                        size: 50,
                                        color: Color.fromRGBO(70, 29, 124, 1),
                                      ),
                                    ),
                                  ),
                                ],
                                if (currentpage == 'Images/thirdF.png') ...[
                                  Positioned(
                                    //?Floor 3 - Picture (ModelPlane.jpeg) - Room (Office) 3261 - What floor and office can the model plane be found?
                                    top: mapHeight * 0.36,
                                    left: mapWidth * 0.4,
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) => Plane(title: ''),
                                          ),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.not_listed_location_sharp,
                                        size: 50,
                                        color: Color.fromRGBO(70, 29, 124, 1),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    //Floor 3 - Picture (Trophywall(3rdfloor).jpeg) - What floor can the shelves filled with trophies be found
                                    top: mapHeight * 0.3,
                                    left: mapWidth * 0.45,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.not_listed_location_sharp,
                                        size: 50,
                                        color: Color.fromRGBO(70, 29, 124, 1),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    ///Floor 3 - Picture (Tesla_Coil.jpeg and teslacoil_farview.jpeg)- On what floor of PFT is the Musical tesla coil located?
                                    top: mapHeight * 0.27,
                                    left: mapWidth * 0.61,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.not_listed_location_sharp,
                                        size: 50,
                                        color: Color.fromRGBO(70, 29, 124, 1),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    //Floor 3 - Picture (Universestandard_chart.jpeg) - Room 3316 - Professor David Koppelman - The funny universe chart is located on the third floor of pft, which room number and professor has this placed on their door?
                                    top: mapHeight * 0.035,
                                    left: mapWidth * 0.465,
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder:
                                                (context) =>
                                                    UniverseChart(title: ''),
                                          ),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.not_listed_location_sharp,
                                        size: 50,
                                        color: Color.fromRGBO(70, 29, 124, 1),
                                      ),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),

                // Positioned(
                //   //LSU STADIUM
                //   top: mapHeight * 0.72, // Adjust relative to the map
                //   left: mapWidth * 0.48, // Adjust relative to the map
                //   child: IconButton(
                //     onPressed: () {},
                //     icon: Icon(
                //       Icons.not_listed_location_sharp,
                //       size: 50,
                //       color: Color.fromRGBO(253, 208, 35, 1),
                //     ),
                //   ),
                // ),
                // Positioned(
                //   //PFT
                //   top: mapHeight * 0.577, // Adjust relative to the map
                //   left: mapWidth * 0.76, // Adjust relative to the map
                //   child: IconButton(
                //     onPressed: () {},
                //     icon: Icon(
                //       Icons.not_listed_location_sharp,
                //       size: 50,
                //       color: Color.fromRGBO(253, 208, 35, 1),
                //     ),
                //   ),
                // ),
                // Positioned(
                //   //BUSINESS BUILDING
                //   top: mapHeight * 0.52, // Adjust relative to the map
                //   left: mapWidth * 0.8, // Adjust relative to the map
                //   child: IconButton(
                //     onPressed: () {},
                //     icon: Icon(
                //       Icons.not_listed_location_sharp,
                //       size: 50,
                //       color: Color.fromRGBO(253, 208, 35, 1),
                //     ),
                //   ),
                // ),
                // Positioned(
                //   //library
                //   top: mapHeight * 0.42, // Adjust relative to the map
                //   left: mapWidth * 0.42, // Adjust relative to the map
                //   child: IconButton(
                //     onPressed: () {},
                //     icon: Icon(
                //       Icons.not_listed_location_sharp,
                //       size: 50,
                //       color: Color.fromRGBO(253, 208, 35, 1),
                //     ),
                //   ),
                // ),
                // // Positioned(
                //   //student union
                //   top: mapHeight * 0.28, // Adjust relative to the map
                //   left: mapWidth * 0.54, // Adjust relative to the map
                //   child: IconButton(
                //     onPressed: () {},
                //     icon: Icon(
                //       Icons.not_listed_location_sharp,
                //       size: 50,
                //       color: Color.fromRGBO(253, 208, 35, 1),
                //     ),
                //   ),
                // ),
              ],
            );
          },
        ),
      ),
    );
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}

class QuestionMonstersBuy extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();
  QuestionMonstersBuy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("EXample page")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                controller: _controller,
                decoration: InputDecoration(labelText: "Check Your Answer"),
              ),
              SizedBox(
                height: 20,
              ), // Adds space between the TextField and button
              ElevatedButton(
                onPressed: () {
                  // Handle input validation here
                },
                child: Text("Submit"),
              ),
            ],
          ),
        ),
      ),
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
                onPressed:
                    goToNextScreen, // THIS WILL BE WHERE TO EDIT TO GO TO WHATEVER SCREEN THE NEXT CHALLENGE IS ON
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Return to Questions",
                  style: TextStyle(fontSize: 18),
                ),
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

class QuizPageEx extends StatefulWidget {
  const QuizPageEx({super.key});

  @override
  _QuizPageExState createState() => _QuizPageExState();
}

class _QuizPageExState extends State<QuizPageEx> {
  String question = "What is the name of LSU's mascot?";
  List<String> options = ["Fred", "Mike", "Murphy", "Earl"];
  int correctAnswerIndex = 1; // "Mike" is correct
  int? selectedAnswerIndex;
  bool isCorrect = false; // Track if the answer is correct

  void checkAnswer(int index) {
    setState(() {
      selectedAnswerIndex = index;
      isCorrect = (index == correctAnswerIndex);
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
                  color:
                      selectedAnswerIndex == correctAnswerIndex
                          ? Colors.green
                          : Colors.red,
                ),
                textAlign: TextAlign.center,
              ),
            SizedBox(height: 20),
            if (isCorrect)
              ElevatedButton(
                onPressed:
                    goToNextScreen, //THIS IS WHERE TO CHANGE SCREEN NAVIGATION
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

class HSS extends StatelessWidget {
  //change based on question name
  const HSS({super.key, required this.title});

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
              'images/hss.jpeg', // Replace with appropriate image for question

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
                  MaterialPageRoute(builder: (context) => HSSQ()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(70, 29, 124, 1),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
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

class HSSQ extends StatefulWidget {
  const HSSQ({super.key});

  @override
  _HSSQState createState() => _HSSQState();
}

class _HSSQState extends State<HSSQ> {
  String question =
      "What is the name of the group to which this symbol belongs?"; //change question
  List<String> options = [
    "Tri-Beta",
    "National Engineering Honor Society",
    "Tau Beta Pi",
    "Phi Beta Kappa",
  ]; //change answer choices
  int correctAnswerIndex =
      2; // "Tau Beta Pi" is correct, changes correct answer
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
      MaterialPageRoute(builder: (context) => const MyHomePage(title: '')),
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
                  color:
                      selectedAnswerIndex == correctAnswerIndex
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

class Monster extends StatelessWidget {
  //change based on question name
  const Monster({super.key, required this.title});

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
              'images/Vendingmachine(1stfloor).jpeg', // Replace with appropriate image for question

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
                  MaterialPageRoute(builder: (context) => const MonsterQ()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(70, 29, 124, 1),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
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

class MonsterQ extends StatefulWidget {
  const MonsterQ({super.key});

  @override
  _MonsterQState createState() => _MonsterQState();
}

class _MonsterQState extends State<MonsterQ> {
  String question =
      "How many floors can you purchase monster energy drinks on?"; //change question
  List<String> options = [
    "Just 1",
    "2",
    "All 3",
    "None",
  ]; //change answer choices
  int correctAnswerIndex = 2; // "all 3" is correct, changes correct answer
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
      MaterialPageRoute(builder: (context) => const MyHomePage(title: '')),
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
                  color:
                      selectedAnswerIndex == correctAnswerIndex
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

class Arm extends StatelessWidget {
  //change based on question name
  const Arm({super.key, required this.title});

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
              'images/Robotic_Arm.jpeg', // Replace with appropriate image for question

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
                  MaterialPageRoute(builder: (context) => const ArmQ()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(70, 29, 124, 1),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
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

class ArmQ extends StatefulWidget {
  const ArmQ({super.key});

  @override
  _ArmQState createState() => _ArmQState();
}

class _ArmQState extends State<ArmQ> {
  String question =
      "What is the room number that contains the Fanuc robotic arm?"; //change question
  List<String> options = [
    "1224",
    "1390",
    "1500",
    "1300",
  ]; //change answer choices
  int correctAnswerIndex = 3; // "1300" is correct, changes correct answer
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
      MaterialPageRoute(builder: (context) => const MyHomePage(title: '')),
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
                  color:
                      selectedAnswerIndex == correctAnswerIndex
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

class Bluebook extends StatelessWidget {
  //change based on question name
  const Bluebook({super.key, required this.title});

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
              'images/Vendingmachine(1stfloor).jpeg', // Replace with appropriate image for question

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
                  MaterialPageRoute(builder: (context) => const BluebookQ()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(70, 29, 124, 1),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
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

class BluebookQ extends StatefulWidget {
  const BluebookQ({super.key});

  @override
  _BluebookQState createState() => _BluebookQState();
}

class _BluebookQState extends State<BluebookQ> {
  String question =
      "What floor has a vending machine where you can purchase bluebooks?"; //change question
  List<String> options = ["1st", "2nd", "3rd", "none"]; //change answer choices
  int correctAnswerIndex = 0; // "Mike" is correct, changes correct answer
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
      MaterialPageRoute(builder: (context) => const MyHomePage(title: '')),
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
                  color:
                      selectedAnswerIndex == correctAnswerIndex
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

class AmongUs extends StatelessWidget {
  const AmongUs({super.key, required this.title});
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
              'images/AmongUs.jpeg', // Replace with appropriate image for question

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
                  MaterialPageRoute(builder: (context) => const AmongUsQ()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(70, 29, 124, 1),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
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

class AmongUsQ extends StatefulWidget {
  const AmongUsQ({super.key});

  @override
  _AmongUsQState createState() => _AmongUsQState();
}

class _AmongUsQState extends State<AmongUsQ> {
  String question =
      "What is the room number that contains the Among Us artwork on a whiteboard?"; //change question
  List<String> options = [
    "2317",
    "2219",
    "2700",
    "2418",
  ]; //change answer choices
  int correctAnswerIndex = 0; // "2317" is correct, changes correct answer
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
      MaterialPageRoute(builder: (context) => const MyHomePage(title: '')),
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
                  color:
                      selectedAnswerIndex == correctAnswerIndex
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

class MMR extends StatelessWidget {
  const MMR({super.key, required this.title});
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
              'images/MMR_upclose.jpeg', // Replace with appropriate image for question

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
                  MaterialPageRoute(builder: (context) => const MMRQ()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(70, 29, 124, 1),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
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

class MMRQ extends StatefulWidget {
  const MMRQ({super.key});

  @override
  _MMRStateQ createState() => _MMRStateQ();
}

class _MMRStateQ extends State<MMRQ> {
  String question =
      "What is the room number that contains the MMR Machine?"; //change question
  List<String> options = [
    "2233",
    "2262",
    "2348",
    "2468",
  ]; //change answer choices
  int correctAnswerIndex = 2; // "2317" is correct, changes correct answer
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
      MaterialPageRoute(builder: (context) => const MyHomePage(title: '')),
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
                  color:
                      selectedAnswerIndex == correctAnswerIndex
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

class Plane extends StatelessWidget {
  const Plane({super.key, required this.title});
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
                  MaterialPageRoute(builder: (context) => const PlaneQ()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(70, 29, 124, 1),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
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

class PlaneQ extends StatefulWidget {
  const PlaneQ({super.key});

  @override
  _PlaneQ createState() => _PlaneQ();
}

class _PlaneQ extends State<PlaneQ> {
  String question =
      "What is the office number that contains the model airplane?"; //change question
  List<String> options = [
    "3602",
    "3304",
    "3422",
    "3261",
  ]; //change answer choices
  int correctAnswerIndex = 3; // "3261" is correct, changes correct answer
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
      MaterialPageRoute(builder: (context) => const MyHomePage(title: '')),
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
                  color:
                      selectedAnswerIndex == correctAnswerIndex
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

class UniverseChart extends StatelessWidget {
  const UniverseChart({super.key, required this.title});
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
              'images/Universestandard_chart.jpeg', // Replace with appropriate image for question

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
                    builder: (context) => const UniverseChartQ(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(70, 29, 124, 1),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 15,
                ),
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

class UniverseChartQ extends StatefulWidget {
  const UniverseChartQ({super.key});

  @override
  _UniverseChartQ createState() => _UniverseChartQ();
}

class _UniverseChartQ extends State<UniverseChartQ> {
  String question =
      "Which room number has this funny chart placed on its door?"; //change question
  List<String> options = [
    "3352",
    "3316",
    "3426",
    "3313",
  ]; //change answer choices
  int correctAnswerIndex = 1; // "3316" is correct, changes correct answer
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
      MaterialPageRoute(builder: (context) => const MyHomePage(title: '')),
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
                  color:
                      selectedAnswerIndex == correctAnswerIndex
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
