import 'dart:math';

import 'package:flutter/material.dart';

import 'package:sheet_music/sheet_music.dart';

import 'package:flutter_learn/demo/notes.dart';

class MusicSheet extends StatefulWidget {
  MusicSheet({Key key}) : super(key: key);

  @override
  _MusicSheetState createState() => _MusicSheetState();
}

class _MusicSheetState extends State<MusicSheet> {
  String name, number, scale, pitch, timeSignature, source, notes, id;
  bool coda, chorus, trebleClef;
  int verses, count;

  void _activeChanged(){
    setState(() {
      pitch = pitchesTreble[Random().nextInt(pitchesTreble.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
       height: 300,
       child:GestureDetector(
                onTap: _activeChanged,
                child: SheetMusic(
                height: 160.0,
                width: 300.0,
                backgroundColor: Colors.white,
                trebleClef: true,
                scale: scale??'C Major',
                pitch: pitch??'C4',
                // pitchTap: _activeChanged,
                  ),
                ),
    );
  }
}