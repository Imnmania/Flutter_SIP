import 'package:flutter/material.dart';
import 'package:kothon_app/presentation/common_widgets/kothon_header.dart';

class CommunicationHome extends StatefulWidget {
  @override
  _CommunicationHomeState createState() => _CommunicationHomeState();
}

class _CommunicationHomeState extends State<CommunicationHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            child: KothonHeader(),
          ),
        ],
      ),
    );
  }
}
