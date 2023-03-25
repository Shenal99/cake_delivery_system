import 'package:flutter/material.dart';
import 'colors.dart';

class AppFonts {
  static const TextStyle headingStyle1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle headingStyle2 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle headingStyle3 = TextStyle(
    fontSize: 28,
    fontFamily: 'Inter',
    color: AppColors.headingFontColor,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle headingStyle3White = TextStyle(
    fontSize: 28,
    fontFamily: 'Inter',
    color: AppColors.white,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle headingStyle4 = TextStyle(
    fontSize: 25,
    fontFamily: 'Inter',
    color: AppColors.headingFontColor,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle headingStyle4White = TextStyle(
    fontSize: 25,
    fontFamily: 'Inter',
    color: AppColors.white,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle bodyStyle = TextStyle(
    fontSize: 16,
    fontFamily: 'Inter',
    color: AppColors.fontMediumColor,
    fontWeight: FontWeight.w300,
  );

  static const TextStyle bodyStyle2 = TextStyle(
    fontSize: 15,
    fontFamily: 'Inter',
    color: AppColors.gray3,
    fontWeight: FontWeight.w300,
  );

  static const TextStyle bodyStyleBold = TextStyle(
    fontSize: 16,
    fontFamily: 'Inter',
    color: AppColors.fontMediumColor,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle mainButtonText =  TextStyle(
      fontFamily: 'Inter', fontSize: 20, fontWeight: FontWeight.w600);


  static const TextStyle appBarTitleStyle =  TextStyle(

    color : Colors.black,

      fontFamily: 'Inter', fontSize: 18, fontWeight: FontWeight.w600);

  //home page eke list tile font eka style
  static const TextStyle listTileTileStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );



  static const TextStyle pageHeadingStyle = TextStyle(
    fontSize: 19,
    //fontFamily: 'Inter',
    color: Color.fromARGB(255, 0, 0, 0),
    fontWeight: FontWeight.w500,
  );

  static const TextStyle pageSubHeadingStyle = TextStyle(
    fontSize: 19,
    //fontFamily: 'Inter',
    height: 1.0,
    color: Color.fromARGB(255, 0, 0, 0),
    fontWeight: FontWeight.w600,
  );

  static const TextStyle savedItemsBodyTextStyle = TextStyle(
      fontSize: 14,
      color: Color.fromARGB(160, 29, 38, 33),
      fontWeight: FontWeight.w400);

  static const TextStyle customTextStyle3 = TextStyle(
    fontSize: 17,
    fontFamily: 'Inter',
    color: Color.fromARGB(255, 84, 84, 84),
    fontWeight: FontWeight.w700,
  );

  static const TextStyle ratingsTextStyle = TextStyle(
    fontSize: 11,
    fontFamily: 'Inter',
    color: Color.fromARGB(255, 255, 196, 3),
    fontWeight: FontWeight.w600,
  );


}
