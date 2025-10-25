import 'dart:async';

import 'package:flutter/material.dart';
import 'package:green_cartoon_animation_app/components/herolayout_trainees.dart';
import 'package:green_cartoon_animation_app/components/my_blockquote_wrapper.dart';
import 'package:green_cartoon_animation_app/components/my_sliver_text_widget.dart';
import 'package:green_cartoon_animation_app/components/my_sliver_to_box_headings.dart';
import 'package:green_cartoon_animation_app/components/project_page_layout.dart';
import 'package:green_cartoon_animation_app/components/team_members_list_tile.dart';
import 'package:green_cartoon_animation_app/components/tetfund_and_alumnode_row_layout.dart';
import 'package:sliver_center/sliver_center.dart';
import 'package:url_launcher/url_launcher.dart';

class AnimationCapacityBuildingPage extends StatefulWidget {
  const AnimationCapacityBuildingPage({super.key});

  @override
  State<AnimationCapacityBuildingPage> createState() => _AnimationCapacityBuildingPageState();
}

class _AnimationCapacityBuildingPageState extends State<AnimationCapacityBuildingPage> {

      Future<void> _launchURL(String urlString) async {
      final Uri url = Uri.parse(urlString);
      if (!await launchUrl(url)) {
        throw 'Could not launch $url';
      }
    }


    final ScrollController _scrollController = ScrollController();
  double scrollSpeed = 40; // pixels per second
  late Timer _timer;

  final List<Map<String, dynamic>> testimonials = [
    {
      'name': 'Adelabi Daniel Oluwadamilare',
      'university': 'Clinton Awosika University',
      'rating': 5,
      'text': 'A strong opportunity so far. Helped me improve tech standard.',
      'image': 'assets/Team/team-members/ninan.jpg',
    },
    {
      'name': 'Jason Prince',
      'university': 'Clinton Awosika University',
      'rating': 5,
      'text':
          'It has been a great opportunity for me to explore the world of 3D beyond the basics.',
      'image': 'assets/Team/team-members/ninan.jpg',
    },
    {
      'name': 'Blessing O.',
      'university': 'Clinton Awosika University',
      'rating': 4,
      'text': 'Very insightful experience, helped me grow in design thinking.',
      'image': 'assets/Team/team-members/ninan.jpg',
    },
  ];

  void _resumeScrolling() {
    _timer = Timer.periodic(const Duration(milliseconds: 30), (timer) {
    if (_scrollController.hasClients) {
      double newPosition = _scrollController.offset + (scrollSpeed * 0.03);
      if (newPosition >= _scrollController.position.maxScrollExtent) {
        _scrollController.jumpTo(0);
      } else {
        _scrollController.jumpTo(newPosition);
      }
    }
  });
  }

  @override
void initState() {
  super.initState();

  WidgetsBinding.instance.addPostFrameCallback((_) {
    final duplicated = List<Map<String, dynamic>>.from(testimonials);
    testimonials.addAll(duplicated);
     // update widget safely after frame
  });

  _resumeScrolling();
}

  @override
  void dispose() {
    _timer.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ProjectPageLayout(
            imgPath: "assets/Team/team-members/acb-members.jpg", 
            aboutText: Text.rich(
              TextSpan(
                text: "Animation Capacity building is a project at the Department of Computer Science and Engineering Obafemi Awolowo University Ile-Ife is funded by the ",
                children: <TextSpan>[
                TextSpan(text: "AlumNode", style: TextStyle(color: Colors.green, decoration: TextDecoration.underline),),
                TextSpan(text: " Germany")
              ]),
            ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 20,),),

            const SliverCenter(sliver: MySliverToBoxHeadings(
              heading: "Animation Capacity Building", 
              providedMainAxisAlignment: MainAxisAlignment.center),
            ),

            TetfundAndAlumnodeRowLayout(
              imgPath: "assets/alum-node-icon.png", 
              middleText: "AlumNode",
              websiteUrl: (){
                _launchURL("https://alumnode.org/");
              },
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 40,),),
            const MyBlockQuoteWrapper(textInQuote: "GOAL"),
            const MySliverTextWidget(
              textString: Text("We seek to empower young men and women with Capacity for animation and cartoon creation. We intend to build a nucleus of trained individuals who can in turn train others in different aspects of animation and cartoon development. In addition, we intend to create a training and capacity building hub at the Obafemi Awolowo University, Ile-Ife Nigeria.")),

