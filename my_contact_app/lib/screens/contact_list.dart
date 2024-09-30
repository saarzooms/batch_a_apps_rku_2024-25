import 'package:flutter/material.dart';

class ContactList extends StatelessWidget {
  const ContactList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => Card(
        child: Column(children: [
          Text('Name'),
          Row(
            children: [
              Text('MobileNo'),
              Text('Email'),
            ],
          ),
          Text('City'),
        ]),
      ),
    ));
  }
}
