import 'package:flutter/material.dart';
import 'package:movie_bloc/pages/home.dart';
import 'package:movie_bloc/pages/video_player.dart';

class MovieInfo extends StatefulWidget {
  const MovieInfo({
    super.key,
    required this.name,
    required this.avatar,
    required this.contents,
    required this.trailer,
  });

  final String name;
  final String avatar;
  final String contents;
  final String trailer;


  @override
  State<MovieInfo> createState() => _MovieInfoState();
}

class _MovieInfoState extends State<MovieInfo> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 25, 89, 132),
        appBar: AppBar(
          title: Text(
            widget.name,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          backgroundColor: Color.fromARGB(255, 25, 89, 132),
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: size.height,
                child: Stack(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 200),
                      height: 700,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40))),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, top: 200),
                        child: Center(
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Filmin Konusu",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                widget.contents,
                                style: TextStyle(fontSize: 18),
                              ),
                             Padding(
                               padding: const EdgeInsets.only(top: 15),
                               child: ElevatedButton(
                                 onPressed: () {
                                   Navigator.push(
                                     context,
                                     MaterialPageRoute(
                                       builder: (context) => Videoplayer(videoData: widget.trailer),
                                     ),
                                    
                                   );
                                 },
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                     Icon(Icons.play_arrow), 
                                     SizedBox(width: 10), 
                                     Text("Filmin Fragmanını İzle"),
                                   ],
                                 ),
                               ),
                             )

                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50, left: 120),
                      child: Expanded(
                          child: Image.network(
                        widget.avatar,
                        height: 250,
                      )),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
