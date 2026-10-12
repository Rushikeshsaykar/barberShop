import 'package:barbershop/pages/home_page.dart';
import 'package:barbershop/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController namecontroler = TextEditingController();
  TextEditingController emailcontroler = TextEditingController();
  TextEditingController paswordcontroler = TextEditingController();

  final auth = FirebaseAuth.instance;

  registration() async {
    try {
      await auth.createUserWithEmailAndPassword(
        email: emailcontroler.text,
        password: paswordcontroler.text,
      );

     Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Homepage()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Email Already existed")));
      } else if (e.code == "weak-password") {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('week password')));
      } else if (e.code == "invalid-email") {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('IInvalid email')));
      }
    }
  }

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
        child: Form(
          key: _formKey,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Create Account",
                  style: TextStyle(
                    fontSize: 22,
                    color: Color(0xFF2B1B0E),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: namecontroler,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    hintText: 'Name',

                    prefixIcon: Icon(Icons.person, color: Color(0xFF2B1B0E)),
                  ),
                ),
                SizedBox(height: 60),
                TextFormField(
                  controller: emailcontroler,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Email',

                    prefixIcon: Icon(Icons.email, color: Color(0xFF2B1B0E)),
                  ),
                ),
                SizedBox(height: 60),

                TextFormField(
                  controller: paswordcontroler,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Password',

                    prefixIcon: Icon(Icons.lock, color: Color(0xFF2B1B0E)),
                  ),
                ),

                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Alredy have account!"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Loginpage()),
                        );
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Container(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        registration();
                        
                      }
                    },
                    child: Text(
                      "SignUp",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
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
      ),
    );
  }
}
