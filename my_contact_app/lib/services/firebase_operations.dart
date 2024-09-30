import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseOperations {
  var db = FirebaseFirestore.instance;
  addData() {
    // Create a new user with a first and last name
    final contact = <String, dynamic>{
      "name": "Ada",
      "mobile": "8855223366",
      "city": "Rajkot"
    };

// Add a new document with a generated ID
    db.collection("contacts").add(contact).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));
  }
}
