import 'package:flutter/material.dart';
import 'package:green_cartoon_animation_app/components/my_appbar_actions.dart';

class MySliverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;

  const MySliverAppBar({
    super.key,
    required this.child,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final orientation = media.orientation;
    final height = media.size.height;

    // Adjust height dynamically based on orientation
    final expandedHeight = orientation == Orientation.portrait
        ? height * 0.85
        : height * 0.65;

    return SliverAppBar(
      automaticallyImplyLeading: true,
      expandedHeight: expandedHeight,
      floating: false,
      pinned: true,
      title: MyAppBarActions(),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        stretchModes: const [
          StretchMode.zoomBackground,
          StretchMode.fadeTitle,
        ],
        background: Stack(
          fit: StackFit.expand,
          alignment: AlignmentDirectional.center,
          children: [
            // Background layer
            child,

            // Dark overlay for contrast
            Container(
              color: const Color.fromARGB(132, 3, 3, 3),
            ),

            // Foreground content (logo, text, mission, etc.)
            LayoutBuilder(
              builder: (context, constraints) {
                return Center(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: IntrinsicHeight(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Logo
                            Image.asset(
                              "assets/gc_logo.png",
                              height: 150,
                              width: 150,
                            ),

                            // Green | Cartoon
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Green ",
                                  style: TextStyle(
                                    color: Color(0xFF079b50),
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  "| Cartoon",
                                  style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),

                            // Intro text
                            const Text(
                              "...sit, hear and watch high definition animations.",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),

                            const SizedBox(height: 50),

                            // Mission info
                            Container(
                              margin: const EdgeInsets.only(right: 18),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  // Mission statement
                                  Container(
                                    height: 150,
                                    margin: const EdgeInsets.only(right: 18),
                                    padding: const EdgeInsets.only(right: 15),
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                          color: Colors.green,
                                          width: 5,
                                          style: BorderStyle.solid,
                                        ),
                                      ),
                                    ),
                                    child: const Text(
                                      '''
We aim to captivate the younger 
minds into legendary folktales, 
learning their history before 
reaching oblivion; we envision a means of inculcating 
standard morals and wisdom to relate with one another in 
love and unity.
''',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Quicksand-Medium",
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.end,
                                    ),
                                  ),

                                  const SizedBox(height: 10),

                                  // Mission label
                                  Container(
                                    margin: const EdgeInsets.only(right: 18),
                                    padding: const EdgeInsets.only(right: 12),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        right: BorderSide(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .primary,
                                          style: BorderStyle.solid,
                                          width: 5,
                                        ),
                                      ),
                                    ),
                                    child: Text(
                                      "MISSION",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
