import 'package:flutter/material.dart';
import 'package:flutter_learn/demo/music_keyboard.dart';
import 'package:auto_orientation/auto_orientation.dart';

class PitchGame extends StatefulWidget {
  PitchGame({Key key}) : super(key: key);

  @override
  _PitchGameState createState() => _PitchGameState();
}

class _PitchGameState extends State<PitchGame> {
  @override
  void initState() {
    super.initState();
    AutoOrientation.landscapeRightMode();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home:Scaffold(
        body:Container(
          height: 200,
          child: MusicKeyboard(),
        ),
        drawer: Text('haha'),
      )
    );   
  }
}