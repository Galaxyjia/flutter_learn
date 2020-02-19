
import 'dart:async';
import 'dart:io';
import 'package:mqtt_client/mqtt_client.dart';

final MqttClient client = MqttClient('180.76.169.237', '');

class Mqtt{
  static Mqtt _instance;

  Mqtt._(){
    start();
  }

  static Mqtt getInstance(){
    if(_instance == null){
      _instance = Mqtt._();
    }
    return _instance;
  }

  publish(String message){
      const String pubTopic = 'game/test';
      final MqttClientPayloadBuilder builder = MqttClientPayloadBuilder();
      builder.addString(message);
      // builder.addString('12');

      /// Subscribe to it
      print('EXAMPLE::Subscribing to the Dart/Mqtt_client/testtopic topic');
      client.subscribe(pubTopic, MqttQos.exactlyOnce);

      /// Publish it
      /// 发送消息
      print('EXAMPLE::Publishing our topic');
      client.publishMessage(pubTopic, MqttQos.exactlyOnce, builder.payload);
  }

  listen(callback(val)){
    /// Ok, lets try a subscription
    print('EXAMPLE::Subscribing to the test/lol topic');
    const String topic = 'game/test'; // Not a wildcard topic
    client.subscribe(topic, MqttQos.atMostOnce);

    client.updates.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final MqttPublishMessage recMess = c[0].payload;
      final String pt =
      MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      callback(pt);
      print(
          'EXAMPLE::Change notification:: topic is <${c[0].topic}>, payload is <-- $pt -->');
      print('');
    });
  }
}


Future<int> start() async {

  client.logging(on: false);

  client.keepAlivePeriod = 20;

  client.onDisconnected = onDisconnected;

  client.onConnected = onConnected;

  client.onSubscribed = onSubscribed;

  client.pongCallback = pong;

  final MqttConnectMessage connMess = MqttConnectMessage()
      .withClientIdentifier('Mqtt_MyClientUniqueId')
      .keepAliveFor(20) // Must agree with the keep alive set above or not set
      .withWillTopic('willtopic') // If you set this you must set a will message
      .withWillMessage('My Will message')
      .startClean() // Non persistent session for testing
      .withWillQos(MqttQos.atLeastOnce);
  print('EXAMPLE::Mosquitto client connecting....');
  client.connectionMessage = connMess;

  try {
    await client.connect();
  } on Exception catch (e) {
    print('EXAMPLE::client exception - $e');
    client.disconnect();
  }

  /// Check we are connected
  if (client.connectionStatus.state == MqttConnectionState.connected) {
    print('EXAMPLE::Mosquitto client connected');
  } else {
    /// Use status here rather than state if you also want the broker return code.
    print(
        'EXAMPLE::ERROR Mosquitto client connection failed - disconnecting, status is ${client.connectionStatus}');
    client.disconnect();
    exit(-1);
  }


  client.published.listen((MqttPublishMessage message) {
    print(
        'EXAMPLE::Published notification:: topic is ${message.variableHeader.topicName}, with Qos ${message.header.qos}');
  });

  /// Ok, we will now sleep a while, in this gap you will see ping request/response
  /// messages being exchanged by the keep alive mechanism.
  print('EXAMPLE::Sleeping....');
  await MqttUtilities.asyncSleep(120);

  /// Finally, unsubscribe and exit gracefully
  print('EXAMPLE::Unsubscribing');
//  client.unsubscribe(topic);

  /// Wait for the unsubscribe message from the broker if you wish.
  await MqttUtilities.asyncSleep(2);
  print('EXAMPLE::Disconnecting');
//  client.disconnect();
  return 0;
}

/// The subscribed callback
void onSubscribed(String topic) {
  print('EXAMPLE::Subscription confirmed for topic $topic');
}

/// The unsolicited disconnect callback
void onDisconnected() {
  print('EXAMPLE::OnDisconnected client callback - Client disconnection');
  if (client.connectionStatus.returnCode == MqttConnectReturnCode.solicited) {
    print('EXAMPLE::OnDisconnected callback is solicited, this is correct');
  }
  exit(-1);
}

/// The successful connect callback
void onConnected() {
  print(
      'EXAMPLE::OnConnected client callback - Client connection was sucessful');
}

/// Pong callback
void pong() {
  print('EXAMPLE::Ping response client callback invoked');
}