import 'package:flutter/material.dart';
import '../common/eventBus.dart';
import 'package:tonic/tonic.dart';

class ChildOne extends StatefulWidget {
  ChildOne({Key key}) : super(key: key);

  @override
  _ChildOneState createState() => _ChildOneState();
}

class _ChildOneState extends State<ChildOne> {
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