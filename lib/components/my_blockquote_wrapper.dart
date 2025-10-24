import 'package:flutter/material.dart';

class MyBlockQuoteWrapper extends StatelessWidget {
  final String textInQuote;

  const MyBlockQuoteWrapper({
    super.key,
    required this.textInQuote
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
       child: Wrap(
         children: [
           Container(
             margin: const EdgeInsets.all(20),
             padding: const EdgeInsets.all(12),
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(25),
               color: Colors.white,
               boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(68, 0, 0, 0),
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                ),
             ],
         
           ),
           child: Row(
             mainAxisSize: MainAxisSize.min,
             children: [
               // the blockquote
               const Padding(
                 padding: EdgeInsets.only(right: 10.0),
                 child: Icon(Icons.format_align_left_outlined),
               ),
           
               // goals text
                Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Text(textInQuote),
                ),
             ],
           ),
         ),
       ]
       ),
     );
  }
}