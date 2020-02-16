import 'package:event_bus/event_bus.dart';

EventBus eventBus = new EventBus();

class MidiEvent {
  num midi;

  MidiEvent(this.midi);
}