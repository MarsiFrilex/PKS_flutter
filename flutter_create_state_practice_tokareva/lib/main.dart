import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CounterApp(),debugShowCheckedModeBanner: false,);
  }
}

class CounterApp extends StatefulWidget {
  @override
  _CounterAppState createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int counter = 0;

  void increment() {
    setState(() {
      counter; // обновляем состояние
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Практика 4")),
      body: Center(
        child: Container(
          width: 200,
          height: 300,
          decoration: BoxDecoration(gradient: 
          LinearGradient(colors:[ 
          Color.fromARGB(255, 202, 202, 202),
          Color.fromARGB(255, 78, 78, 78)]),
          borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: [
              SizedBox(
                width: 20,
                height: 20,
              ),
              Text("Счетчик: $counter", style: TextStyle
                (color: const Color.fromARGB(255, 240, 215, 255),
                fontSize: 20)),
              SizedBox(
                width: 20,
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    counter += 1;
                  });
                },
                onLongPress: (){
                  setState(() {
                    counter += 10;
                  });
                },
                child: Text("Увеличить"),
              ),
              SizedBox(
                width: 20,
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    counter = 0;
                  });
                },
                child: Text("Сбросить"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}