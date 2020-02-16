import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_midi/flutter_midi.dart';
import 'package:tonic/tonic.dart';
import '../common/eventBus.dart';

class MusicKeyboard extends StatefulWidget {
  MusicKeyboard({Key key}) : super(key: key);

  @override
  _MusicKeyboardState createState() => _MusicKeyboardState();
}

class _MusicKeyboardState extends State<MusicKeyboard> {
 @override
  void initState() {
    load('assets/sounds/Piano.SF2');
    super.initState();
  }
  
 void load(String asset) async {
    FlutterMidi.unmute(); // Optionally Unmute
    ByteData _byte = await rootBundle.load(asset);
    FlutterMidi.prepare(sf2: _byte);
  }

  void firedMidi(midi){
    eventBus.fire(new MidiEvent(midi));
  }

  double get keyWidth => 80 + (80 * _widthRatio);
  double _widthRatio = 0.0;
  bool _showLabels = true;

  @override
  Widget build(context) {
    return Container(
      child: ListView.builder(
            itemCount: 7,
            controller: ScrollController(initialScrollOffset: 1500),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final int i = index * 12;
              return SafeArea(
                child: Stack(children: <Widget>[
                  Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
                    _buildKey(24 + i, false),
                    _buildKey(26 + i, false),
                    _buildKey(28 + i, false),
                    _buildKey(29 + i, false),
                    _buildKey(31 + i, false),
                    _buildKey(33 + i, false),
                    _buildKey(35 + i, false),
                  ]),
                  Positioned(
                      left: 0,
                      right: 0,
                      bottom: 84,
                      top: 0,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(width: keyWidth / 2),
                            _buildKey(25 + i, true),
                            _buildKey(27 + i, true),
                            Container(width: keyWidth),
                            _buildKey(30 + i, true),
                            _buildKey(32 + i, true),
                            _buildKey(34 + i, true),
                            Container(width: keyWidth / 2),
                          ])),
                ]),
              );
            },
          )
          );
  }

  Widget _buildKey(int midi, bool accidental) {
    final pitchName = Pitch.fromMidiNumber(midi).toString();
    final pianoKey = Stack(
      children: <Widget>[
        Semantics(
            button: true,
            hint: pitchName,
            child: Material(
                borderRadius: borderRadius,
                color: accidental ? Colors.black : Colors.white,
                child: InkWell(
                  borderRadius: borderRadius,
                  highlightColor: Colors.grey,
                  onTap: () {
                    firedMidi(midi);
                  },
                  onTapDown: (_) => FlutterMidi.playMidiNote(midi: midi),
                ))),
        Positioned(
            left: 0,
            right: 0,
            bottom: 20,
            child: _showLabels
                ? Text(pitchName,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: !accidental ? Colors.black : Colors.white))
                : Container()),
      ],
    );
    if (accidental) {
      return Container(
          width: keyWidth,
          margin: EdgeInsets.symmetric(horizontal: 2),
          padding: EdgeInsets.symmetric(horizontal: keyWidth * .1),
          child: Material(
              elevation: 6,
              borderRadius: borderRadius,
              shadowColor: Color(0x802196F3),
              child: pianoKey));
    }
    return Container(
        width: keyWidth,
        child: pianoKey,
        margin: EdgeInsets.symmetric(horizontal: 2));
  }
}

const BorderRadiusGeometry borderRadius = BorderRadius.only(
    bottomLeft: Radius.circular(9), bottomRight: Radius.circular(9));