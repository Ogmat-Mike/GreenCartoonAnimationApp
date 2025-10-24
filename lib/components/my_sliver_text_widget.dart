import 'package:flutter/material.dart';

class MySliverTextWidget extends StatelessWidget {
  final Text textString;

  const MySliverTextWidget({
    super.key,
    required this.textString
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.all(15),
        child: DefaultTextStyle(
          style: const TextStyle(
            color: Colors.black,
            fontFamily: "Quicksand-Medium",
            fontSize: 15),
            

          child: textString)
      ),
    );
  }
}