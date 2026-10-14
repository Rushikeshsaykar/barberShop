

import 'package:barbershop/pages/Boking_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String? savedUsername;
  String? saveimage;

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  Future<void> _loadSavedData() async {
    final prefs = await _prefs;
    setState(() {
      savedUsername = prefs.getString('nameKey');
      saveimage = prefs.getString('imageKey');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0D2AC),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 5, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello",
                          style: TextStyle(
                            color: Color(0xFF2B1B0E),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          savedUsername.toString(),
                          style: TextStyle(
                            color: Color(0xFF2B1B0E),
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                    //saveimage.toString()
                    ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(35),
                      child: Image(
                        image: NetworkImage("$saveimage"),
                        height: 65,
                        width: 65,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.person, size: 40),
                        loadingBuilder: (context, child, progress) =>
                            progress == null
                            ? child
                            : const CircularProgressIndicator(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Divider(color: Color(0xFF2B1B0E)),
              ),

              Text(
                "Services",
                style: TextStyle(
                  color: Color(0xFF2B1B0E),
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Card(
                    elevation: 4,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BokingPage(booking: "Clasic Sheving"),
                          ),
                        );
                      },
                      child: Container(
                        width: 170,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Color(0xFFE6BE8A),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage(
                                "assets/images/saving-preview.png",
                              ),
                              height: 100,
                            ),
                            Text(
                              "Clasic Sheving",
                              style: TextStyle(
                                color: Color(0xFF2B1B0E),
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 4,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BokingPage(booking: "Hair Wash",),
                          ),
                        );
                      },
                      child: Container(
                        width: 170,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Color(0xFFE6BE8A),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage(
                                "assets/images/hairdresser.png",
                              ),
                              height: 100,
                            ),
                            Text(
                              "Hair Wash",
                              style: TextStyle(
                                color: Color(0xFF2B1B0E),
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Card(
                    elevation: 4,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BokingPage(booking: "Hair Cutting",),
                          ),
                        );
                      },
                      child: Container(
                        width: 170,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Color(0xFFE6BE8A),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage(
                                "assets/images/haircut-removebg-preview.png",
                              ),
                              height: 100,
                            ),
                            Text(
                              "Hair Cutting",
                              style: TextStyle(
                                color: Color(0xFF2B1B0E),
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 4,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BokingPage(booking:  "Beard Triming",),
                          ),
                        );
                      },
                      child: Container(
                        width: 170,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Color(0xFFE6BE8A),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage(
                                "assets/images/beard-removebg-preview.png",
                              ),
                              height: 100,
                            ),
                            Text(
                              "Beard Triming",
                              style: TextStyle(
                                color: Color(0xFF2B1B0E),
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Card(
                    elevation: 4,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BokingPage(booking: "Fecial",),
                          ),
                        );
                      },
                      child: Container(
                        width: 170,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Color(0xFFE6BE8A),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage("assets/images/wash-face.png"),
                              height: 100,
                            ),
                            Text(
                              "Fecial",
                              style: TextStyle(
                                color: Color(0xFF2B1B0E),
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 4,
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BokingPage(  booking: "Kids HairCutting"),
                          ),
                        );
                      },
                      child: Container(
                        width: 170,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Color(0xFFE6BE8A),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage(
                                "assets/images/kids-removebg-preview.png",
                              ),
                              height: 100,
                            ),
                            Text(
                              "Kids HairCutting",
                              style: TextStyle(
                                color: Color(0xFF2B1B0E),
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
