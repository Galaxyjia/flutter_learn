import 'package:flutter/material.dart';
import 'package:flutter_learn/demo/midiresult.dart';
import 'package:flutter_learn/demo/music_keyboard.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_learn/demo/network_mqtt.dart';


class FightGame extends StatefulWidget {
  FightGame({Key key}) : super(key: key);

  @override
  _FightGameState createState() => _FightGameState();
}

class _FightGameState extends State<FightGame> {
  VideoPlayerController _controller;

   final String videoUrl =
     "http://q5n3oqalb.bkt.clouddn.com/cde.mp4";

  @override
  void initState() {
    _controller =
        VideoPlayerController.network(videoUrl)
          ..initialize().then((_) {
            setState(() {
              _controller.play();
            });
          });

    // Use the controller to loop the video.
    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  _connect(){
    // Mqtt.getInstance().connect();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home:Scaffold(
        body:Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              Container(
                height: 200,
                child: _controller.value.initialized
                    ? AspectRatio(
                        aspectRatio: _controller.value.aspectRatio,
                        child: VideoPlayer(_controller),
                      )
                    : CircularProgressIndicator(),
              ),
              Container(
                child: MidiResult(),
              ),
              Container(
                height: 200,
                child: MusicKeyboard(),
              ),
            ],
          ),
        )
        )      
      ); 
  }
}