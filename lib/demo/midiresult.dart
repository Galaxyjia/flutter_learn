import 'package:flutter/material.dart';
import '../common/eventBus.dart';
import 'package:tonic/tonic.dart';
import 'package:flutter_learn/demo/network_mqtt.dart';

class MidiResult extends StatefulWidget {
  MidiResult({Key key}) : super(key: key);

  @override
  _MidiResultState createState() => _MidiResultState();
}

class _MidiResultState extends State<MidiResult> {
  String data='';
  void initState() {
  eventBus.on<MidiEvent>().listen((MidiEvent data){
    String val = Pitch.fromMidiNumber(data.midi).toString();
    Mqtt.getInstance().publish(val);
    show(val);
  }
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