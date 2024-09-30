import 'package:flutter/material.dart';
import 'package:my_contact_app/screens/contact_list.dart';

import '../services/firebase_operations.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ContactList(),
                ));
              },
              icon: Icon(
                Icons.menu,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            TextField(decoration: InputDecoration(labelText: 'Name')),
            TextField(decoration: InputDecoration(labelText: 'MobileNo')),
            TextField(decoration: InputDecoration(labelText: 'Email')),
            TextField(decoration: InputDecoration(labelText: 'City')),
            ElevatedButton(
              onPressed: () {
                FirebaseOperations().addData();
              },
              child: Text('Save'),
            ),
          ],
        ));
  }
}
