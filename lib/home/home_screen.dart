import 'package:cakeapp/app/app_router.dart';
import 'package:cakeapp/shared/colors.dart';
import 'package:cakeapp/shared/fonts.dart';
import 'package:cakeapp/shared/images.dart';
import 'package:cakeapp/shared/widgets/custom_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../shared/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // text fields' controllers
  final TextEditingController _fNameController = TextEditingController();
  final TextEditingController _lNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _userTypeController = TextEditingController();
  final TextEditingController _nicController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');
  String action = "view";
  String userType = "all";
  Future<void> _createOrUpdate([DocumentSnapshot? documentSnapshot]) async {
    if (documentSnapshot != null) {
      _fNameController.text = documentSnapshot['firstName'];
      _lNameController.text = documentSnapshot['lastName'].toString();
      _emailController.text = documentSnapshot['email'].toString();
      _pwController.text = documentSnapshot['password'].toString();
      _phoneController.text = documentSnapshot['phone'].toString();
      _nicController.text = documentSnapshot['nic'].toString();
      _addressController.text = documentSnapshot['address'].toString();
      _userTypeController.text = documentSnapshot['userType'].toString();
    }

    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: EdgeInsets.only(
                  top: 20,
                  left: 20,
                  right: 20,
                  // prevent the soft keyboard from covering text fields
                  bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0, bottom: 5),
                    child: Text("First Name"),
                  ),
                  CustomTextField(
                      hintText: "First Name",
                      controller: _fNameController,
                      isReadOnly: action == "view" ? true : false),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0, bottom: 5),
                    child: Text("Last Name"),
                  ),
                  CustomTextField(
                      hintText: "Last Name",
                      controller: _lNameController,
                      isReadOnly: action == "view" ? true : false),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0, bottom: 5),
                    child: Text("Phone"),
                  ),
                  CustomTextField(
                      hintText: "Phone",
                      controller: _phoneController,
                      isReadOnly: action == "view" ? true : false),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0, bottom: 5),
                    child: Text("NIC"),
                  ),
                  CustomTextField(
                      hintText: "NIC",
                      controller: _nicController,
                      isReadOnly: action == "view" ? true : false),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0, bottom: 5),
                    child: Text("Address"),
                  ),
                  CustomTextField(
                      hintText: "Address",
                      controller: _addressController,
                      isReadOnly: action == "view" ? true : false),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0, bottom: 5),
                    child: Text("Email"),
                  ),
                  CustomTextField(
                      hintText: "Email",
                      controller: _emailController,
                      isReadOnly: action == "view" ? true : false),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 28.0, bottom: 5),
                    child:
                        action != 'view' ? Text("Password") : Text("User Type"),
                  ),
                  action != 'view'
                      ? CustomTextField(
                          isPassword: true,
                          hintText: "Password",
                          controller: _pwController,
                          isReadOnly: action != "view" ? true : false)
                      : CustomTextField(
                          controller: _userTypeController,
                          hintText: "$userType",
                          isReadOnly: action != "view" ? true : false),
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: ElevatedButton(
                      child: Text(action == 'view' ? 'Back' : 'Update'),
                      onPressed: () async {
                        FocusScope.of(context).requestFocus(FocusNode());

                        if (action == 'update') {
                          if (validateEmail(_emailController.text.trim())) {
                            if (validatePhoneNumber(
                                _phoneController.text.trim())) {
                              if (validateNIC(_nicController.text.trim())) {
                                // Update the user
                                await _userCollection
                                    .doc(documentSnapshot!.id)
                                    .update({
                                  "firstName": _fNameController.text.trim(),
                                  "lastName": _lNameController.text.trim(),
                                  "email": _emailController.text.trim(),
                                  "phone": _phoneController.text.trim(),
                                  "password": _pwController.text.trim(),
                                  "address": _addressController.text.trim(),
                                  "nic": _nicController.text.trim(),
                                });

                                // Clear the text fields
                                _fNameController.text = '';
                                _lNameController.text = '';
                                _emailController.text = '';
                                _pwController.text = '';
                                _phoneController.text = '';
                                _nicController.text = '';
                                _addressController.text = '';
                                // showDialog(
                                //   context: context,
                                //   builder: (BuildContext context) {
                                //     return  AlertDialog(
                                //       title: Text("Alert"),
                                //       content: const Text("Update Successfully"),
                                //       actions: [TextButton(
                                //         child: Text("Ok"),
                                //         onPressed: () {
                                //           Navigator.pop(context);
                                //         },
                                //       )],
                                //     );
                                //   },
                                // );
                                // Hide the bottom sheet

                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text('You have successfully update'),
                                  backgroundColor: Colors.green,
                                ));
                                Navigator.of(context).pop();
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Error"),
                                      content: Text("Invalid NIC"),
                                      actions: [
                                        TextButton(
                                          child: Text("Ok"),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        )
                                      ],
                                    );
                                  },
                                );
                              }
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Error"),
                                    content: Text("Invalid Phone"),
                                    actions: [
                                      TextButton(
                                        child: Text("Ok"),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      )
                                    ],
                                  );
                                },
                              );
                            }
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Error"),
                                  content: Text("Invalid Email"),
                                  actions: [
                                    TextButton(
                                      child: Text("Ok"),
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                    )
                                  ],
                                );
                              },
                            );
                          }
                        } else {
                          Navigator.pop(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          primary: AppColors.appMainButtonBgColor,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 100, vertical: 10),
                          textStyle: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  var snackbar = const SnackBar(
      backgroundColor: Colors.red,
      padding: EdgeInsets.all(15.0),
      behavior: SnackBarBehavior.floating,
      // margin: EdgeInsets.all(5.0),
      duration: Duration(seconds: 6),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      content: Padding(
        padding: EdgeInsets.all(18.0),
        child: Text(
          '',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ));

  // Deleteing a product by id
  Future<void> _deleteProduct(String itemId) async {
    showAlertDialog(context, itemId);
  }

  showAlertDialog(BuildContext context, String itemId) {
    // set up the button
    Widget okButton = TextButton(
      child: Text("OK"),
      onPressed: () async {
        await _userCollection.doc(itemId).delete();

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('You have successfully deleted a user')));

        Navigator.pop(context);
      },
    );
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Confirmation"),
      content: Text("Are you sure to delete this user?"),
      actions: [okButton, cancelButton],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

//metod
  void handleClick(String value) {
    switch (value) {
      case 'All':
        {
          setState(() {
            userType = 'all';
            print(userType);
          });
        }
        break;
      case 'Admins':
        {
          setState(() {
            userType = 'admin';
            print(userType);
          });
        }
        break;

      case 'Customers':
        {
          setState(() {
            userType = 'customer';
          });
        }
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        actions: [
          PopupMenuButton<String>(
            onSelected: handleClick,
            itemBuilder: (BuildContext context) {
              return {'All', 'Customers', 'Admins'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
        foregroundColor: AppColors.appMainButtonBgColor,
        title: Text(
          "Users",
          style: AppFonts.appBarTitleStyle,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Container(),
              decoration: BoxDecoration(
                image: DecorationImage(image: logoImage, fit: BoxFit.contain),
                color: AppColors.appMainButtonBgColor,
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
              tileColor: AppColors.appMainButtonBgColor.withOpacity(0.5),
            ),
            Divider(),
            ListTile(
              title: Text('User List'),
              onTap: () {
                Navigator.pushNamed(context, AppRouter.homeRoute);
              },
              tileColor: AppColors.appMainButtonBgColor.withOpacity(0.5),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.pushNamed(context, AppRouter.signinScreenRoute);
              },
              tileColor: AppColors.appMainButtonBgColor.withOpacity(0.5),
            ),
          ],
        ),
      ),
      // Using StreamBuilder to display all products from Firestore in real-time
      body: StreamBuilder(
        stream: userType == "customer"
            ? _userCollection
                .where('userType', isEqualTo: 'customer')
                .snapshots()
            : userType == 'admin'
                ? _userCollection
                    .where('userType', isEqualTo: 'admin')
                    .snapshots()
                : _userCollection.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            return ListView.builder(
              itemCount: streamSnapshot.data!.docs.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot =
                    streamSnapshot.data!.docs[index];
                return InkWell(
                  splashColor: Colors.blue,
                  onTap: () async {},
                  child: Card(
                    elevation: 7,
                    color: Colors.white,
                    margin: const EdgeInsets.all(10),
                    shape: Border.all(width: 1.0, color: Colors.amber),
                    child: ListTile(
                      leading: Icon(Icons.person_rounded,
                          color: documentSnapshot['userType'] == "admin"
                              ? Colors.amber
                              : Colors.grey),
                      tileColor: Colors.pinkAccent.withOpacity(0.2),
                      title: Text(
                        documentSnapshot['firstName'] +
                            ' ' +
                            documentSnapshot['lastName'],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            // const Icon(
                            //   Icons.email,
                            //   color: Colors.pinkAccent,
                            //   size: 20,
                            // ),

                            Text(documentSnapshot['email'].toString()),
                          ],
                        ),
                      ),
                      trailing: SizedBox(
                        width: 150,
                        child: Row(
                          children: [
                            IconButton(
                                icon: const Icon(Icons.remove_red_eye_outlined),
                                onPressed: () {
                                  setState(() {
                                    action = "view";
                                  });
                                  _createOrUpdate(documentSnapshot);
                                }),
                            // Press this button to edit a single product
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                setState(() {
                                  action = "update";
                                  _createOrUpdate(documentSnapshot);
                                });
                              },
                            ),

                            // This icon button is used to delete a single product
                            IconButton(
                                icon: const Icon(Icons.delete),
                                color: Colors.red.withOpacity(0.7),
                                onPressed: () =>
                                    _deleteProduct(documentSnapshot.id)),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      // Add new product
    );
  }

  //validations
  bool validateNIC(String nic) {
    if (nic == null || nic.length != 10) {
      return false;
      print("Invalid NIC number");
    } else {
      bool isValid = true;
      for (int i = 0; i < 9; i++) {
        if (!isNumeric(nic[i])) {
          isValid = false;
          break;
        }
      }
      if (!isNumeric(nic[9]) && nic[9].toUpperCase() != 'V') {
        isValid = false;
      }
      if (isValid) {
        print("Valid NIC number");
        return true;
      } else {
        print("Invalid NIC number");
        return false;
      }
    }
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  bool validatePhoneNumber(String phoneNumber) {
    RegExp regExp = RegExp(r'(^(?:[+0]9)?[0-9]{10,12}$)');
    if (!regExp.hasMatch(phoneNumber)) {
      print("Invalid phone number");
      return false;
    } else {
      print("Valid phone number");
      return true;
    }
  }

  bool validateEmail(String email) {
    RegExp regExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!regExp.hasMatch(email)) {
      print("Invalid email address");
      return false;
    } else {
      print("Valid email address");
      return true;
    }
  }
}
