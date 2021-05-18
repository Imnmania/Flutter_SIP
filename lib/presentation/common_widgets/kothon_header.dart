import 'package:flutter/material.dart';
import 'package:kothon_app/constants/kothon_colors.dart';
import 'package:kothon_app/constants/kothon_icons.dart';
import 'package:kothon_app/presentation/common_widgets/show_toast.dart';
import 'package:switcher_button/switcher_button.dart';

class KothonHeader extends StatefulWidget {
  final double sHeight;
  final double sWidth;

  const KothonHeader({required this.sHeight, required this.sWidth}) : super();
  @override
  KothonHeaderState createState() => KothonHeaderState();
}

class KothonHeaderState extends State<KothonHeader> {
  //
  bool _isOnline = true;
  //
  @override
  Widget build(BuildContext context) {
    //
    var topPadding = MediaQuery.of(context).padding.top;
    //
    return Container(
      width: widget.sWidth,
      // height: widget.sHeight * 0.065,
      color: KothonColors.barBodyColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: topPadding,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    KothonIcons().svg(),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'User Agent Name',
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: KothonColors.logoTextColor,
                          fontSize: 18),
                    ),
                    // Transform.scale(
                    //   scale: 1,
                    //   child: Switch(
                    //     value: _isOnline,
                    //     onChanged: (_) {
                    //       setState(() {
                    //         _isOnline = !_isOnline;
                    //         print(_isOnline);
                    //       });
                    //     },
                    //     activeColor: KothonColors.switchActiveColor,
                    //     inactiveTrackColor: Colors.grey,
                    //     activeTrackColor: KothonColors.barIconColor,
                    //     materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    //   ),
                    // ),
                  ],
                ),
              ),
              Row(
                children: [
                  // FlutterSwitch(
                  //   toggleSize: 15,
                  //   height: 22,
                  //   width: 50,
                  //   borderRadius: 30,
                  //   activeToggleColor: KothonColors.switchActiveColor,
                  //   activeColor: KothonColors.toggleBtnColor,
                  //   value: _isOnline,
                  //   onToggle: (_) {
                  //     setState(
                  //       () {
                  //         _isOnline = !_isOnline;
                  //         print(_isOnline);
                  //       },
                  //     );
                  //   },
                  // ),
                  SwitcherButton(
                    value: _isOnline,
                    onColor: KothonColors.switchActiveColor,
                    offColor: KothonColors.toggleBtnColor,
                    size: 50,
                    onChange: (value) {
                      _isOnline = !value;
                      print(value);
                      futureToast(
                        context: context,
                        message: value ? "Online" : "Offline",
                      );
                    },
                  ),
                  SizedBox(
                    width: 20,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
