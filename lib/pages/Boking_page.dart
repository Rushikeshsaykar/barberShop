import 'package:barbershop/services/database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BokingPage extends StatefulWidget {
  String? booking;
  BokingPage({super.key, required this.booking});

  @override
  State<BokingPage> createState() => _BokingPageState();
}

class _BokingPageState extends State<BokingPage> {
  DateTime _selectedDate = DateTime.now();

  TimeOfDay _time = TimeOfDay.now();
  final _prefs = SharedPreferences.getInstance();

  String? savedUsername;
  String? savedEmail;

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  Future<void> _loadSavedData() async {
    final prefs = await _prefs;
    setState(() {
      savedUsername = prefs.getString('nameKey');
      savedEmail = prefs.getString('emailKey');
    });
  }

  Future<void> datepicker(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2026),
      lastDate: DateTime(2028),
    );
    if (pickedDate != null)
      setState(() {
        _selectedDate = pickedDate;
      });
  }

  Future<void> _pickTime(BuildContext context) async {
    final picked = await showTimePicker(context: context, initialTime: _time);
    if (picked != null)
      setState(() {
        _time = picked;
      });
  }

  String get _timeText {
    final hour12 = _time.hourOfPeriod == 0 ? 12 : _time.hourOfPeriod;
    final minute = _time.minute.toString().padLeft(2, '0');
    final period = _time.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour12:$minute $period';
  }

  //database boking function
  Future<void> booking() async {
    try {
      var id = DateTime.now().microsecondsSinceEpoch.toString();

      Map<String, dynamic> bookingdetail = {
        "Name": savedUsername,
        "Email": savedEmail,
        "Service": widget.booking,
        "Date":
            "${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}",
        "Time": _time.format(context),
        
      };
      await DatabaseMethod().addboking(bookingdetail, id);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Booking successful")));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Try After SOme time")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0D2AC),
      appBar: AppBar(backgroundColor: Color(0xFFF0D2AC)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: const Color(0xFF724220),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF0D5B0),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Icon(
                          Icons.discount_outlined,
                          size: 30,
                          color: Color(0xFF724220),
                        ),
                      ),
                      const SizedBox(width: 14),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '50% off',
                              style: TextStyle(
                                color: Color(0xFFF8E6C8),
                                fontSize: 26,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'On your first booking',
                              style: TextStyle(
                                color: Color(0xFFE6BF8C),
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color(0xFFE6BF8C),
                        width: 1,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'FIRST50',
                          style: TextStyle(
                            color: Color(0xFFF8E6C8),
                            fontSize: 16,
                            letterSpacing: 1,
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            // Clipboard.setData(
                            //   const ClipboardData(text: 'FIRST50'),
                            // );
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Code applied')),
                            );
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: const Color(0xFFE6BF8C),
                          ),

                          label: const Text('Apply'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Boking for : ${widget.booking}",
                  style: TextStyle(
                    color: Color(0xFF2B1B0E),
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFFE6BE8A),
              ),
              child: Column(
                children: [
                  Text(
                    "Select Date",
                    style: TextStyle(
                      color: Color(0xFF2B1B0E),
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => datepicker(context),
                        icon: Icon(Icons.calendar_month),
                        color: Color(0xFF2B1B0E),
                        iconSize: 30,
                      ),
                      Text(
                        "${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}",
                        style: TextStyle(
                          color: Color(0xFF2B1B0E),
                          fontWeight: FontWeight.w700,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xFFE6BE8A),
              ),
              child: Column(
                children: [
                  Text(
                    "Select Time",
                    style: TextStyle(
                      color: Color(0xFF2B1B0E),
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => _pickTime(context),
                        icon: Icon(Icons.alarm),
                        color: Color(0xFF2B1B0E),
                        iconSize: 30,
                      ),
                      Text(
                        _timeText,
                        style: TextStyle(
                          color: Color(0xFF2B1B0E),
                          fontWeight: FontWeight.w700,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 50),

          SizedBox(
            width: 400,
            child: ElevatedButton(
              onPressed: () {
                booking();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 117, 69, 30),
                foregroundColor: const Color(0xFFF0D2AC),
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 14,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text('Book Now'),
            ),
          ),
        ],
      ),
    );
  }
}
