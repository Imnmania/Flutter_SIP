import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/material.dart';
import 'package:kothon_app/constants/kothon_colors.dart';
import 'package:kothon_app/presentation/common_widgets/kothon_header.dart';
import 'package:kothon_app/presentation/home/widgets/grid_utils.dart';

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
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: sHeight * 0.5,
                padding: EdgeInsets.only(top: sHeight * 0.11),
                color: KothonColors.homeTopSectionBackground,
                // child: GridView.count(
                //   primary: false,
                //   crossAxisCount: 3,
                //   padding: const EdgeInsets.all(20),
                //   children: List.generate(6, (index) {
                //     return Center(
                //       child: Container(
                //         height: sHeight * 0.13,
                //         width: sHeight * 0.13,
                //         decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(10),
                //             color: KothonColors.barBodyColor),
                //         child: Text('Item $index'),
                //       ),
                //     );
                //   }),
                // ),
                child: LiveGrid(
                  padding: EdgeInsets.all(16),
                  showItemInterval: Duration(milliseconds: 60),
                  showItemDuration: Duration(milliseconds: 150),
                  visibleFraction: 0.001,
                  itemCount: 6,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder: animationItemBuilder((index) => HorizontalItem(
                        title: index.toString(),
                        onClick: () {
                          print(index);
                          switch (index) {
                            case 0:
                              {
                                print("aye 0");
                              }
                              break;
                            case 1:
                              {
                                print("aye 1");
                              }
                              break;
                            case 2:
                              {
                                print("aye 2");
                              }
                              break;
                            case 3:
                              {
                                print("aye 3");
                              }
                              break;
                            case 4:
                              {
                                print("aye 4");
                              }
                              break;
                            case 5:
                              {
                                print("aye 5");
                              }
                              break;
                            default:
                              break;
                          }
                        },
                      )),
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            child: KothonHeader(sHeight: sHeight, sWidth: sWidth),
          ),
        ],
      ),
    );
  }
}
