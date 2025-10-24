import 'package:flutter/material.dart';

class MyAppBarActions extends StatelessWidget {
  const MyAppBarActions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Image.asset(
            "assets/gc_logo.png",
            height: 50,
            width: 50,),
            const SizedBox(width: 10,),
          Text(
            "Green Cartoon",
            style: TextStyle(
              color: Color.fromARGB(235, 30, 240, 135),
              fontSize: 25,
            ),
          ),
          ],),
    );
  }
}