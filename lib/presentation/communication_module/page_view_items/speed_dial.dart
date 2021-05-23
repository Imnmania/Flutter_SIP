import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kothon_app/constants/kothon_colors.dart';
import 'package:kothon_app/data/models/speed_dial_model.dart';
import 'package:kothon_app/logic/cubit/speed_dial_cubit.dart';
import 'package:kothon_app/presentation/common_widgets/show_toast.dart';
import 'package:kothon_app/presentation/communication_module/widgets/speed_dial_popup.dart';

class SpeedDial extends StatefulWidget {
  @override
  _SpeedDialState createState() => _SpeedDialState();
}

class _SpeedDialState extends State<SpeedDial> {
  List<SpeedDialModel> speedDialList = [];

  final _nameController = TextEditingController();
  final _contactController = TextEditingController();
  // SpeedDialModel speedDialModel = SpeedDialModel();

  // void addToList() {
  //   speedDialList.add(SpeedDialModel(name: "Niloy", contact: '1234'));
  //   speedDialList.add(SpeedDialModel(name: "Biswas", contact: '1234'));
  //   speedDialList.add(SpeedDialModel(name: "Monkey", contact: '1234'));
  //   speedDialList.add(SpeedDialModel(name: "D Nil", contact: '1234'));
  // }

  @override
  void initState() {
    super.initState();
    // addToList();
  }

  @override
  Widget build(BuildContext context) {
    //
    var sWidth = MediaQuery.of(context).size.width;
    var sHeight = MediaQuery.of(context).size.height;

    speedDialList = context.watch<SpeedDialCubit>().state.speedDialList;
    //
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        fit: StackFit.loose,
        children: [
          Positioned(
            top: 0,
            child: Container(
              // padding: EdgeInsets.all(10),
              width: sWidth,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: KothonColors.homeTopSectionBackground,
                      border: Border.all(
                        color: KothonColors.barIconColor,
                        width: 1,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Opacity(
                        //   opacity: 0,
                        //   child: IconButton(
                        //     icon: FaIcon(FontAwesomeIcons.plus),
                        //     onPressed: null,
                        //   ),
                        // ),
                        Container(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            'Speed Dials',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                        IconButton(
                            icon: FaIcon(
                              FontAwesomeIcons.plus,
                              size: 18,
                              color: KothonColors.barIconColor,
                            ),
                            onPressed: () async {
                              await speedDialAddDialog(
                                context: context,
                                nameController: _nameController,
                                contactController: _contactController,
                              );
                              print(_nameController.text);
                              print(_contactController.text);
                            }),
                      ],
                    ),
                  ),
                  // Divider(
                  //   height: 5,
                  //   color: Colors.black,
                  // ),
                  Container(
                    height: sHeight * 0.75,
                    padding: EdgeInsets.only(
                      bottom: 10,
                    ),
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView.separated(
                        // separatorBuilder: (context, index) {
                        // return Divider(
                        // height: 5,
                        // );
                        // },
                        separatorBuilder: (context, index) => Divider(
                          color: Colors.black,
                        ),
                        shrinkWrap: true,
                        itemCount: speedDialList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                              child: Text(speedDialList[index].name[0]),
                              backgroundColor: Theme.of(context).accentColor,
                            ),
                            title: Text(speedDialList[index].name),
                            subtitle: Text(speedDialList[index].contact),
                            onTap: () {
                              // context
                              //     .read<SpeedDialCubit>()
                              //     .delSpeedDial(index);
                              showTheBottomSheet(
                                context: context,
                                contactName: speedDialList[index].name,
                                contactNumber: speedDialList[index].contact,
                                index: index,
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  showTheBottomSheet({
    BuildContext context,
    String contactName,
    String contactNumber,
    int index,
  }) {
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      barrierColor: Colors.black.withOpacity(0.5),
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: KothonColors.barBodyColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: ListView(
            shrinkWrap: true,
            children: [
              SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Text(
                    contactName,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(contactNumber),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      FloatingActionButton(
                        backgroundColor: KothonColors.greenBtn,
                        elevation: 0,
                        child: FaIcon(FontAwesomeIcons.phoneAlt),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text('Audio Call'),
                    ],
                  ),
                  Column(
                    children: [
                      FloatingActionButton(
                        backgroundColor: KothonColors.greenBtn,
                        elevation: 0,
                        child: FaIcon(FontAwesomeIcons.video),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text('Video Call'),
                    ],
                  ),
                  Column(
                    children: [
                      FloatingActionButton(
                        backgroundColor: KothonColors.greenBtn,
                        elevation: 0,
                        child: FaIcon(FontAwesomeIcons.solidComments),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text('Message'),
                    ],
                  ),
                  Column(
                    children: [
                      FloatingActionButton(
                        backgroundColor: Colors.redAccent,
                        elevation: 0,
                        child: FaIcon(FontAwesomeIcons.trash),
                        onPressed: () {
                          context.read<SpeedDialCubit>().delSpeedDial(index);
                          Navigator.pop(context);
                          futureToast(
                              context: context,
                              message: "Removed from speed dial");
                        },
                      ),
                      Text('Remove'),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        );
      },
    );
  }
}
