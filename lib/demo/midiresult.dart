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
  String data='player1';
  String data2 ='player2';
  void initState() {
    eventBus.on<MidiEvent>().listen((MidiEvent data){
      // String val = Pitch.fromMidiNumber(data.midi).toString();
      /// 传递note值，然后渲染时解析成对应的字符
      String note = data.midi.toString();
      Mqtt.getInstance().publish(note);
      player1(note);
      Mqtt.getInstance().listen((val)=>player2(val));
    }
  );
  // Mqtt.getInstance().listen((val){
  //   print(val);
  // });
}

void player1(String val) {
  num note = int.parse(val);
  setState(() {
    data= "player1:"+Pitch.fromMidiNumber(note).toString();
  });
}

void player2(String val){
  num note = int.parse(val);

  setState(() {
    data2 = "player2:"+Pitch.fromMidiNumber(note).toString();
  });
}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
            Container(
              width: 100,
              child: Text('$data'),
            ),
            Container(
              width: 100,
              child:Text('$data2'),
            )
        ],
      ),
    );
  }
}