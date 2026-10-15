import 'package:barbershop/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class bookingadminpage extends StatefulWidget {
  const bookingadminpage({super.key});

  @override
  State<bookingadminpage> createState() => _bookingadminpageState();
}

class _bookingadminpageState extends State<bookingadminpage> {
  // ignore: non_constant_identifier_names
  Stream? Bookingstream;

  Future<void> getontheload() async {
    Bookingstream = await DatabaseMethod().getBoking();
    setState(() {});
  }

  void initState() {
    super.initState(); // always call super first
    getontheload();
  }

  Widget allBoking() {
    return StreamBuilder(
      stream: Bookingstream,
      builder: (context, AsyncSnapshot snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: snapshot.data.docs.length,
                itemBuilder: ((context, index) {
                  DocumentSnapshot ds = snapshot.data.docs[index];
                  return Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.symmetric(vertical: 25),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(222, 139, 94, 52),
                          Color.fromARGB(218, 192, 140, 84),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: NetworkImage(ds["Image"]),
                          ),
                          Text(
                            "Service Book: ${ds["Service"]}",
                            style: TextStyle(
                              color: Color(0xFF2B1B0E),
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "Name: ${ds["Name"]}",
                            style: TextStyle(
                              color: Color(0xFF2B1B0E),
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "Date: ${ds["Date"]}",
                            style: TextStyle(
                              color: Color(0xFF2B1B0E),
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            "Time:${ds["Time"]}",
                            style: TextStyle(
                              color: Color(0xFF2B1B0E),
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () async {
                              await DatabaseMethod().deteteBooking(ds["id"]);

                              setState(() {});
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(
                                255,
                                242,
                                218,
                                179,
                              ),
                              foregroundColor: const Color.fromARGB(
                                255,
                                59,
                                41,
                                20,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                                vertical: 14,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14),
                              ),
                              elevation: 4,
                            ),
                            child: const Text(
                              'Close',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              )
            : Container();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0D2AC),

      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "All Bookings",
                  style: TextStyle(
                    color: Color(0xFF2B1B0E),
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
                Divider(color: Colors.black),
                Padding(padding: const EdgeInsets.symmetric(horizontal: 8), child: allBoking()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
