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
          title: Text.rich(TextSpan(children: [
            TextSpan(
                text: "LSU",
                style: TextStyle(
                    color: Color.fromRGBO(253, 208, 35, 1),
                    fontSize: 45,
                    fontFamily: 'Forza')),
            TextSpan(
                text: "  Scavenger Hunt",
                style: TextStyle(
                    color: Colors.white, fontSize: 30, fontFamily: 'Forza'))
          ]))),
      //above this is the app bar please do not touch

      body: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            double mapWidth = constraints.maxWidth;
            double mapHeight = constraints.maxHeight*0.60;// Adjust aspect ratio based on your image

            return Stack(
              children: [

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0, left: 50.0,top: 500.0, bottom: 500.0),
                      child: Column(//these are the buttons
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(onPressed: changeMap1 , child: Text('  First Floor  ')),
                          ElevatedButton(onPressed: changeMap2 , child: Text('Second Floor')),
                          ElevatedButton(onPressed: changeMap3 , child: Text('  Third Floor  '))
                        ],
                      ),
                    ),//buttons for the floors above
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 30.0),
                            child: Text('    Click the buttons to find all \nthe keys and end your journey.', style: TextStyle(color: Color.fromRGBO(253, 208, 35, 1),fontSize: 30, fontFamily: 'Forza')),
                          ),
                          SizedBox(
                            width: mapWidth,
                            height: mapHeight,
                            child: Stack(
                              children: [
                                Image.asset(
                                    currentpage,
                                    fit: BoxFit.fill
                                ),
                                if(currentpage == 'Images/firstF.png')...[
                                  Positioned(
                                    top: mapHeight * 0.12,
                                    left: mapWidth * 0.18,
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
                                    top: mapHeight * 0.10,
                                    left: mapWidth * 0.10,
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.not_listed_location_sharp,
                                        size: 50,
                                        color: Color.fromRGBO(253, 208, 35, 1),
                                      ),
                                    ),
                                  ),
                                ]
                              ]
                            )
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
