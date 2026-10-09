import 'package:barbershop/pages/booking_page.dart';
import 'package:barbershop/pages/login_page.dart';
import 'package:barbershop/pages/onbording_page.dart';
import 'package:barbershop/pages/signup_page.dart';
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
      home: SignupPage(),
    );
  }
}


