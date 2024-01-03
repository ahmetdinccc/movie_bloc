import 'package:flutter/material.dart';
import 'package:movie_bloc/pages/home.dart';
import 'package:video_player/video_player.dart';

class Video extends StatefulWidget {
  const Video({
    Key? key,
    required this.trailer,
  }) : super(key: key);

  final String trailer;

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  //late ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    //_chewieController = ChewieController(
    //   videoPlayerController: VideoPlayerController.network(widget.trailer),
    //   aspectRatio: 16 / 9,
    //   autoInitialize: true,
    //   looping: false, // You can set looping as per your requirement
    // );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
        backgroundColor: Colors.red,
         actions:[IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));}, icon: Icon(Icons.arrow_back))]
      ),
     
      ),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  final String videoData;

  VideoPlayerScreen({required this.videoData});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player'),
      ),
      body: Video(trailer: widget.videoData),
    );
  }
}
