import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kothon_app/constants/kothon_colors.dart';
import 'package:kothon_app/data/models/speed_dial_model.dart';
import 'package:kothon_app/logic/cubit/speed_dial_cubit.dart';
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
              padding: EdgeInsets.all(10),
              width: sWidth,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Opacity(
                      //   opacity: 0,
                      //   child: IconButton(
                      //     icon: FaIcon(FontAwesomeIcons.plus),
                      //     onPressed: null,
                      //   ),
                      // ),
                      Text(
                        'Speed Dials',
                        style: TextStyle(
                          fontSize: 18,
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

                            context
                                .read<SpeedDialCubit>()
                                .addSpeedDial(SpeedDialModel(
                                  name: _nameController.text,
                                  contact: _contactController.text,
                                ));
                          }),
                    ],
                  ),
                  Divider(
                    height: 5,
                    color: Colors.black,
                  ),
                  Container(
                    height: sHeight * 0.75,
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return Divider(
                            height: 5,
                          );
                        },
                        shrinkWrap: true,
                        itemCount: speedDialList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(speedDialList[index].name),
                            subtitle: Text(speedDialList[index].contact),
                            onTap: () {
                              context
                                  .read<SpeedDialCubit>()
                                  .delSpeedDial(index);
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
}
