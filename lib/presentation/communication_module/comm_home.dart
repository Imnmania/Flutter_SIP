import 'package:flutter/material.dart';
import 'package:kothon_app/presentation/common_widgets/kothon_header.dart';

class CommunicationHome extends StatelessWidget {
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
