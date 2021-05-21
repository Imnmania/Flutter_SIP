import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kothon_app/constants/kothon_colors.dart';
import 'package:kothon_app/logic/cubit/comm_bottom_nav_cubit.dart';
import 'package:kothon_app/presentation/communication_module/page_view_items/dial_pad.dart';
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
              physics: NeverScrollableScrollPhysics(),
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
          Align(
            // bottom: 10,
            // right: sWidth * 0.345,
            alignment: Alignment.bottomCenter,

            child: Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Dial Pad ///
                  FloatingActionButton(
                    heroTag: 'tag1',
                    backgroundColor: KothonColors.greenBtn,
                    elevation: 0,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DialPadPage()));
                    },
                    child: Icon(
                      CommunityMaterialIcons.dialpad,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),

                  /// Conference Call ///
                  FloatingActionButton(
                    heroTag: 'tag2',
                    backgroundColor: KothonColors.greenBtn,
                    elevation: 0,
                    onPressed: () {},
                    child: Icon(
                      CommunityMaterialIcons.account_group,
                    ),
                  ),
                ],
              ),
            ),
          )
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
