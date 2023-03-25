import 'package:flutter/material.dart';
import '../fonts.dart';
import '../colors.dart';

class AppMainButton extends StatelessWidget {
   late Widget label;
  late VoidCallback onPressed;
  late Color color;

  AppMainButton({
    Key? key,
     required this.label ,
    required this.onPressed,
    this.color = AppColors.appMainButtonBgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        textStyle:AppFonts.mainButtonText,
        primary: color,
        onPrimary: Colors.white,
        shadowColor: Colors.greenAccent,
        elevation: 3,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        minimumSize: Size(width * 0.87, height * 0.06), //////// HERE
      ),
      child:  label,
    );
  }
}
