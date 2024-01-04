import 'package:flutter/material.dart';
import 'package:movie_bloc/pages/home.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class Video extends StatefulWidget {
  final String trailer;
  final VideoPlayerController videoPlayerController;
  final bool loop;

  Video(
      {required this.videoPlayerController,
      this.loop = false,
      required this.trailer,
      Key? key})
      : super(key: key);

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    _chewieController = ChewieController(
      videoPlayerController: widget.videoPlayerController,
      looping: widget.loop,
      aspectRatio: 16 / 9,
      autoInitialize: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Chewie(
      controller: _chewieController,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _chewieController.dispose();
  }
}

class Videoplayer extends StatefulWidget {
  final String videoData;

  Videoplayer({required this.videoData});

  @override
  State<Videoplayer> createState() => _VideoplayerState();
}

class _VideoplayerState extends State<Videoplayer> {
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network(widget.videoData);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back),
          )
        ],
      ),
      body: Video(
        videoPlayerController: _videoPlayerController,
        trailer: widget.videoData,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }
}
