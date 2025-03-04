import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void changeColorICons() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
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
        backgroundColor: Color.fromRGBO(70,29,124,1),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text.rich(TextSpan( children: [ TextSpan(text:"LSU", style: TextStyle(color: Color.fromRGBO(253,208,35,1) , fontSize: 45,fontFamily: 'Forza') ),TextSpan(text:"  Scavenger Hunt", style: TextStyle(color: Colors.white , fontSize: 30,fontFamily: 'Forza') )]))

      ),
      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double mapWidth = constraints.maxWidth;
            double mapHeight = mapWidth * (1080 / 1920); // Adjust aspect ratio based on your image

            return Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Container(
                    width: mapWidth,
                    height: mapHeight,
                    child: Image.asset(
                      'Images/LSUM.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(//LSU STADIUM
                  top: mapHeight * 0.72, // Adjust relative to the map
                  left: mapWidth * 0.48, // Adjust relative to the map
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.not_listed_location_sharp,
                      size: 50,
                      color: Color.fromRGBO(253, 208, 35, 1),
                    ),
                  ),
                ),
                Positioned(//PFT
                  top: mapHeight * 0.577, // Adjust relative to the map
                  left: mapWidth * 0.76, // Adjust relative to the map
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.not_listed_location_sharp,
                      size: 50,
                      color: Color.fromRGBO(253, 208, 35, 1),
                    ),
                  ),
                ),
                Positioned(//BUSINESS BUILDING
                  top: mapHeight * 0.52, // Adjust relative to the map
                  left: mapWidth * 0.8, // Adjust relative to the map
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.not_listed_location_sharp,
                      size: 50,
                      color: Color.fromRGBO(253, 208, 35, 1),
                    ),
                  ),
                ),
                Positioned(//library
                  top: mapHeight * 0.42, // Adjust relative to the map
                  left: mapWidth * 0.42, // Adjust relative to the map
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.not_listed_location_sharp,
                      size: 50,
                      color: Color.fromRGBO(253, 208, 35, 1),
                    ),
                  ),
                ),
                Positioned(//student union
                  top: mapHeight * 0.28, // Adjust relative to the map
                  left: mapWidth * 0.54, // Adjust relative to the map
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.not_listed_location_sharp,
                      size: 50,
                      color: Color.fromRGBO(253, 208, 35, 1),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
       // This trailing comma makes auto-formatting nicer for build methods.

  }
}
