import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 226, 136, 0)),
      ),
      home: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset(
                'assets/bkg.png',
                width: screenWidth,
                height: screenHeight,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 70,
              left: 30,
              child: Text(
                "Pizza",
                style: TextStyle(
                  fontSize: 64, 
                  fontWeight: FontWeight.w700,
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, screenHeight * 0.18, 0, 0),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      color: const Color.fromARGB(255, 218, 82, 3),
                      width: screenWidth,
                      height: 20,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 200, 0, 0),
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () => {},
                          child: Text(
                            "Тут могла бы быть реклама MAX",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                              color: const Color.fromARGB(255, 213, 82, 1),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.star, color: Colors.amber),
                              Icon(Icons.star, color: Colors.amber),
                              Icon(Icons.star, color: Colors.amber),
                              Icon(Icons.star, color: Colors.amber),
                              Icon(Icons.star, color: Colors.amber),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
