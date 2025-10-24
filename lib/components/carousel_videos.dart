// // import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

// enum ThumbnailInfo {
//   image0("Animation", "Season 1 | Episode 1", "https://www.youtube.com/watch?v=ANv9wxkEcX0&list=PL40CCm7kKzr4aL4tPfERT9bI9mTtRjMtW&index=3"),
//   image1("Animation", "Season 1 | Episode 2", "https://www.youtube.com/watch?v=zzc3oYtkN48"),
//   image2("Animation", "Season 1 | Episode 3", "https://www.youtube.com/watch?v=iMuG6okkm58&t=1s"),
//   image3("Animation", "Season 1 | Episode 4", "https://www.youtube.com/watch?v=s91MKEkNytk");

//   const ThumbnailInfo(this.title, this.subtitle, this.videoUrl);
//   final String title;
//   final String subtitle;
//   final String videoUrl;

// }

// class MyCarouselVideos extends StatefulWidget {
//   const MyCarouselVideos({super.key});

//   @override
//   State<MyCarouselVideos> createState() => _MyCarouselVideosState();
// }

// class _MyCarouselVideosState extends State<MyCarouselVideos> {


//   final List<YoutubePlayerController> _controllers = [];
//   final CarouselController controller = CarouselController(initialItem: 1);

//   @override
//   void initState() {
//     super.initState();

//     for (var url in ThumbnailInfo.values) {
//       String videoUrl = url.videoUrl;
//       _controllers.add(
//         YoutubePlayerController(
//           initialVideoId: YoutubePlayer.convertUrlToId(videoUrl)!,
//           flags: YoutubePlayerFlags(autoPlay: false))
//       );
//     }
//   }

//   @override
//   void dispose() {
//     for (var controller in _controllers) {
//       controller.dispose();
//       super.dispose();
//     }
//   }

//   String? _currentVideoId;

//   @override
//   Widget build(BuildContext context) {
//    return _currentVideoId == null 
//    ? ListView.builder(
//     scrollDirection: Axis.horizontal,
//     itemCount: _controllers.length,
//     itemBuilder: (context, index) {
      
//       var myWidget = ThumbnailInfo.values.map(
//         (thumbnailData) {
//           final videoId = YoutubePlayer.convertUrlToId(thumbnailData.videoUrl);
//           final thumbnailUrl = "https://img.youtube.com/vi/$videoId/0.jpg";
//           final thumbnailTitle = thumbnailData.title;
//           final thumbnailSubtitle = thumbnailData.subtitle;
//           final double height = MediaQuery.sizeOf(context).height;
//           final double width = MediaQuery.sizeOf(context).width;
//             return GestureDetector(
//             onTap: () {
//               setState(() {
//                 _currentVideoId = videoId;
//               });
//             },
            
//             child: Stack(
//               alignment: AlignmentDirectional.bottomStart,
//               children: <Widget>[
            
//                 // First Child.
//                 ClipRRect(
//                   borderRadius: BorderRadius.circular(20),
//                   child: OverflowBox(
//                     maxHeight: height/3,
//                     maxWidth: width,
//                     child: Image.network(
//                       thumbnailUrl,
//                       fit: BoxFit.cover,),
//                   ),
//                 ),
            
//                 // Second child --> The title displayed in front.
            
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisSize: MainAxisSize.min,
//                     children: <Widget>[
//                       Text(
//                         thumbnailTitle,
//                         overflow: TextOverflow.clip,
//                         softWrap: false,
//                         style: Theme.of(context).textTheme.headlineLarge?.copyWith(
//                           color: Theme.of(context).colorScheme.primary),
//                         ),
            
//                         // sized box
            
//                         const SizedBox(height: 10,),
            
//                         Text(
//                           thumbnailSubtitle,
//                           overflow: TextOverflow.clip,
//                           softWrap: false,
//                           style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                             color: Theme.of(context).colorScheme.inversePrimary),
//                         ),
//                     ],
//                   ),
                  
//                   ),
                  
            
//                 ],
//             ),
//           );
//         }
//         ).toList();

//       for(var mywidget in myWidget) {
//         return Expanded(
//           child: Container(
//             child: mywidget,
//           ),
//         );
//       }
//     },
//     )

//     : YoutubePlayer(
//       controller: YoutubePlayerController(
//         initialVideoId: _currentVideoId!,
//         flags: const YoutubePlayerFlags(
//           autoPlay: true,
//           mute: false,
//         ),),
//         showVideoProgressIndicator: true,
//     );
//   }
// }