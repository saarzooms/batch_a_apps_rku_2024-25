import 'package:flutter/material.dart';

import '../models/contact_person.dart';

class ContactListScreen extends StatefulWidget {
  ContactListScreen({super.key});

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  TextEditingController searchText = TextEditingController();

  List contactPersons = [];
  List allPersons = [
    ContactPerson('Ajay', '8888888888', 'Rajkot', 'Active', '5000'),
    ContactPerson('Vijay', '8888888999', 'Jamnagar', 'Active', '5050'),
    ContactPerson('Jay', '9998888888', 'Surat', 'Active', '5400'),
    ContactPerson('Vishal', '7777777777', 'Morbi', 'Inactive', '5900'),
    ContactPerson('Ajay', '8888888888', 'Rajkot', 'Active', '5000'),
    ContactPerson('Vijay', '8888888999', 'Jamnagar', 'Active', '5050'),
    ContactPerson('Jay', '9998888888', 'Surat', 'Active', '5400'),
    ContactPerson('Vishal', '7777777777', 'Morbi', 'Inactive', '5900'),
    ContactPerson('Ajay', '8888888888', 'Rajkot', 'Active', '5000'),
    ContactPerson('Vijay', '8888888999', 'Jamnagar', 'Active', '5050'),
    ContactPerson('Jay', '9998888888', 'Surat', 'Active', '5400'),
    ContactPerson('Vishal', '7777777777', 'Morbi', 'Inactive', '5900'),
  ];

  @override
  void initState() {
    super.initState();
    contactPersons.addAll(allPersons);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Contact List')),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: searchText,
                ),
              ),
              IconButton(
                onPressed: () {
                  print(searchText.text);
                  print('before ${contactPersons.length}');
                  if (searchText.text.isNotEmpty)
                    contactPersons = allPersons
                        .where((element) => element.name == searchText.text)
                        .toList();
                  else
                    contactPersons.addAll(allPersons);
                  print('after ${contactPersons.length}');
                  setState(() {});
                },
                icon: Icon(Icons.search),
              ),
            ],
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: contactPersons.length,
                  itemBuilder: (context, index) {
                    return myCard(contactPersons[index]);
                  })
              // (
              //   children: [
              //     for (int i = 0; i < contactPersons.length; i++)
              //       myCard(contactPersons[i]),
              //   ],
              // ),
              ),
        ],
      ),
      // Column(
      //   children: [
      //     for (int i = 0; i < contactPersons.length; i++)
      //       myCard(contactPersons[i]
      //           // contactPersons[i]['name'],
      //           // contactPersons[i]['mono'],
      //           // contactPersons[i]['city'],
      //           // contactPersons[i]['status'],
      //           // contactPersons[i]['points'],
      //           ),
      //   ],
      // ),
    );
  }

  Widget myCard(ContactPerson contactPerson) {
    // String name, String mono, String city, String status, String points) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                contactPerson.name,
              ),
              Text(
                contactPerson.points,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(contactPerson.mono),
              Text(contactPerson.city),
              Text(
                contactPerson.status,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: contactPerson.status == 'Active'
                      ? Colors.green
                      : Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
