import 'package:flutter/material.dart';
import 'package:green_cartoon_animation_app/components/herolayout.dart';
import 'package:green_cartoon_animation_app/components/my_sliver_to_box_headings.dart';

// Parent widget with precache + sliverlist
class AboutUsPage extends StatefulWidget {
  const AboutUsPage({super.key});

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  final List<Map<String, String>> teamMembers = [
    {
      "name": "Dr. Deborah Ninan",
      "position": "Principal Investigator",
      "image": "assets/Team/team-members/ninan.jpg",
    },
    {
      "name": "Dr. Adekunle Afolabi",
      "position": "Team Member",
      "image": "assets/Team/team-members/afolabi.jpg",
    },
    {
      "name": "Dr. Abimbola Iyanda",
      "position": "Team Member",
      "image": "assets/Team/team-members/iyanda.jpg",
    },
    {
      "name": "Mr. Mayowa Alade",
      "position": "Team Member",
      "image": "assets/Team/team-members/mayor.png",
    },
    {
      "name": "Mr. Stephen Folaranmi",
      "position": "Team Member",
      "image": "assets/Team/team-members/folaranmi.png",
    },
    {
      "name": "Dr. Karen Olufokunbi",
      "position": "Team Member",
      "image": "assets/Team/team-members/olufoks.png",
    },
    {
      "name": "Prof. Odetunji Odejobi",
      "position": "Team Member",
      "image": "assets/Team/team-members/odejobi.png",
    },
    {
      "name": "Prof. Felix Fabunmi",
      "position": "Team Member",
      "image": "assets/Team/team-members/fabunmi.png",
    },
    {
      "name": "Dr. Joshua Salami",
      "position": "Team Member",
      "image": "assets/Team/team-members/salam.png",
    },
    {
      "name": "Dr. Isaac Elesemoyo",
      "position": "Team Member",
      "image": "assets/Team/team-members/isaac.png",
    },
  ];

  @override
  void initState() {
    super.initState();

    // Precache all images
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (final member in teamMembers) {
        precacheImage(
        ResizeImage(
          AssetImage(member["image"]!),
          height: 400,
        ),
         context);
      }
    });
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GREEN"),),
      body: CustomScrollView(
        slivers: <Widget>[
          MySliverToBoxHeadings(
            providedMainAxisAlignment: MainAxisAlignment.start,
            heading: "About Us"),

          const SliverToBoxAdapter(
            child: SizedBox(height: 5,)
          ),

          // What we do.
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: const Text(
                "What We Do",
                style: TextStyle(
                  fontSize: 25
                ),),
            ),
          ),

          // What we do paragraph
          SliverToBoxAdapter(
            child: Container(
            margin: const EdgeInsets.only(right: 10, left: 10, bottom: 10),             
             child: const Text(
                 """ At our studio, we breathe new life into traditional stories through captivating animations. We specialize in transforming timeless tales into visually stunning sequences that resonate with audiences young and old. Our team combines artistic flair with technical expertise to create animations that honour the essence of these cherished stories with their original fresh and dynamic twists. From classic fables to legendary myths, we strive to preserve the heart of each narrative, making them accessible and engaging for contemporary audiences.""",
                  style: TextStyle(
                    fontFamily: "Quicksand-Medium"
                  ),),
            ),
          ),

          // Meet the team
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: const Text(
                "Meet The Team",
                style: TextStyle(
                  fontSize: 25
                ),),
            ),
          ),

          // Meet the team paragraph
          SliverToBoxAdapter(
            child: Container(
            margin: const EdgeInsets.only(right: 10, left: 10, bottom: 10 ),
              child: Text(
                " Meet the creative minds behind our enchanting animations. Our diverse team is comprised of talented animators, storytellers, and designers, each bringing their unique skills and perspectives to the table. Our team collaborates closely to ensure that every project is a labour of love. From brainstorming sessions to the final render, we work together seamlessly, pooling our creativity and expertise to breathe life into traditional stories. Get to know the faces behind the magic and discover the passion and dedication that drives us to create animations that inspire and delight.",
                style: TextStyle(fontFamily: "Quicksand-Medium"),
                ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 20,)),

          const SliverToBoxAdapter(
            child: SizedBox(height: 5,)
          ),

          // Sliverlist for team members.
          SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final member = teamMembers[index];
          return HeroLayout(
            name: member["name"]!,
            position: member["position"]!,
            imagePath: member["image"]!,
          );
        },
        childCount: teamMembers.length,
      ),
    ),

    const SliverToBoxAdapter(
      child: SizedBox(height: 30,),
    ),

        // Contact us

        SliverToBoxAdapter(
          child: Container(
            margin: const EdgeInsets.only(left: 15, bottom: 20, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  "Contact Us",
                  style: TextStyle(
                    fontSize: 20
                  ),),

                  const SizedBox(height: 15,),

                  Text(
                    "Feel free to give us a call or send texts through the following contacts.",
                    style: TextStyle(
                      fontFamily: "Quicksand-Regular",
                    ),
                  ),

                  const SizedBox(height: 5),

                  // email
                  ListTile(
                    leading: Icon(Icons.email_outlined),
                    title: Text(
                      "greencartoonanimations@gmail.com",
                      style: TextStyle(
                        fontFamily: "Quicksand-Regular",
                      ),
                    ),
                    subtitle: Text(
                      "EMAIL ADDRESS",
                      style: TextStyle(
                        fontFamily: "Quicksand-Regular",
                        fontSize: 12
                      ),),
                  ),

                  // phone number
                  ListTile(
                    leading: Icon(Icons.phone_outlined),
                    title: Text(
                      "+234 803 403 3734",
                      style: TextStyle(
                        fontFamily: "Quicksand-Regular",
                      ),
                    ),
                    subtitle: Text(
                      "TELEPHONE",
                      style: TextStyle(
                        fontFamily: "Quicksand-Regular",
                        fontSize: 12
                      ),),
                  ),


              ],
            ),
          ),
        ),


        ]
      )
    );
}
}
