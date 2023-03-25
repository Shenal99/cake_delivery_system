import 'package:cakeapp/shared/widgets/custom_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../shared/images.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import '../app/app_router.dart';
import '../shared/colors.dart';
import '../shared/fonts.dart';
import '../shared/widgets/app_main_button.dart';
import '../shared/widgets/custom_app_bar.dart';

class SignInScreen extends StatefulWidget {
  static const String routeName = '/signin';
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  Country selectedCountry = Country(
      phoneCode: "94",
      countryCode: "LK",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "Sri Lanka",
      example: "Sri Lanka",
      displayName: "Sri Lanka",
      displayNameNoCountryCode: "LK",
      e164Key: "");

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  var _userData;
  var _isLoading = false;

  //login function
  void _fetchUserData() async {

    if(!validateEmail(_emailController.text.trim())){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Invalid Email'),
        backgroundColor: Colors.red,
      ));
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // Replace `collectionName` with the name of your collection in Firebase

    try {
      print("ddwdwdw");
      // Replace `collectionName` with the name of your collection in Firebase
      final QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: _emailController.text.trim())
          .get();
      if (snapshot.docs.length == 1) {
        // Retrieve the docRef of the first document in the snapshot (assuming there is only one document)
        final DocumentReference docRef = snapshot.docs[0].reference;

        print('Document ID: ${docRef.id}');

        // Retrieve the value of the 'name' field in the document
        final String name = snapshot.docs[0]['email'] ;
        final String password = snapshot.docs[0]['password'] ;

        print('Document ID: ${docRef.id}');
        print('Name: $name');
        print('Name: $password');

        if(_passwordController.text.trim() == password){
          Navigator.pushNamed(context, AppRouter.homeRoute);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Inavlid password'),
            backgroundColor: Colors.red,
          ));
        }
      } else {
        print('');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('User not found or multiple documents found'),
          backgroundColor: Colors.red,
        ));
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error inserting data: $e'),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Column(
          children: [
            const SizedBox(
              height: 4,
            ),
            const Text(
              "Login",
              style: AppFonts.headingStyle1,
            ),
            const Image(
              width: 200,
              image: logoImage,
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
                controller: _emailController,

                icon: const Icon(Icons.email_outlined),
                hintText: "Email"),
            const SizedBox(
              height: 18,
            ),
            const SizedBox(
              height: 18,
            ),
            CustomTextField(
                controller: _passwordController,

                 isPassword: true,
                icon: const Icon(Icons.lock),
                hintText: "Password"),
            const SizedBox(
              height: 18,
            ),
            const SizedBox(
              height: 18,
            ),
            AppMainButton(
                label: _isLoading
                    ? CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text('Login'),
                onPressed: () {
                  _fetchUserData();
                }),
            Padding(
              padding: const EdgeInsets.all(28.0),
              child: Row(
                children: [
                  const Text(
                    "Does Not Have an Account? ",
                    style: AppFonts.bodyStyle2,
                  ),
                  GestureDetector(
                      onTap: () => Navigator.pushNamed(
                          context, AppRouter.signupScreenRoute),
                      child: const Text(
                        "Sign Up",
                        style: AppFonts.bodyStyleBold,
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
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
