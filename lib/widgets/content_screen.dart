import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'like_icon_screen.dart';
import 'options_screen.dart';

class ContentScreen extends StatefulWidget {
  final String? src;

  const ContentScreen({Key? key, this.src}) : super(key: key);

  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  bool _liked = false;
  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  Future initializePlayer() async {
    _videoPlayerController = VideoPlayerController.network(widget.src!);
    await Future.wait([_videoPlayerController.initialize()]);
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      showControls: false,
      looping: true,
    );
    setState(() {});
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        _chewieController != null &&
            _chewieController!.videoPlayerController.value.isInitialized
            ? GestureDetector(
                 onTap: () {
                  if (_chewieController != null &&
                      _chewieController!.videoPlayerController != null &&
                      _chewieController!
                          .videoPlayerController!.value.isInitialized) {
                    if (_chewieController!
                        .videoPlayerController!.value.isPlaying) {
                      _chewieController!.videoPlayerController!.pause();
                    } else {
                      _chewieController!.videoPlayerController!.play();
                    }
                  }
                  Center(
                      child: AnimatedOpacity(
                      opacity: _chewieController!.videoPlayerController!.value.isPlaying ? 0.0 : 1.0,
                      duration: Duration(milliseconds: 300),
                   child: Icon(
                   Icons.play_arrow_rounded,
                   size: 56,
                   color: Colors.white,
                   ),
                   ),
                  );
                },
          onDoubleTap: () {
            setState(() {
              _liked = !_liked;
            });
          },
          child: Chewie(
            controller: _chewieController!,
          ),
        )
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(),
            SizedBox(height: 10),
            Text('Loading...')
          ],
        ),
        if (_liked)
          Center(
            child: LikeIcon(),
          ),
        OptionsScreen()
      ],
    );
  }
}