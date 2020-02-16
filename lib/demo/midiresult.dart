import 'package:flutter/material.dart';
import '../common/eventBus.dart';
import 'package:tonic/tonic.dart';

class MidiResult extends StatefulWidget {
  MidiResult({Key key}) : super(key: key);

  @override
  _MidiResultState createState() => _MidiResultState();
}

class _MidiResultState extends State<MidiResult> {
  String data;

  void initState() {
  eventBus.on<MidiEvent>().listen((MidiEvent data) =>
    show(Pitch.fromMidiNumber(data.midi).toString())
  );
}

void show(String val) {
  setState(() {
    data= val;
  });
}

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Text('$data'),
    );
  }
}