            const SliverToBoxAdapter(child: SizedBox(height: 8),),
            const MyBlockQuoteWrapper(textInQuote: "EXPERIENCE"),
            const MySliverTextWidget(
              textString: Text.rich(
                 TextSpan(
                  text: "There is a dearth of required personnel in this domain in Nigeria and Africa. Animation creation requires bringing together various skills in concept creation, modeling, and animation among others. Because of the time it takes to acquire suck skills, few individuals are available for the required needs for animation and cartoon in Nigeria and Africa. Our personal experience on a TETFUND funded project at ",
                  children: <TextSpan> [
                    TextSpan(text: "GreenCartoon", style: TextStyle(color: Colors.green, decoration: TextDecoration.underline),),
                    TextSpan(text: " confirms this conclusion.")
                  ] 
                )
              )),

            const MyBlockQuoteWrapper(textInQuote: "TEAM MEMBERS"),

            SliverToBoxAdapter(
              child: Column(
                children: const [
                  // Dr. Ninan
                  TeamMembersListTile(
                    imgPath: "assets/Team/team-members/ninan.jpg", 
                    title: "Dr. Deborah NInan (PhD)", 
                    subTitle: "Principal Investigator"),

                    // Dr. Afolabi
                  TeamMembersListTile(
                    imgPath: "assets/Team/team-members/afolabi.jpg", 
                    title: "Dr. Adekunle Afolabi (PhD)", 
                    subTitle: "Team Member"),

                    // Dr. Iyanda
                  TeamMembersListTile(
                    imgPath: "assets/Team/team-members/iyanda.jpg", 
                    title: "Dr. Abimbola Iyanda (PhD)", 
                    subTitle: "Team Member"),
                    
                    // Dr. Isaac
                  TeamMembersListTile(
                    imgPath: "assets/Team/team-members/isaac.png", 
                    title: "Dr. Isaac Elesemoyo (PhD)", 
                    subTitle: "Team Member"),

                ],
              ),
            ),

            // Testimonials
            const MyBlockQuoteWrapper(textInQuote: "TESTIMONIALS"),

            // Testimonials text
            const MySliverTextWidget(
              textString: Text("We invite you to explore the gallery of work done by our trainees and this is how some of the trainees feel about the programme ",
              )
            ),

            SliverToBoxAdapter(
              child: SizedBox(
                    height: 350,
                    child: ListView.builder(
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: testimonials.length,
                      itemBuilder: (context, index) {
                        final t = testimonials[index];
                        return GestureDetector(
                          onLongPressStart: (_) {
                            // Pause scrolling when user holds
                            _timer.cancel();
                          },
                          onLongPressEnd: (_) {
                            // Resume scrolling when user releases
                            _resumeScrolling();
                          },
                          child: Container(
                                        width: 250,
                                        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
                                        child: Card(
                                          elevation: 4,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(16)),
                                          child: Padding(
                                            padding: const EdgeInsets.all(16),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                CircleAvatar(
                                                  radius: 32,
                                                  backgroundImage: AssetImage(t['image']),
                                                ),
                                                const SizedBox(height: 12),
                                                Text(
                                                  t['name'],
                                                  style: const TextStyle(
                                                      fontWeight: FontWeight.bold, fontSize: 16),
                                                  textAlign: TextAlign.center,
                                                ),
                                                Text(
                                                  t['university'],
                                                  style:
                                                      const TextStyle(color: Colors.grey, fontSize: 13),
                                                  textAlign: TextAlign.center,
                                                ),
                                                const SizedBox(height: 8),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: List.generate(
                                                    5,
                                                    (i) => Icon(
                                                      i < t['rating']
                                                          ? Icons.star
                                                          : Icons.star_border,
                                                      color: Colors.amber,
                                                      size: 18,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 8),
                                                Text(
                                                  t['text'],
                                                  style: const TextStyle(fontSize: 13),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                          ),
                        );
                      },
                    ),
                  ),
         ),

        const MyBlockQuoteWrapper(textInQuote: "GALLERY"),
        
       const HerolayoutTrainees(),
   ],
   ),
  );
  }
}