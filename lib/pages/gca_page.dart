import 'package:flutter/material.dart';
import 'package:green_cartoon_animation_app/components/my_sliver_text_widget.dart';
import 'package:green_cartoon_animation_app/components/project_page_layout.dart';
import 'package:green_cartoon_animation_app/components/tetfund_and_alumnode_row_layout.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:green_cartoon_animation_app/models/resources.dart';
import 'package:green_cartoon_animation_app/components/my_blockquote_wrapper.dart';
import 'package:green_cartoon_animation_app/components/my_sliver_to_box_headings.dart';
import 'package:sliver_center/sliver_center.dart';
import 'package:url_launcher/url_launcher.dart';

class GcaPage extends StatefulWidget {
  const GcaPage({super.key});

  @override
  State<GcaPage> createState() => _GcaPageState();
}

class _GcaPageState extends State<GcaPage> {
  final Languages _languages = Languages();
  final YoutubeExplode _yt = YoutubeExplode();

  final Map<String, VideoMetadata> _videoMeta = {};
  final Map<String, YoutubePlayerController> _controllers = {};
  final Set<String> _playingVideos = {};
  List<String> _displayList = [];

  @override
  void initState() {
    super.initState();
    _initializeAllVideos();
  }

  @override
  void dispose() {
    for (var c in _controllers.values) {
      c.dispose();
    }
    _yt.close();
    super.dispose();
  }

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

      Future<void> _launchURL(String urlString) async {
      final Uri url = Uri.parse(urlString);
      if (!await launchUrl(url)) {
        throw 'Could not launch $url';
      }
    }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // ======= HERO IMAGE SECTION =======
          const ProjectPageLayout(
            imgPath: "assets/ijapa-smile-landscape-T1rLCFID.jpeg",
            aboutText: Text("We aim to captivate the younger minds into legendary folktales, learning their history before reaching oblivion; we envision a means of inculcating standard morals and wisdom to relate with one another in love and unity.",)),

          const SliverToBoxAdapter(child: SizedBox(height: 20)),

          // ======= HEADINGS =======
          const SliverCenter(
            sliver: MySliverToBoxHeadings(
              providedMainAxisAlignment: MainAxisAlignment.center,
              heading: "Green Cartoon Animations",
            ),
          ),

          TetfundAndAlumnodeRowLayout(
            imgPath: "assets/tetfund-icon.png", 
            middleText: "TETFUND",
            websiteUrl: (){
              _launchURL("https://tetfund.gov.ng/");
            },

            ),
          const SliverToBoxAdapter(child: SizedBox(height: 40)),
          const MyBlockQuoteWrapper(textInQuote: "GOAL"),

          const MySliverTextWidget(
            textString: Text("We aim to captivate the younger minds into legendary folktales, learning their history before reaching oblivion; we envision a means of inculcating standard morals and wisdom to relate with one another in love and unity.",)),

          const SliverToBoxAdapter(child: SizedBox(height: 20)),

          // ====== ANIMATIONS BLOCKQUOTE ======
          const MyBlockQuoteWrapper(textInQuote: "ANIMATIONS"),

          // ====== VIDEO LIST ======
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final videoId = _displayList[index];
                final meta = _videoMeta[videoId];
                final isPlaying = _playingVideos.contains(videoId);
                final controller = _getController(videoId);
                final thumbUrl = "https://img.youtube.com/vi/$videoId/0.jpg";

                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
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
                                  color: const Color.fromARGB(76, 0, 0, 0),
                                  borderRadius: BorderRadius.circular(12),
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
              childCount: _displayList.length,
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
