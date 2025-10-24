import 'package:flutter/material.dart';

class TetfundAndAlumnodeRowLayout extends StatelessWidget {
  final String imgPath;
  final String middleText;
  final void Function()? websiteUrl;

  const TetfundAndAlumnodeRowLayout({
    super.key,
    required this.imgPath,
    required this.middleText,
    required this.websiteUrl
    });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imgPath, width: 30, height: 30),
          const SizedBox(width: 10),
          Text(
            middleText,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: websiteUrl,
            icon: Icon(Icons.open_in_new),),
        ],
      ),
    );
  }
}
