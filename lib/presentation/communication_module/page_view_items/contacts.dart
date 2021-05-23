import 'dart:ui';

import 'package:contacts_service/contacts_service.dart';
import 'package:date_time_format/date_time_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kothon_app/constants/kothon_colors.dart';
import 'package:kothon_app/data/models/history_model.dart';
import 'package:kothon_app/data/models/speed_dial_model.dart';
import 'package:kothon_app/logic/cubit/contact_cubit.dart';
import 'package:kothon_app/logic/cubit/history_cubit.dart';
import 'package:kothon_app/logic/cubit/speed_dial_cubit.dart';
import 'package:kothon_app/presentation/common_widgets/show_toast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sip_ua/sip_ua.dart';

class Contacts extends StatefulWidget {
  final SIPUAHelper _helper;

  const Contacts(this._helper, {Key key}) : super(key: key);

  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> implements SipUaHelperListener {
  Iterable<Contact> _contacts;
  var temp;

  Future<void> getContacts() async {
    // Make sure we already have permissions for contacts when we get to
    // this page. Then we retrieve it
    final Iterable<Contact> contacts = await ContactsService.getContacts();
    // setState(() {
    //   _contacts = contacts;
    // });
    context.read<ContactCubit>().contactLoad(contacts);
  }

  String _dest;
  String _serverIP;
  SIPUAHelper get helper => widget._helper;
  TextEditingController _textController;
  SharedPreferences _preferences;

  String receivedMsg;

  void _loadSettings() async {
    _preferences = await SharedPreferences.getInstance();
    _serverIP = _preferences.getString('serverIP') ?? 'N/A';
    _dest = _preferences.getString('dest') ?? 'sip:hello_jssip@tryit.jssip.net';
    _textController = TextEditingController(text: _dest);
    _textController.text = _dest;

    this.setState(() {});
  }

  Widget _handleCall(BuildContext context, [bool voiceonly = false]) {
    // var dest = _textController.text;
    var dest = 'sip:$dialNum@$_serverIP';

    if (dest == null || dest.isEmpty) {
      showDialog<Null>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Target is empty.'),
            content: Text('Please enter a SIP URI or username!'),
            actions: <Widget>[
              // ignore: deprecated_member_use
              FlatButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return null;
    }
    helper.call(dest, voiceonly);
    _preferences.setString('dest', dest);
    return null;
  }

  //
  String dialNum = '';
  //

  void _bindEventListeners() {
    helper.addSipUaHelperListener(this);
  }

  @override
  void initState() {
    super.initState();
    _bindEventListeners();
    _loadSettings();
    getContacts();
  }

  @override
  void deactivate() {
    helper.removeSipUaHelperListener(this);
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactCubit, ContactState>(listener: (context, state) {
      //
    }, builder: (context, state) {
      if (state is ContactInitial) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is ContactLoaded) {
        _contacts = state.contactService;
      }

      return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
            color: Colors.black,
          ),
          physics: BouncingScrollPhysics(),
          shrinkWrap: true,
          itemCount: _contacts?.length ?? 0,
          itemBuilder: (context, index) {
            Contact contact = _contacts?.elementAt(index);
            return ListTile(
              leading: (contact.avatar != null && contact.avatar.isNotEmpty)
                  ? CircleAvatar(
                      backgroundImage: MemoryImage(contact.avatar),
                    )
                  : CircleAvatar(
                      child: Text(contact.initials()),
                      backgroundColor: Theme.of(context).accentColor,
                    ),
              title: Text(contact.displayName ?? 'No Name'),
              // subtitle: Text(contact.phones.elementAt(0).value),
              // subtitle: Text((contact.phones.length > 0)
              //     ? contact.phones.first.value
              //     : "No contact"),
              subtitle: Text(contact.phones
                  .firstWhere((element) => element != null)
                  .value),

              onTap: () {
                showTheBottomSheet(
                  context: context,
                  contactName: contact.displayName,
                  contactNumber: contact.phones
                      .firstWhere((element) => element != null)
                      .value,
                );

                /// ALERT DIALOG FOR CONTACTS ///
                // return showDialog(
                //   // barrierDismissible: false,
                //   barrierColor: Colors.black.withOpacity(0.7),
                //   context: context,
                //   builder: (context) {
                //     return BackdropFilter(
                //       filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                //       child: Dialog(
                //         elevation: 10,
                //         backgroundColor:
                //             KothonColors.navBarColor.withOpacity(0),
                //         shape: RoundedRectangleBorder(
                //             borderRadius: BorderRadius.circular(25.0)),
                //         insetAnimationCurve: Curves.easeInOutCirc,
                //         insetAnimationDuration: Duration(seconds: 3),
                //         child: Container(
                //           padding: EdgeInsets.all(20),
                //           decoration: BoxDecoration(
                //             color: KothonColors.dialPadHeaderColor,
                //             borderRadius: BorderRadius.circular(3),
                //           ),
                //           child: Column(
                //             mainAxisSize: MainAxisSize.min,
                //             children: [
                //               Text(
                //                 contact.displayName ?? 'No Name',
                //                 style: TextStyle(
                //                   fontWeight: FontWeight.bold,
                //                   fontSize: 25,
                //                   color: KothonColors.offWhite,
                //                 ),
                //               ),
                //               SizedBox(
                //                 height: 10,
                //               ),
                //               Text(
                //                 contact.phones
                //                     .firstWhere((element) => element != null)
                //                     .value,
                //                 style: TextStyle(
                //                   fontSize: 20,
                //                   color: Colors.white60,
                //                 ),
                //               ),
                //               SizedBox(
                //                 height: 20,
                //               ),
                //               Row(
                //                 mainAxisSize: MainAxisSize.min,
                //                 mainAxisAlignment:
                //                     MainAxisAlignment.spaceEvenly,
                //                 children: [
                //                   FloatingActionButton(
                //                     backgroundColor: KothonColors.greenBtn,
                //                     elevation: 0,
                //                     child: FaIcon(FontAwesomeIcons.phoneAlt),
                //                     onPressed: () {
                //                       Navigator.pop(context);
                //                     },
                //                   ),
                //                   SizedBox(
                //                     width: 20,
                //                   ),
                //                   FloatingActionButton(
                //                     elevation: 0,
                //                     backgroundColor: KothonColors.greenBtn,
                //                     child: FaIcon(FontAwesomeIcons.video),
                //                     onPressed: () {
                //                       Navigator.pop(context);
                //                     },
                //                   ),
                //                   SizedBox(
                //                     width: 20,
                //                   ),
                //                   FloatingActionButton(
                //                     elevation: 0,
                //                     backgroundColor: KothonColors.greenBtn,
                //                     child:
                //                         FaIcon(FontAwesomeIcons.solidComments),
                //                     onPressed: () {
                //                       context
                //                           .read<SpeedDialCubit>()
                //                           .addSpeedDial(SpeedDialModel(
                //                             name: contact.displayName,
                //                             contact: contact.phones
                //                                 .firstWhere((element) =>
                //                                     element != null)
                //                                 .value,
                //                           ));
                //                       Navigator.pop(context);
                //                     },
                //                   ),
                //                   SizedBox(
                //                     width: 20,
                //                   ),
                //                   FloatingActionButton(
                //                     elevation: 0,
                //                     backgroundColor: KothonColors.greenBtn,
                //                     child:
                //                         FaIcon(FontAwesomeIcons.solidComments),
                //                     onPressed: () {
                //                       context
                //                           .read<SpeedDialCubit>()
                //                           .addSpeedDial(SpeedDialModel(
                //                             name: contact.displayName,
                //                             contact: contact.phones
                //                                 .firstWhere((element) =>
                //                                     element != null)
                //                                 .value,
                //                           ));
                //                       Navigator.pop(context);
                //                     },
                //                   ),
                //                 ],
                //               ),
                //             ],
                //           ),
                //         ),
                //       ),
                //     );
                //   },
                // );
              },
              // contentPadding: EdgeInsets.all(10),
            );
          },
        ),
      );
    });
  }

  showTheBottomSheet({
    BuildContext context,
    String contactName,
    String contactNumber,
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
                          setState(() {
                            dialNum = contactNumber;
                          });

                          context.read<HistoryCubit>().addHistory(HistoryModel(
                              contactName,
                              dialNum,
                              DateTimeFormat.format(DateTime.now(),
                                  format: 'M j, Y, h:i a')));

                          Navigator.pop(context);
                          return _handleCall(context, true);
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
                          setState(() {
                            dialNum = contactNumber;
                          });

                          context.read<HistoryCubit>().addHistory(HistoryModel(
                              contactName,
                              dialNum,
                              DateTimeFormat.format(DateTime.now(),
                                  format: 'M j, Y, h:i a')));

                          Navigator.pop(context);
                          return _handleCall(context);
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
                        backgroundColor: KothonColors.greenBtn,
                        elevation: 0,
                        child: FaIcon(FontAwesomeIcons.plus),
                        onPressed: () {
                          context
                              .read<SpeedDialCubit>()
                              .addSpeedDial(SpeedDialModel(
                                name: contactName,
                                contact: contactNumber,
                              ));
                          Navigator.pop(context);
                          futureToast(
                              context: context, message: "Added to speed dial");
                        },
                      ),
                      Text('Speed Dial'),
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

  @override
  void registrationStateChanged(RegistrationState state) {
    this.setState(() {});
  }

  @override
  void transportStateChanged(TransportState state) {}

  @override
  void callStateChanged(Call call, CallState callState) {
    if (callState.state == CallStateEnum.CALL_INITIATION) {
      Navigator.pushNamed(context, '/callscreen', arguments: call);
    }
  }

  @override
  void onNewMessage(SIPMessageRequest msg) {
    //Save the incoming message to DB
    String msgBody = msg.request.body as String;
    setState(() {
      receivedMsg = msgBody;
    });
  }
}
