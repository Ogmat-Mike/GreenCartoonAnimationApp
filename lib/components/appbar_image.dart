import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


  final String title = "Trending";
  final String subtitle = "Watch Now | Ijapa";
  // final String img = "https://www.youtube.com/watch?v=iMuG6okkm58&t=1s";
  final String videoId = "iMuG6okkm58&t=1s";
  final String thumbnailUrl = "https://img.youtube.com/vi/$videoId/0.jpg";
  

class AppbarImage extends StatefulWidget {
  const AppbarImage({super.key});

  @override
  State<AppbarImage> createState() => _AppbarImageState();
}

class _AppbarImageState extends State<AppbarImage> {

  late final YoutubePlayerController controller;

  @override
  void initState() {
    super.initState();
    controller = YoutubePlayerController(
    initialVideoId: videoId,
    flags: YoutubePlayerFlags(autoPlay: true)
    );

  }

  
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  String? _currentVideoId;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;
    
    return _currentVideoId == null
    ?  GestureDetector(
          onTap: () {
            setState(() {
              _currentVideoId = videoId;
            });
          },
       child: Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: <Widget>[
              // First Child --> The image
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: OverflowBox(
                maxHeight: height/3,
                maxWidth: width,
                child: Image.network(
                  thumbnailUrl,
                  fit: BoxFit.cover,),
              ),
            ),

            // Second Child --> Title

            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      title,
                      overflow: TextOverflow.clip,
                      softWrap: false,
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: Theme.of(context).colorScheme.primary),
                      ),

                      const SizedBox(height: 10,),

                      // Third Child --> Subtitle.
   
                      Text(
                        subtitle,
                        overflow: TextOverflow.clip,
                        softWrap: false,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.inversePrimary),
                      ),
                  ],
                ),
                
                )
   


            ],
          ),
    
          
        )      

    : YoutubePlayer(
      controller: YoutubePlayerController(
        initialVideoId: _currentVideoId!,
        flags: const YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ),
        ),        
      showVideoProgressIndicator: true,
      );
  }
}