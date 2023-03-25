import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Icon? icon;
  final bool? isPassword;
  final bool? isReadOnly;

  const CustomTextField({Key? key, required this.hintText, required this.controller,  this.icon, this.isPassword, this.isReadOnly}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, ),
      child: TextFormField(
        readOnly: isReadOnly  ?? false  ,
        obscureText: isPassword ?? false,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle:
              const TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.grey)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.grey)),
              prefixIcon: icon
          ),
        controller: controller,

      ),
    );
  }
}