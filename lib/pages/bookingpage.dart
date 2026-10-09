import 'package:flutter/material.dart';

class Bookingpage extends StatefulWidget {
  const Bookingpage({super.key});

  @override
  State<Bookingpage> createState() => _BookingpageState();
}

class _BookingpageState extends State<Bookingpage> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();

  Future<void> datepicker(BuildContext context) async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2026),
      lastDate: DateTime(2028),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _pickTime(BuildContext context) async {
    final picked = await showTimePicker(context: context, initialTime: _time);
    if (picked != null) setState(() => _time = picked);
  }

  String get _timeText {
    final hour12 = _time.hourOfPeriod == 0 ? 12 : _time.hourOfPeriod;
    final minute = _time.minute.toString().padLeft(2, '0');
    final period = _time.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour12:$minute $period';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF0D2AC),
      appBar: AppBar(backgroundColor: Color(0xFFF0D2AC)),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            height: 160,
            width: double.infinity,
            child: Image(
              image: AssetImage("assets/images/offer.png"),
              fit: BoxFit.fill,
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

          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 117, 69, 30),
              foregroundColor: const Color(0xFFF0D2AC),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: const Text('Book Now'),
          ),
        ],
      ),
    );
  }
}
