import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:green_cartoon_animation_app/models/resources.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({super.key});

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  final Languages _languages = Languages();
  final YoutubeExplode _yt = YoutubeExplode();

  String _selectedLanguage = "All";

  final Map<String, VideoMetadata> _videoMeta = {};
  final Map<String, YoutubePlayerController> _controllers = {};
  final Set<String> _playingVideos = {}; // Track which ones are playing

  List<String> _displayList = [];

  @override
  void initState() {
    super.initState();
    _initializeAllVideos();
  }

  @override
  void dispose() {
    for (var controller in _controllers.values) {
      controller.dispose();
    }
    _yt.close();
    super.dispose();
  }

  /// Combine all video IDs for "All"
  void _initializeAllVideos() {
    final all = [
      ..._languages.yorubaLinks,
      ..._languages.hausaLinks,
      ..._languages.ibibioLinks,
      ..._languages.igboLinks,
      ..._languages.kanuriLinks,
      ..._languages.tivLinks,
    ];
    setState(() => _displayList = all);
    _fetchMetadataForList(all);
  }

  /// When a language button is tapped
  void _onLanguageTap(String language) {
    setState(() {
      _selectedLanguage = language;
      _controllers.forEach((_, controller) => controller.pause());
      _playingVideos.clear();
    });

    if (language == "All") {
      _initializeAllVideos();
      return;
    }

    List<String> list = [];
    switch (language) {
      case "Yoruba":
        list = _languages.yorubaLinks;
        break;
      case "Hausa":
        list = _languages.hausaLinks;
        break;
      case "Ibibio":
        list = _languages.ibibioLinks;
        break;
      case "Igbo":
        list = _languages.igboLinks;
        break;
      case "Kanuri":
        list = _languages.kanuriLinks;
        break;
      case "Tiv":
        list = _languages.tivLinks;
        break;
    }

    setState(() => _displayList = list);
    _fetchMetadataForList(list);
  }

  /// Fetch metadata
  Future<void> _fetchMetadataForList(List<String> videoIds) async {
    for (var vid in videoIds) {
      if (_videoMeta.containsKey(vid)) continue;
      try {
        final video = await _yt.videos.get(vid);
        _videoMeta[vid] = VideoMetadata(
          title: video.title,
          duration: video.duration,
        );
        setState(() {});
      } catch (e) {
        debugPrint("Error fetching metadata for $vid: $e");
      }
    }
  }

  YoutubePlayerController _getController(String videoId) {
    if (_controllers.containsKey(videoId)) return _controllers[videoId]!;
    final controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
    _controllers[videoId] = controller;
    return controller;
  }

  @override
  Widget build(BuildContext context) {
    final allLanguages = _languages.allLanguages;

    return Scaffold(
      appBar: AppBar(
        title: const Text("GREEN CARTOON"),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          // ===== Language Buttons =====
          Container(
            margin: const EdgeInsets.only(top: 12, bottom: 12),
            height: 55,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: allLanguages.length,
              itemBuilder: (context, index) {
                final lang = allLanguages[index];
                final isSelected = _selectedLanguage == lang;
                return GestureDetector(
                  onTap: () => _onLanguageTap(lang),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 6),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.green : Colors.grey[300],
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        lang,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black87,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // ===== Video Feed =====
          Expanded(
            child: _displayList.isEmpty
                ? const Center(child: Text("No videos available"))
                : ListView.builder(
                    itemCount: _displayList.length,
                    itemBuilder: (context, index) {
                      final videoId = _displayList[index];
                      final meta = _videoMeta[videoId];
                      final isPlaying = _playingVideos.contains(videoId);
                      final controller = _getController(videoId);
                      final thumbUrl =
                          "https://img.youtube.com/vi/$videoId/0.jpg";

                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromARGB(68, 0, 0, 0),
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // ===== Thumbnail OR Player =====
                            if (!isPlaying)
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _playingVideos.add(videoId);
                                  });
                                },
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(12),
                                        topRight: Radius.circular(12),
                                      ),
                                      child: Image.network(
                                        thumbUrl,
                                        height: 220,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      height: 220,
                                      decoration: BoxDecoration(
                                        color: Color.fromARGB(76, 0, 0, 0),
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(12),
                                          topRight: Radius.circular(12),
                                        ),
                                      ),
                                    ),
                                    const Icon(
                                      Icons.play_arrow,
                                      color: Colors.white,
                                      size: 65,
                                    ),
                                  ],
                                ),
                              )
                            else
                              YoutubePlayer(
                                controller: controller,
                                showVideoProgressIndicator: true,
                                progressIndicatorColor: Colors.green,
                              ),

                            // ===== Video Info =====
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    meta?.title ?? "Loading...",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  if (meta?.duration != null)
                                    Text(
                                      _formatDuration(meta!.duration!),
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  String _formatDuration(Duration d) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(d.inMinutes.remainder(60));
    final seconds = twoDigits(d.inSeconds.remainder(60));
    return "$minutes:$seconds";
  }
}

class VideoMetadata {
  final String title;
  final Duration? duration;
  VideoMetadata({required this.title, this.duration});
}
