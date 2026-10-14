import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUserinfo {

  String _name="nameKey";
    String _image="imageKey";
    String _email="emailKey";

// set shared prefrens
Future<void> saveinfo({required String name,required String image,required String email}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_name, name);
    await prefs.setString(_image, image);
     await prefs.setString(_email, email);

    
  }

  // static Future<Map<String, dynamic>?> getBooking() async {
  //    final prefs = await SharedPreferences.getInstance();
  //    final name = prefs.getString(_name);
  //    final image=prefs.getString(_image);
    
  
  //  }

  

}