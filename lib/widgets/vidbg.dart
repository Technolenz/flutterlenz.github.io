import 'dart:ui'; // for ImageFilter
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class BlurredVideoBackground extends StatefulWidget {
  final String videoAsset; // or you can use a network URL

  const BlurredVideoBackground({super.key, required this.videoAsset});

  @override
  _BlurredVideoBackgroundState createState() => _BlurredVideoBackgroundState();
}

class _BlurredVideoBackgroundState extends State<BlurredVideoBackground> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(widget.videoAsset)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(true);
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? Stack(
      fit: StackFit.expand,
      children: [
        FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller)
            )
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          child: Container(
            color: Colors.black.withValues(alpha: 0),
          ),
        ),
      ],
    )
        : Container(
      color: Colors.black,
    );
  }
}