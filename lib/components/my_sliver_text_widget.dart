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
          style:  TextStyle(
            color: Theme.of(context).colorScheme.inverseSurface,
            fontFamily: "Quicksand-Medium",
            fontSize: 15),
            
            

          child: textString)
      ),
    );
  }
}