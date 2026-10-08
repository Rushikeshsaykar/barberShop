import 'package:barbershop/pages/bookingpage.dart';
import 'package:barbershop/pages/onbordingpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Bookingpage(),
    );
  }
}


