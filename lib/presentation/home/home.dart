import 'package:flutter/material.dart';
import 'package:kothon_app/presentation/common_widgets/kothon_header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    //
    final sHeight = MediaQuery.of(context).size.height;
    final sWidth = MediaQuery.of(context).size.width;
    //
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          KothonHeader(sHeight: sHeight, sWidth: sWidth),
        ],
      ),
    );
  }
}
