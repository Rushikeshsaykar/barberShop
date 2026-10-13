import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethod {
  // ignore: unused_field
  final _firestore = FirebaseFirestore.instance;
  Future<void> adduserdetails(Map<String, dynamic> userdetail, id) async {
   return await _firestore.collection("user").doc(id).set(userdetail);
  }
}
