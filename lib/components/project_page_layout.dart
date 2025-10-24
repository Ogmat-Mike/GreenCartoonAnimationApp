import 'package:flutter/material.dart';

class ProjectPageLayout extends StatelessWidget {
  final String imgPath;
  final Text aboutText;
  
  const ProjectPageLayout({
    super.key,
    required this.imgPath,
    required this.aboutText
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(17, 214, 214, 214),
                    Color.fromARGB(181, 0, 0, 0),
                  ],
                  stops: [0.6, 0.75],
                ).createShader(bounds);
              },
              blendMode: BlendMode.hardLight,
              child: Image.asset(
                imgPath,
                height: MediaQuery.of(context).size.height*0.67,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "About",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Quicksand-Medium",
                    fontSize: 25,
                  ),
                ),

                const SizedBox(height: 8),

                DecoratedBox(
                  decoration: const BoxDecoration(
                    border: Border(
                      left: BorderSide(color: Colors.green, width: 5),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12),
                    child: DefaultTextStyle(
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: "Quicksand-Medium",
                        fontSize: 14,
                      ),
                      child: aboutText),                    
                    
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}