import 'dart:ui';

import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kothon_app/constants/kothon_colors.dart';
import 'package:kothon_app/logic/cubit/contact_cubit.dart';

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
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

  @override
  void initState() {
    super.initState();
    getContacts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactCubit, ContactState>(listener: (context, state) {
      //
    }, builder: (context, state) {
      if (state is ContactInitial) {
        return CircularProgressIndicator();
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
                /// ALERT DIALOG FOR CONTACTS ///
                return showDialog(
                  // barrierDismissible: false,
                  barrierColor: Colors.black.withOpacity(0.7),
                  context: context,
                  builder: (context) {
                    return BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                      child: Dialog(
                        elevation: 10,
                        backgroundColor:
                            KothonColors.navBarColor.withOpacity(0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0)),
                        insetAnimationCurve: Curves.easeInOutCirc,
                        insetAnimationDuration: Duration(seconds: 3),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: KothonColors.dialPadHeaderColor,
                            borderRadius: BorderRadius.circular(3),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                contact.displayName ?? 'No Name',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: KothonColors.offWhite,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                contact.phones
                                    .firstWhere((element) => element != null)
                                    .value,
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white60,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  FloatingActionButton(
                                    backgroundColor: KothonColors.greenBtn,
                                    elevation: 0,
                                    child: FaIcon(FontAwesomeIcons.phoneAlt),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  FloatingActionButton(
                                    elevation: 0,
                                    backgroundColor: KothonColors.greenBtn,
                                    child: FaIcon(FontAwesomeIcons.video),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  FloatingActionButton(
                                    elevation: 0,
                                    backgroundColor: KothonColors.greenBtn,
                                    child:
                                        FaIcon(FontAwesomeIcons.solidComments),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
              // contentPadding: EdgeInsets.all(10),
            );
          },
        ),
      );
    });
  }
}
