import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUserinfo {

  String _name="nameKey";
    String _image="imageKey";

// set shared prefrens
Future<void> saveinfo(String name,String image) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_name, name);
    await prefs.setString(_image, image);
    
  }

  // static Future<Map<String, dynamic>?> getBooking() async {
  //    final prefs = await SharedPreferences.getInstance();
  //    final name = prefs.getString(_name);
  //    final image=prefs.getString(_image);
    
  
  //  }

  

}