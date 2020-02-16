import 'package:flutter/material.dart';
import 'package:flutter_learn/demo/midiresult.dart';
import 'package:flutter_learn/demo/music_keyboard.dart';
import 'package:fijkplayer/fijkplayer.dart';

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
        "http://q5n3oqalb.bkt.clouddn.com/cde.mp4",
        // "http://q5n3oqalb.bkt.clouddn.com/mi.mp4",
        autoPlay: true);
  }

  @override
  void dispose() {
    super.dispose();
    player.release();
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