import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kothon_app/constants/kothon_colors.dart';

class DialPadPage extends StatefulWidget {
  @override
  _DialPadPageState createState() => _DialPadPageState();
}

class _DialPadPageState extends State<DialPadPage> {
  //
  String dialNum = '';
  //
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: 100),
                child: _dialPadWidget(context),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      backgroundColor: KothonColors.greenBtn,
                      heroTag: 'tag3',
                      elevation: 0,
                      onPressed: () {},
                      child: FaIcon(
                        FontAwesomeIcons.phoneAlt,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    FloatingActionButton(
                      backgroundColor: KothonColors.greenBtn,
                      heroTag: 'tag4',
                      elevation: 0,
                      onPressed: () {},
                      child: FaIcon(
                        FontAwesomeIcons.video,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _dialPadWidget(BuildContext context) {
    TextStyle style1 = TextStyle(
      fontSize: 40,
      fontWeight: FontWeight.bold,
    );
    TextStyle style2 = TextStyle(
      fontWeight: FontWeight.bold,
    );

    TextStyle style3 = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    );

    // String displayNumber;

    // _backSpace() {
    //   displayNumber = '';
    // }

    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// Back Button and Top Dark Area ///
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: Color(0xFF3C5364),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: FaIcon(
                    FontAwesomeIcons.chevronLeft,
                    color: KothonColors.backgroundColor,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 54, vertical: 20),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border(
                        // left: BorderSide(color: KothonColors.numpadDivColor),
                        // right: BorderSide(color: KothonColors.numpadDivColor),
                        // top: BorderSide(color: KothonColors.numpadDivColor),
                        bottom: BorderSide(
                          color: KothonColors.numpadDivColor,
                          width: 2,
                        ),
                      ),
                    ),
                    child: dialNum == ''
                        ? Text(
                            'Enter a Number',
                            style: style3.copyWith(
                              fontWeight: FontWeight.normal,
                            ),
                          )
                        : Text(
                            dialNum,
                            style: style3,
                          ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),

                /// BACK SPACE ///
                GestureDetector(
                  child: FaIcon(
                    FontAwesomeIcons.backspace,
                    size: 35,
                  ),

                  /// for single press ///
                  onTap: () {
                    if (dialNum.length == 0) {
                      return;
                    }

                    setState(() {
                      dialNum = dialNum.substring(0, dialNum.length - 1);
                    });
                  },

                  /// for long press ///
                  onLongPress: () {
                    if (dialNum.length == 0) {
                      return;
                    }

                    setState(() {
                      dialNum = '';
                    });
                  },
                ),
              ],
            ),
          ),
          // SizedBox(
          //   height: 15,
          // ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// KEY 1 ///
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    // left: BorderSide(color: KothonColors.numpadDivColor),
                    right: BorderSide(color: KothonColors.numpadDivColor),
                    // top: BorderSide(color: KothonColors.numpadDivColor),
                    bottom: BorderSide(color: KothonColors.numpadDivColor),
                  ),
                ),
                child: MaterialButton(
                  height: 100,
                  minWidth: 100,
                  child: Column(
                    children: [
                      Text(
                        '1',
                        style: style1,
                      ),
                      Icon(Icons.voicemail),
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      dialNum = dialNum + '1';
                    });
                  },
                ),
              ),

              /// KEY 2 ///
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: KothonColors.numpadDivColor),
                    right: BorderSide(color: KothonColors.numpadDivColor),
                    // top: BorderSide(color: KothonColors.numpadDivColor),
                    bottom: BorderSide(color: KothonColors.numpadDivColor),
                  ),
                ),
                child: MaterialButton(
                  height: 100,
                  minWidth: 100,
                  child: Column(
                    children: [
                      Text(
                        '2',
                        style: style1,
                      ),
                      Text(
                        'ABC',
                        style: style2,
                      ),
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      dialNum = dialNum + '2';
                    });
                  },
                ),
              ),

              /// KEY 3 ///
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: KothonColors.numpadDivColor),
                    // right: BorderSide(color: KothonColors.numpadDivColor),
                    // top: BorderSide(color: KothonColors.numpadDivColor),
                    bottom: BorderSide(color: KothonColors.numpadDivColor),
                  ),
                ),
                child: MaterialButton(
                  height: 100,
                  minWidth: 100,
                  child: Column(
                    children: [
                      Text(
                        '3',
                        style: style1,
                      ),
                      Text(
                        'DEF',
                        style: style2,
                      ),
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      dialNum = dialNum + '3';
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// KEY 4 ///
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    // left: BorderSide(color: KothonColors.numpadDivColor),
                    right: BorderSide(color: KothonColors.numpadDivColor),
                    top: BorderSide(color: KothonColors.numpadDivColor),
                    bottom: BorderSide(color: KothonColors.numpadDivColor),
                  ),
                ),
                child: MaterialButton(
                  height: 100,
                  minWidth: 100,
                  child: Column(
                    children: [
                      Text(
                        '4',
                        style: style1,
                      ),
                      Text(
                        'GHI',
                        style: style2,
                      ),
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      dialNum = dialNum + '4';
                    });
                  },
                ),
              ),

              /// KEY 5 ///
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: KothonColors.numpadDivColor),
                    right: BorderSide(color: KothonColors.numpadDivColor),
                    top: BorderSide(color: KothonColors.numpadDivColor),
                    bottom: BorderSide(color: KothonColors.numpadDivColor),
                  ),
                ),
                child: MaterialButton(
                  height: 100,
                  minWidth: 100,
                  child: Column(
                    children: [
                      Text(
                        '5',
                        style: style1,
                      ),
                      Text(
                        'JKL',
                        style: style2,
                      ),
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      dialNum = dialNum + '5';
                    });
                  },
                ),
              ),

              /// KEY 6 ///
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: KothonColors.numpadDivColor),
                    // right: BorderSide(color: KothonColors.numpadDivColor),
                    top: BorderSide(color: KothonColors.numpadDivColor),
                    bottom: BorderSide(color: KothonColors.numpadDivColor),
                  ),
                ),
                child: MaterialButton(
                  height: 100,
                  minWidth: 100,
                  child: Column(
                    children: [
                      Text(
                        '6',
                        style: style1,
                      ),
                      Text(
                        'MNO',
                        style: style2,
                      ),
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      dialNum = dialNum + '6';
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// KEY 7 ///
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    // left: BorderSide(color: KothonColors.numpadDivColor),
                    right: BorderSide(color: KothonColors.numpadDivColor),
                    top: BorderSide(color: KothonColors.numpadDivColor),
                    bottom: BorderSide(color: KothonColors.numpadDivColor),
                  ),
                ),
                child: MaterialButton(
                  height: 100,
                  minWidth: 100,
                  child: Column(
                    children: [
                      Text(
                        '7',
                        style: style1,
                      ),
                      Text(
                        'PQRS',
                        style: style2,
                      ),
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      dialNum = dialNum + '7';
                    });
                  },
                ),
              ),

              /// KEY 8 ///
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: KothonColors.numpadDivColor),
                    right: BorderSide(color: KothonColors.numpadDivColor),
                    top: BorderSide(color: KothonColors.numpadDivColor),
                    bottom: BorderSide(color: KothonColors.numpadDivColor),
                  ),
                ),
                child: MaterialButton(
                  height: 100,
                  minWidth: 100,
                  child: Column(
                    children: [
                      Text(
                        '8',
                        style: style1,
                      ),
                      Text(
                        'TUV',
                        style: style2,
                      ),
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      dialNum = dialNum + '8';
                    });
                  },
                ),
              ),

              /// KEY 9 ///
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: KothonColors.numpadDivColor),
                    top: BorderSide(color: KothonColors.numpadDivColor),
                    bottom: BorderSide(color: KothonColors.numpadDivColor),
                  ),
                ),
                child: MaterialButton(
                  height: 100,
                  minWidth: 100,
                  child: Column(
                    children: [
                      Text(
                        '9',
                        style: style1,
                      ),
                      Text(
                        'WXYZ',
                        style: style2,
                      ),
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      dialNum = dialNum + '9';
                    });
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// KEY */+ ///
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    right: BorderSide(color: KothonColors.numpadDivColor),
                    top: BorderSide(
                      color: KothonColors.numpadDivColor,
                    ),
                  ),
                ),
                child: MaterialButton(
                  height: 100,
                  minWidth: 100,
                  onPressed: () {
                    setState(() {
                      dialNum = dialNum + '*';
                    });
                  },
                  child: Center(
                    child: Icon(
                      CommunityMaterialIcons.asterisk,
                      size: 30,
                    ),
                  ),
                ),
              ),

              /// KEY 0 ///
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: KothonColors.numpadDivColor),
                    top: BorderSide(color: KothonColors.numpadDivColor),
                    right: BorderSide(color: KothonColors.numpadDivColor),
                  ),
                ),
                child: MaterialButton(
                  height: 100,
                  minWidth: 100,
                  child: Column(
                    children: [
                      Text(
                        '0',
                        style: style1,
                      ),
                      Text(
                        '+',
                        style: style2,
                      ),
                    ],
                  ),
                  onPressed: () {
                    setState(() {
                      dialNum = dialNum + '0';
                    });
                  },
                  onLongPress: () {
                    setState(() {
                      dialNum = dialNum + '+';
                    });
                  },
                ),
              ),

              /// KEY # ///
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: KothonColors.numpadDivColor),
                    top: BorderSide(color: KothonColors.numpadDivColor),
                  ),
                ),
                child: MaterialButton(
                  height: 100,
                  minWidth: 100,
                  child: Text(
                    '#',
                    style: style1.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 35,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      dialNum = dialNum + '#';
                    });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
