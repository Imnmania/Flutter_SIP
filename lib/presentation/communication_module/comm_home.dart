import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kothon_app/logic/cubit/comm_bottom_nav_cubit.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:kothon_app/logic/cubit/comm_bottom_nav_cubit.dart';
import 'package:kothon_app/presentation/communication_module/widgets/comm_bottom_nav.dart';
import 'package:kothon_app/presentation/common_widgets/kothon_header.dart';
import 'package:kothon_app/presentation/communication_module/page_view_items/call_history.dart';
import 'package:kothon_app/presentation/communication_module/page_view_items/contacts.dart';
import 'package:kothon_app/presentation/communication_module/page_view_items/messages.dart';
import 'package:kothon_app/presentation/communication_module/page_view_items/speed_dial.dart';

class CommunicationHome extends StatefulWidget {
  @override
  _CommunicationHomeState createState() => _CommunicationHomeState();
}

class _CommunicationHomeState extends State<CommunicationHome> {
  //
  final pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    //
    // var btnId = context.watch<CommBottomNavCubit>().state.btnNo;

    final sHeight = MediaQuery.of(context).size.height;
    // final sWidth = MediaQuery.of(context).size.width;
    //
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            child: KothonHeader(),
          ),
          Container(
            padding: EdgeInsets.only(top: sHeight * 0.1),
            child: PageView(
              controller: pageController,
              pageSnapping: true,
              onPageChanged: (value) {
                print(value);
                context.read<CommBottomNavCubit>().changeId(value);
              },
              children: [
                SpeedDial(),
                History(),
                Contacts(),
                Messages(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CommBottomNav(
        speedDialFunc: () {
          context.read<CommBottomNavCubit>().changeId(0);
          pageController.animateToPage(
            0,
            duration: Duration(milliseconds: 200),
            curve: Curves.bounceInOut,
          );
        },
        historyFunc: () {
          context.read<CommBottomNavCubit>().changeId(1);
          pageController.animateToPage(
            1,
            duration: Duration(milliseconds: 200),
            curve: Curves.bounceInOut,
          );
        },
        contactsFunc: () {
          context.read<CommBottomNavCubit>().changeId(2);
          pageController.animateToPage(
            2,
            duration: Duration(milliseconds: 200),
            curve: Curves.bounceInOut,
          );
        },
        messagesFunc: () {
          context.read<CommBottomNavCubit>().changeId(3);
          pageController.animateToPage(
            3,
            duration: Duration(milliseconds: 200),
            curve: Curves.bounceInOut,
          );
        },
      ),
    );
  }
}
