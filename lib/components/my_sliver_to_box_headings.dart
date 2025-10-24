import 'package:flutter/material.dart';

class MySliverToBoxHeadings extends StatelessWidget {
    final String heading;
    final MainAxisAlignment providedMainAxisAlignment;

  const MySliverToBoxHeadings({
    super.key,
    required this.heading,
    required this.providedMainAxisAlignment
    });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: providedMainAxisAlignment,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(18),
                  margin: EdgeInsets.only(left: 12, top: 20, bottom: 15),
                  // width: 18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.green,
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment(0.8, 1),
                      colors: <Color>[
                        Color(0xff079b50),                    
                        Color(0xff808080)
                      ],
                      tileMode: TileMode.mirror)
                  ),
                  child: Text(
                    heading,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w600
                    ),
                    ),
                    ),
              ],
            ),
          );
  }
}