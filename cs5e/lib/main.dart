import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('Mammt tua mia'),
        ),
        body: Center(
          child: Container(
            child: const Text('test'),
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            color: Colors.red,
            height: 100,
            width: 100,
            //decoration: BoxDecoration(shape: BoxShape.circle),
          ),
        ),
      ),
    );
  }
}
