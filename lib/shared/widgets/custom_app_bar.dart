import 'package:flutter/material.dart';
import '../colors.dart';
import '../fonts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
   late String? title;

   late Widget? leading;

  late List<Widget>? actions;
  late VoidCallback? onPressedAction;

   CustomAppBar({
    Key? key,
     this.title,
     this.leading,
     this.actions,
     this.onPressedAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading:leading ??  GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Container(
          margin: EdgeInsets.all(16),
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.pinkAccent,
              width: 1,
            ),

          ),
          child:   const Icon(
               Icons.arrow_back_ios_new,
              size: 14,
              color: Colors.pinkAccent,
          )  ,
        ),
      ),

      title:  Text(
        title ?? ' ',
        style:AppFonts.appBarTitleStyle
      ),
      actions: actions,
      centerTitle: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
