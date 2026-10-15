import 'dart:io';

import 'package:barbershop/pages/Boking_page.dart';
import 'package:barbershop/services/shared_prefrens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  String? savedUsername;

  final ImagePicker _picker = ImagePicker();
  File? _image;

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? picked = await _picker.pickImage(
        source: source,
        imageQuality: 100,
      );
      if (picked == null) return;

      await SharedPrefUserinfo().saveimage(image: picked.path);
      if (!mounted) return;
      setState(() => _image = File(picked.path));
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Unable to select or save image: $error")),
      );
    }
  }

  Future<void> _loadSavedData() async {
    final prefs = await _prefs;
    final imagePath = prefs.getString('imageKey');
    final imageFile = imagePath == null ? null : File(imagePath);
    final imageExists = imageFile != null && await imageFile.exists();

    if (!mounted) return;
    setState(() {
      savedUsername = prefs.getString('nameKey');
      if (imageExists) {
        _image = imageFile;
      }
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
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 60,
                        width: 60,
                        color: Colors.deepPurple,
                        child: InkWell(
                          onTap: () {
                            _showImageSourceSheet(context);
                          },
                          child: _image == null
                              ? Image.asset(
                                  "assets/images/person.png",
                                  fit: BoxFit.cover,
                                )
                              : Image.file(_image!, fit: BoxFit.cover),
                        ),
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
                          CupertinoPageRoute(
                            builder: (context) =>
                                BokingPage(booking: "Clasic Sheving"),
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
                          CupertinoPageRoute(
                            builder: (context) =>
                                BokingPage(booking: "Hair Wash"),
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
                          CupertinoPageRoute(
                            builder: (context) =>
                                BokingPage(booking: "Hair Cutting"),
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
                          CupertinoPageRoute(
                            builder: (context) =>
                                BokingPage(booking: "Beard Triming"),
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
                          CupertinoPageRoute(
                            builder: (context) => BokingPage(booking: "Fecial"),
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
                          CupertinoPageRoute(
                            builder: (context) =>
                                BokingPage(booking: "Kids HairCutting"),
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

  void _showImageSourceSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min, // sheet wraps its content
              children: [
                ListTile(
                  leading: const Icon(Icons.camera_alt),
                  title: const Text("Camera"),
                  onTap: () {
                    _pickImage(ImageSource.camera);
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.photo_library),
                  title: const Text("Gallery"),
                  onTap: () {
                    _pickImage(ImageSource.gallery);
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
