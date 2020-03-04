import 'package:flutter/material.dart';
import 'package:flutter_learn/demo/midiresult.dart';
import 'package:flutter_learn/demo/music_keyboard.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';
import 'package:flutter_learn/demo/network_mqtt.dart';


class FightGame extends StatefulWidget {
  FightGame({Key key}) : super(key: key);

  @override
  _FightGameState createState() => _FightGameState();
}

class _FightGameState extends State<FightGame> {
  // 声明视频控制器
  VideoPlayerController _controller;
  //
  final String videoUrl ="https://www.stwms.cn/assets/doremi.mp4"; ///"http://melody.app.h928.com/doremi.mp4";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = VideoPlayerController.network(videoUrl)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(true);
        // _controller.setVolume(0.0);
        Timer.periodic(Duration(seconds: 15), (Timer time) {
          print(time);
        });
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.pause();
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