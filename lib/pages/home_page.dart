import 'package:flutter/material.dart';
import 'package:green_cartoon_animation_app/components/appbar_image.dart';
import 'package:green_cartoon_animation_app/components/carousel_videos.dart';
// import 'package:green_cartoon_animation_app/components/carousel_videos.dart';
import 'package:green_cartoon_animation_app/components/my_drawer.dart';
import 'package:green_cartoon_animation_app/components/my_sliver_app_bar.dart';
// import 'package:green_cartoon_animation_app/components/my_youtube_carousel.dart';
// import 'package:green_cartoon_animation_app/pages/youtube_carousel_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            title: Container(
              height: 80,
              padding: const EdgeInsets.all(25),
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inverseSurface,
                borderRadius: BorderRadius.circular(8)
              ),
              child: Center(
                child: Text(
                  "Green Cartoon Animations",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                    
                  ),
                  ),
              ),
                ),
            child: AppbarImage()
        
            )
        ],

        body: MyCarouselVideos(),
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //   items: [
        //     BottomNavigationBarItem(
        //       icon: IconButton(
        //         onPressed: (){}, 
        //         icon: Icon(Icons.home)
        //         )
        //         )
        //         ]),
    );
  }
}