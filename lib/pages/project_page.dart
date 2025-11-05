import "package:flutter/material.dart";
import "package:green_cartoon_animation_app/components/my_sliver_to_box_headings.dart";
import "package:green_cartoon_animation_app/pages/animation_capacity_building_page.dart";
import "package:green_cartoon_animation_app/pages/gca_page.dart";


class ProjectPage extends StatelessWidget {

  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {

  final double _height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      
      body: CustomScrollView(
        slivers: [
          const MySliverToBoxHeadings(
            providedMainAxisAlignment: MainAxisAlignment.start,
            heading: "Projects",),
          
          // image
          SliverToBoxAdapter(
                child: Container(
                  height: _height*0.4,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/ijapa-smile-landscape-T1rLCFID.jpeg" ),
                      ),
                    ),
                ),
          ),

            // Green Cartoon Animations

          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Green Cartoon Animations",
                              style: TextStyle(fontSize: 25,
                              ),
                      ),
                  const Text("| 2020",
                      style: TextStyle(fontSize: 25),),

                  // Tetfund logo
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Row(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle
                            ),
                            child: Image.asset("assets/tetfund-icon.png",
                            fit: BoxFit.contain,
                            ),
                          ),
                       
                          // Tetfund text
                          Text("TETFUND",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 16
                          ),),
                        ],
                                         ),

                        // visit
                        Container(
                          margin: const EdgeInsets.only(right: 20),
                          padding: const EdgeInsets.only(bottom: 5),
                          child: ElevatedButton.icon(
                            label: Text(
                              "visit",
                              style: TextStyle(
                                color: Colors.green,
                                decoration: TextDecoration.underline
                              ),
                            ),
                            icon: Icon(
                              Icons.open_in_new,
                              color: Colors.green,),
                            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => GcaPage(),)),
                          ),
                        )
                     ],
                   ),

                  // Tetfund's mission.
                  const Text("We aim to captivate the younger minds into legendary folktales, learning their history before reaching oblivion; we envision a means of inculcating standard morals and wisdom to...",
                    style: TextStyle(
                      fontFamily: "Quicksand-Medium",
                      fontSize: 16
                    ),),

                    // acb members image.
                    Container(
                      height: _height*0.4,
                      margin: EdgeInsets.only(top: 30, bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/Team/team-members/acb-members.jpg"),
                          ),
                        ),
                    ),

                    // Animation Capacity Building 
                  const Text("Animation Capacity",
                              style: TextStyle(fontSize: 25,
                              ),
                      ),
                  const Text("Building | 2024",
                      style: TextStyle(fontSize: 25),),

                  // AlumNode
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            height: 37,
                            width: 37,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle
                            ),
                            child: Image.asset(
                              "assets/alum-node-icon.png",
                              width: 8,
                              height: 8,
                            fit: BoxFit.contain,
                            ),
                          ),
                      
                          const SizedBox(width: 10,),
                      
                          // Tetfund text
                          Text("AlumNode",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: 18
                          ),),
                        ],
                      ),

                      Container(
                          margin: const EdgeInsets.only(right: 20),
                          padding: const EdgeInsets.only(bottom: 5),
                          child: ElevatedButton.icon(
                            label: Text(
                              "visit",
                              style: TextStyle(
                                color: Colors.green,
                                decoration: TextDecoration.underline
                              ),
                            ),
                            icon: Icon(
                              Icons.open_in_new,
                              color: Colors.green,),
                            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AnimationCapacityBuildingPage(),)),
                          ),
                        )                      
                    ],
                  ),

                  // AlumNode 
                  Container(
                    margin: const EdgeInsets.only(top: 8.0, bottom: 12),
                    child: const Text("We seek to empower young men and women with Capacity for animation and cartoon creation. We intend to build a nucleus of trained individuals who in turn train other...",
                      style: TextStyle(
                        fontFamily: "Quicksand-Medium",
                        fontSize: 16
                      ),
                      ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}