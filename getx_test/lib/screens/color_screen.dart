import 'package:flutter/material.dart';

class ColorScreen extends StatefulWidget {
  const ColorScreen({super.key});

  @override
  State<ColorScreen> createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorScreen> {
  List colors = [
    Colors.green,
    Colors.red,
    Colors.yellow,
    Colors.blue,
    Colors.black
  ];
  int c = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        for (int i = 0; i < colors.length; i++)
          Expanded(
            child: Container(
              color: colors[(i + c) % (colors.length)],
            ),
          ),
        ElevatedButton(
            onPressed: () {
              c++;
              setState(() {});
            },
            child: Text('Change'))
      ],
    ));
  }
}
