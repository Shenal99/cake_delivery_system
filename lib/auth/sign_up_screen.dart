import 'package:cakeapp/shared/widgets/custom_text_field.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import '../app/app_router.dart';
import '../shared/fonts.dart';
import '../shared/widgets/app_main_button.dart';
import '../shared/widgets/custom_app_bar.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/signup';
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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

  final TextEditingController _firstNameCtrl = TextEditingController();
  final TextEditingController _lastNameCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _phoneCtrl = TextEditingController();
  final TextEditingController _nicCtrl = TextEditingController();
  final TextEditingController _addressCtrl = TextEditingController();
  final TextEditingController _passwordCtrl = TextEditingController();
  final TextEditingController _confirmPasswordCtrl = TextEditingController();

  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();


  //to registration user
  Future<void> _insertData() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      try {
        print("hello");
        await FirebaseFirestore.instance.collection('users').add({
          'firstName': _firstNameCtrl.text.trim(),
          'lastName': _lastNameCtrl.text.trim(),
          'email': _emailCtrl.text.trim(),
          'phone': _phoneCtrl.text.trim(),
          'nic': _nicCtrl.text.trim(),
          'address': _addressCtrl.text.trim(),
          'password': _passwordCtrl.text.trim(),
          'userType' : "customer",
        });
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Successfully Registered'),
          backgroundColor: Colors.green,
        ));
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error inserting data: $error'),
        ));
      }
      setState(() {
        _isLoading = false;
      });


      // Hide the bottom sheet
      Navigator.pushNamed(context, AppRouter.signinScreenRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 4,
                  ),
                  const Text(
                    "Sign Up",
                    style: AppFonts.headingStyle1,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                    child: Text(
                      "Happy to see you on board! \nHeres how to get started.",
                      textAlign: TextAlign.center,
                      style: AppFonts.bodyStyle2,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                      controller: _firstNameCtrl,

                      icon: Icon(Icons.person_outline), hintText: "First name"),
                  const SizedBox(
                    height: 18,
                  ),
                  CustomTextField(
                      controller: _lastNameCtrl,

                      icon: Icon(Icons.person_outline), hintText: "Last name"),
                  const SizedBox(
                    height: 18,
                  ),
                  CustomTextField(
                      controller: _emailCtrl,

                      icon: const Icon(Icons.email_outlined), hintText: "Email"),
                  const SizedBox(
                    height: 18,
                  ),
                  CustomTextField(
                      controller: _nicCtrl,

                      icon: const Icon(Icons.account_box_sharp), hintText: "NIC"),
                  const SizedBox(
                    height: 18,
                  ),
                  CustomTextField(
                      controller: _addressCtrl,

                      icon: const Icon(Icons.location_on_rounded), hintText: "Address"),

                  const SizedBox(
                    height: 18,
                  ),
                  SizedBox(
                    height: 60,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextField(
                        controller: _phoneCtrl,
                          keyboardType: TextInputType.phone,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            hintText: "Phone Number",
                            hintStyle: const TextStyle(
                                fontWeight: FontWeight.w400, fontSize: 16),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:
                                    const BorderSide(color: Colors.grey)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:
                                    const BorderSide(color: Colors.grey)),
                            prefixIcon: Container(
                              padding: const EdgeInsets.all(8),
                              child: InkWell(
                                onTap: () {
                                  showCountryPicker(
                                      context: context,
                                      countryListTheme: CountryListThemeData(
                                          bottomSheetHeight: 500,
                                          borderRadius:
                                              BorderRadius.circular(13)),
                                      onSelect: (value) {
                                        setState(() {
                                          selectedCountry = value;
                                        });
                                      });
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, bottom: 5),
                                  child: Text(
                                    "  ${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  CustomTextField(
                    controller: _passwordCtrl,

                    isPassword: true,
                    icon: Icon(Icons.lock),
                    hintText: "Password",
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  CustomTextField(
                      controller: _confirmPasswordCtrl,

                      isPassword: true,
                      icon: Icon(Icons.lock),
                      hintText: "Confirm Password"),
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
                          : Text("Sign up"),
                      onPressed: () async {
                        print("hi");
                        FocusScope.of(context).requestFocus(FocusNode());

                        if (_passwordCtrl != null &&
                            _emailCtrl != null &&
                            _firstNameCtrl != null &&
                            _lastNameCtrl != null &&
                            _phoneCtrl != null &&
                            _passwordCtrl != null &&
                            _nicCtrl != null &&
                            _confirmPasswordCtrl != null) {


                          if (_passwordCtrl.text == _confirmPasswordCtrl.text) {


                            if(validateNIC(_nicCtrl.text.trim())){
                              print(_phoneCtrl.text);

                              if(validatePhoneNumber(_phoneCtrl.text.trim())){

                                if(validateEmail(_emailCtrl.text.trim())){
                                  _insertData();
                                }else{
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                    content: Text('Invalid Email'),
                                  ));
                                }


                              }else{

                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text('Invalid Phone Number'),
                                  backgroundColor: Colors.red,
                                ));
                              }

                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                content: Text('Invalid NIC'),
                                backgroundColor: Colors.red,
                              ));
                            }

                          } else{
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text('Password does not match'),
                              backgroundColor: Colors.red,
                            ));
                          }
                        }

                      }),
                  Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Row(
                      children: [
                        const Text(
                          "Does Already Have an Account? ",
                          style: AppFonts.bodyStyle2,
                        ),
                        GestureDetector(
                            onTap: () => Navigator.pushNamed(
                                context, AppRouter.signinScreenRoute),
                            child: Text(
                              "Sign in",
                              style: AppFonts.bodyStyleBold,
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
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
