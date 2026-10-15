import 'package:barbershop/Admin/booking_admin.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Adminlogin extends StatefulWidget {
  const Adminlogin({super.key});

  @override
  State<Adminlogin> createState() => _AdminloginState();
}

class _AdminloginState extends State<Adminlogin> {
  TextEditingController namecontroler = TextEditingController();
  TextEditingController passwordcontroler = TextEditingController();
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
                "Wellcome! Admin Login here",
                style: TextStyle(
                  fontSize: 22,
                  color: Color(0xFF2B1B0E),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: namecontroler,

                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  hintText: 'User Name',

                  prefixIcon: Icon(Icons.person, color: Color(0xFF2B1B0E)),
                ),
              ),
              SizedBox(height: 60),

              TextFormField(
                controller: passwordcontroler,

                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',

                  prefixIcon: Icon(Icons.lock, color: Color(0xFF2B1B0E)),
                ),
              ),

              SizedBox(height: 30),

              SizedBox(height: 15),
              Container(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  child: Text(
                    "login",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                  ),
                  onPressed: () => _adminlogin(),

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

  Future _adminlogin() async {
    
    await FirebaseFirestore.instance.collection("Admin").get().then((snapshot) {
      snapshot.docs.forEach((result) {
        if (result.data()["id"] != namecontroler.text.toLowerCase().trim()) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Wrong User Name",style: TextStyle(fontSize: 17),)));
        }
       else if (result.data()["password"] != passwordcontroler.text.trim()) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Wrong Password",style: TextStyle(fontSize: 17))));
        } else {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Wellcome.... ",style: TextStyle(fontSize: 17))));

          Navigator.pushReplacement(
            context,
            CupertinoPageRoute(builder: (context) => bookingadminpage()),
          );
        }
      });
    });
  }
}
