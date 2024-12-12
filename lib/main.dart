import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(BarbershopApp());
}

class BarbershopApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Barbershop App',
      theme: ThemeData(
        primaryColor: Colors.brown,
      ),
      home: HomePage(),
    );
  }
}
