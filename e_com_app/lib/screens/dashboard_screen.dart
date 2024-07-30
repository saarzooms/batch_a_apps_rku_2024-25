import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String user = "";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // user = await prefs.getString('user') ?? "";
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Column(
        children: [
          // Text('Welcome ${user}'),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => ListTile(
                title: Text('Hi '),
              ),
            ),
          )
        ],
      ),
    );
  }
}
