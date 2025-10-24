import 'package:flutter/material.dart';
import 'package:green_cartoon_animation_app/components/my_sliver_app_bar.dart';
import 'package:green_cartoon_animation_app/components/my_sliver_list.dart';
import 'package:green_cartoon_animation_app/components/my_sliver_list_video_player.dart';
import 'package:green_cartoon_animation_app/components/my_sliver_to_box_headings.dart';

class MyCustomScrollView extends StatelessWidget {
  const MyCustomScrollView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        MySliverAppBar(
          title: const Text("GCA"),
          child:
              Image.asset(
              'assets/ijapa-smile-landscape-T1rLCFID.jpeg',
              fit: BoxFit.cover,
              ),
           
          ),
    
          // // achievements
          MySliverToBoxHeadings(
            providedMainAxisAlignment: MainAxisAlignment.start,
            heading: "ACHIEVEMENTS"
            ),
    
          MySliverListVideoPlayer(),           
    
          MySliverList(),
    
    
          // Container(
          //   decoration: BoxDecoration(),
          //   child: Text("ACHIEVEMENTS"),
          // )
        ],
    
    );
  }
}