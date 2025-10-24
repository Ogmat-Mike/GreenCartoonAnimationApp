import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MySliverListVideoPlayer extends StatefulWidget {
  const MySliverListVideoPlayer({super.key});

  @override
  State<MySliverListVideoPlayer> createState() => _MySliverListVideoPlayerState();
}

class _MySliverListVideoPlayerState extends State<MySliverListVideoPlayer> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/video/intro.mp4")
    ..initialize().then((_) {
      setState(() {}); // rebuild once initialized
      _controller.play(); // autoplay after initialization
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return SliverToBoxAdapter(// ensures video has space to render
      child: _controller.value.isInitialized ?
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            margin: EdgeInsets.only(left: 5, bottom: 5, right: 5)
            ,
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
              ),
          ),
        )
          : Container(
            height: 200,
            color: Colors.black,
            child: const Center(
              child: CircularProgressIndicator(),
            ),
            )
    );
  }
}
