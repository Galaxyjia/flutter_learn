import 'package:flutter/material.dart';
import 'package:flutter_learn/demo/midiresult.dart';
import 'package:flutter_learn/demo/music_keyboard.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter_learn/demo/network_mqtt.dart';


class FightGame extends StatefulWidget {
  FightGame({Key key}) : super(key: key);

  @override
  _FightGameState createState() => _FightGameState();
}

class _FightGameState extends State<FightGame> {
  final FijkPlayer player = FijkPlayer();

  @override
  void initState() {
    super.initState();
    player.setDataSource(
        // "http://q5n3oqalb.bkt.clouddn.com/cde.mp4",
        // "http://q5n3oqalb.bkt.clouddn.com/mi.mp4",
        "http://q5n3oqalb.bkt.clouddn.com/%5B%E6%B8%85%E6%99%B0%20480P%5D%20%E5%8D%95%E5%A3%B0%E9%83%A8%E8%A7%86%E5%94%B1%E6%95%99%E7%A8%8B%EF%BC%88%E4%B8%8A%EF%BC%8931-43%E6%9D%A1%EF%BC%8C%E6%AF%8F%E6%9D%A1%E4%B9%8B%E5%89%8D%E9%83%BD%E6%9C%89%E6%A0%87%E5%87%86%E9%9F%B3%E7%BB%99%E5%87%BA%E7%9A%84%E5%9B%9B%E6%8B%8D%E5%9F%BA%E6%9C%AC%E6%8B%8D__P1_%E7%AC%AC31%E6%9D%A1.flv",
        autoPlay: true);
    _connect();
  }

  @override
  void dispose() {
    super.dispose();
    player.release();
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
                child: FijkView(player: player),
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