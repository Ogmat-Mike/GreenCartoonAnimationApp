import 'package:flutter/material.dart';
import 'package:green_cartoon_animation_app/components/my_sliver_list_video_player.dart';

class MySliverList extends StatelessWidget {
  const MySliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(left: 5, right: 5, bottom: 5),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
        [

          // Animations
          Container(
          margin: const EdgeInsets.only(bottom: 15),
          child: const Text(
            "Animations",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          ),

          // Animations paragraph
          Container(
            padding: const EdgeInsets.only(left: 10),
            margin: const EdgeInsets.only(bottom: 5),
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(
                  width: 3,
                  color: Colors.green,
                  )
              )
            ),
            child: Text("Dive into our captivating animations, where creativity meets technology. Our talented animators craft visually stunning sequences that engage and entertain. Each frame is a masterpiece, telling stories that resonate with audiences of all ages.",
            style: TextStyle(
              fontFamily: "Quicksand-Regular",
              // fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.inverseSurface,
              height: 1.8,
              fontSize: 15),
              ),
              ),

              const SizedBox(height: 40,),

          // Environment image,
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: 230,
              width: const BoxConstraints().maxWidth,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/environment-village-C8_5iz2h.jpeg"),
                  fit: BoxFit.cover,
                  alignment: Alignment.center
                )
              ),
            ),
          ),


          // Environment Models
          Container(
          margin: const EdgeInsets.only(bottom: 15, top: 20),
          child: const Text(
            "Environment Models",
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          ),


          // Environment paragraph
          Container(
            padding: const EdgeInsets.only(right: 12),
            margin: const EdgeInsets.only(bottom: 10),
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(
                  width: 3,
                  color: Colors.green
                )
              )
            ),
            child: const Text("Explore immersive landscapes with our detailed environment models. From serene meadows to historical settings, our designs set the stage for unforgettable adventures. Every element is meticulously crafted to create a rich and legendary world.",
            textAlign: TextAlign.end,
            style: TextStyle(
              fontFamily: "Quicksand-Regular",
              // fontWeight: FontWeight.bold,
              fontSize: 15,
              height: 1.8
            ),),
            ),

            const SizedBox(height: 50,),

            // Characters image.
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
              height: 230,
              width: const BoxConstraints().widthConstraints().maxWidth,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/ijapa-smile-portrait-D6bhOdX5.png",
                  ),
                  fit: BoxFit.cover,
                  alignment: Alignment.center 
                ),
                ),
                        ),
            ),

          // Characters text
           Container(
          margin: const EdgeInsets.only(bottom: 15, top: 20),
          child: const Text(
            "Characters",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          ),


          // Characters paragraph
          Container(
            padding: const EdgeInsets.only(left: 12),
            margin: const EdgeInsets.only(bottom: 5),
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(
                  width: 3,
                  color: Colors.green,
                  )
              )
            ),
            child: Text("Meet our colorful cast of characters, each with their own unique personalities and stories. Whether they're heroes on epic quests or quirky sidekicks, our characters capture long-forgotten history and bring our tales to life. Engaging dialogue and dynamic interactions make them truly unforgettable.",
            style: TextStyle(
              fontFamily: "Quicksand-Regular",
              // fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.inverseSurface,
              height: 1.8,
              fontSize: 15),
              ),
              ),

              const SizedBox(height: 45,),

              // CONTACT US
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(18),
                    margin: const EdgeInsets.only(left: 12, top: 5, bottom: 10),
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
                    child: const Text(
                      "CONTACT US",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w600
                      ),
                      ),
                      ),
                ],
              ),

                  // email address.
                  Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: const ListTile(
                      leading: Icon(
                        Icons.email_outlined,
                        ),
                      title: Text(
                        "greencartoonanimations@gmail.com",
                        style: TextStyle(
                          fontFamily: "Quicksand-Regular",
                          fontSize: 14
                        ),
                        ),
                      subtitle: Text(
                        "EMAIL ADDRESS",
                        style: TextStyle(
                          fontFamily: "Quicksand-Regular",
                          fontWeight: FontWeight.w600,
                          fontSize: 12
                        ),),
                    ),
                  ),


                  // Telephone
                  Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: const ListTile(
                      leading: Icon(
                        Icons.phone_outlined,
                        ),
                      title: Text(
                        "+234 803 403 3734",
                        style: TextStyle(
                          fontFamily: "Quicksand-Regular",
                          fontSize: 12
                        ),
                        ),
                      subtitle: Text(
                        "TELEPHONE",
                        style: TextStyle(
                          fontFamily: "Quicksand-Regular",
                          fontWeight: FontWeight.w600
                        ),),
                    ),
                  ),

                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.all(8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "© ",
                          style: TextStyle(
                            fontFamily: "Quicksand-Light",
                            fontSize: 13
                          ),
                        ),
                        Text(
                          "2025 ",
                          style: TextStyle(
                            fontFamily: "Quicksand-Light",
                            fontSize: 13
                          ),),
                        Text(
                          "Green Cartoon Animations",
                          style: TextStyle(
                            fontFamily: "Quicksand-Light",
                            fontSize: 13
                          ),),
                        Text(
                          " All Rights Reserved",
                          style: TextStyle(
                            fontFamily: "Quicksand-Light",
                            fontSize: 13
                          ),)
                      ],
                    ),
                  ),
        ],
      )),
    );
  }
}