import 'package:barbershop/pages/home_page.dart';
import 'package:barbershop/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashfunc();
  }

  void splashfunc() async{
    if (user != null) {
      Future.delayed(const Duration(milliseconds: 1), () {
        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(builder: (_) => const Homepage()),
        );
      });
    } else {
      Future.delayed(const Duration(seconds: 1), () {
        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          CupertinoPageRoute(builder: (_) => const Loginpage()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0D2AC),
     
    );
  }
}
