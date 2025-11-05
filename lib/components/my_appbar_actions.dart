import 'package:flutter/material.dart';

class MyAppBarActions extends StatelessWidget implements PreferredSizeWidget {
  final Widget iconImage;
  final Widget title;

  const MyAppBarActions({
    super.key,
    required this.iconImage,
    required this.title,

  });
  

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      title: Row(
        children: [
          // icon image
          iconImage,

          // space in between
          const SizedBox(width: 5,),

          // widget for the title.
          title,

          const SizedBox(width: 10,),
          ],
          ),
    );
  }
  
  
}