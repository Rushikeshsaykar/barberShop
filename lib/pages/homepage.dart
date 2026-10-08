import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0D2AC),
      body: SafeArea(
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
                        "Rushikesh Saykar",
                        style: TextStyle(
                          color: Color(0xFF2B1B0E),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),

                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(35),
                    child: Image(
                      image: AssetImage("assets/images/girl.jpg"),
                      height: 65,
                      width: 65,
                      fit: BoxFit.cover,
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
                Card(elevation: 4,
                  child: Container(
                    width: 170,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Color(0xFFE6BE8A),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                Card(
                  elevation: 4 ,
                  child: Container(
                    width: 170,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Color(0xFFE6BE8A),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
