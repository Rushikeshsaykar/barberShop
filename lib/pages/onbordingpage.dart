import 'package:barbershop/main.dart';
import 'package:barbershop/pages/homepage.dart';
import 'package:flutter/material.dart';

class Onbordingpage extends StatefulWidget {
  const Onbordingpage({super.key});

  @override
  State<Onbordingpage> createState() => _OnbordingpageState();
}

class _OnbordingpageState extends State<Onbordingpage> {


 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashfunc();
  }

  void splashfunc() {
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const Homepage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0D2AC),
      body: Container(
        margin: EdgeInsets.only(top: 250),
        child: Image(image: AssetImage("assets/images/1328.png")),
      ),
    );
  }
}
