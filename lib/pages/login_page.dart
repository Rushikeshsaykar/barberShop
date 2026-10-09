import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFBEBD3), // light cream
              Color(0xFFF0D2AC), // your theme color
              Color(0xFFE0A96D), // warm caramel
            ],
          ),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Wellcome! Login here",
                style: TextStyle(
                  fontSize: 22,
                  color: Color(0xFF2B1B0E),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Email',

                  prefixIcon: Icon(Icons.email, color: Color(0xFF2B1B0E)),
                ),
              ),
              SizedBox(height: 60),

              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',

                  prefixIcon: Icon(Icons.lock, color: Color(0xFF2B1B0E)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Dont have account!"),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "SignUp",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),SizedBox(height: 15,),
              Container(height: 50,width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "login",
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 19),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2B1B0E), // dark brown
                    foregroundColor: const Color(
                      0xFFF0D2AC,
                    ), // your theme color for text
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
