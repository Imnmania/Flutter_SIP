import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String data;

  const HomeScreen({Key? key, required this.data}) : super(key: key);
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Text(widget.data),
      ),
    );
  }
}
