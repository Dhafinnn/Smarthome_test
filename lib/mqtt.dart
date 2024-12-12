import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:provider/provider.dart';
import 'package:smarthome/providers/lampu_provider.dart';

final client = MqttServerClient(
    '2e51f35445d7476b8552cdfb74edc1d6.s1.eu.hivemq.cloud',
    'flutter_client_1231231');
var pongCount = 0;

Future<void> jalankanMqtt(BuildContext context) async {
  client.logging(on: true);

  client.keepAlivePeriod = 20;

  client.connectTimeoutPeriod = 2000; // milliseconds

  client.onDisconnected = onDisconnected;

  client.onConnected = onConnected;

  client.onSubscribed = onSubscribed;

  client.port = 8883;
  client.logging(on: true);
  client.setProtocolV311();
  client.keepAlivePeriod = 20;
  client.secure = true;
  client.onBadCertificate = (dynamic cert) => true;
  client.connectionMessage = MqttConnectMessage()
      .withClientIdentifier('flutter_client_fvffrtv')
      .withWillTopic("hematech/led_control")
      .withWillMessage('Disconnected')
      .startClean()
      .withWillQos(MqttQos.atLeastOnce)
      .authenticateAs('house_', 'Trymqtt2');

  try {
    await client.connect();
  } on NoConnectionException catch (_) {
    client.disconnect();
  } on SocketException catch (_) {
    client.disconnect();
  }

  if (client.connectionStatus!.state == MqttConnectionState.connected) {
  } else {
    client.disconnect();
    exit(-1);
  }

  const topic = "hematech/data"; // Not a wildcard topic
  client.subscribe(topic, MqttQos.atMostOnce);

  client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
    final recMess = c![0].payload as MqttPublishMessage;
    String p =
        MqttPublishPayload.bytesToStringAsString(recMess.payload.message);

    //     List x = p.split("-");
    // if (p.length == 5) {
    //   // Memeriksa setiap digit dan mengontrol lampu berdasarkan nilai digit
    //   if (x[0][0] == '1') {
    //     print('Menghidupkan Lampu 1');
    //     context.read<LampuProvider>().statusLampu1(true); // Hidupkan lampu 1
    //   }
    //   if (x[0][0] == '0') {
    //     print('Mematikan Lampu 1');
    //     context.read<LampuProvider>().statusLampu1(false); // Matikan lampu 1
    //   }
    //   if (x[0][1] == '1') {
    //     print('Menghidupkan Lampu 1');
    //     context.read<LampuProvider>().statusLampu2(true); // Hidupkan lampu 1
    //   }
    //   if (x[0][1] == '0') {
    //     print('Mematikan Lampu 1');
    //     context.read<LampuProvider>().statusLampu2(false); // Matikan lampu 1
    //   }
    //   if (x[0][2] == '1') {
    //     print('Menghidupkan Lampu 1');
    //     context.read<LampuProvider>().statusLampu3(true); // Hidupkan lampu 1
    //   }
    //   if (x[0][2] == '0') {
    //     print('Mematikan Lampu 1');
    //     context.read<LampuProvider>().statusLampu3(false); // Matikan lampu 1
    //   }
    //   if (x[0][3] == '1') {
    //     print('Menghidupkan Lampu 1');
    //     context.read<LampuProvider>().statusLampu4(true); // Hidupkan lampu 1
    //   }
    //   if (x[0][3] == '0') {
    //     print('Mematikan Lampu 1');
    //     context.read<LampuProvider>().statusLampu4(false); // Matikan lampu 1
    //   }
    //   if (x[0][4] == '1') {
    //     print('Menghidupkan Lampu 1');
    //     context.read<LampuProvider>().statusfan(true); // Hidupkan lampu 1
    //   }

    //   if (x[0][4] == '0') {
    //     print('Mematikan Lampu 1');
    //     context.read<LampuProvider>().statusfan(false); // Matikan lampu 1
    //   }
    //   context.read<LampuProvider>().setsuhu(double.parse(x[1]));
    //   context.read<LampuProvider>().sethumidity(int.parse(x[2]));
    //   context.read<LampuProvider>().statusDoor(x[3]);
    // }

    print(p);
    context.read<LampuProvider>().refreshStatus(p);
  });
}

kirimPesan(String pesan) {
  const pubTopic = "hematech/led_control";
  final builder = MqttClientPayloadBuilder();
  builder.addString(pesan);
  client.subscribe(pubTopic, MqttQos.exactlyOnce);
  client.publishMessage(pubTopic, MqttQos.exactlyOnce, builder.payload!);
}

infoState() {
  const pubTopic = "hematech/info";
  final builder = MqttClientPayloadBuilder();
  builder.addString("info");
  client.subscribe(pubTopic, MqttQos.exactlyOnce);
  client.publishMessage(pubTopic, MqttQos.exactlyOnce, builder.payload!);
}

void onSubscribed(String topic) {
  print('EXAMPLE::Subscription confirmed for topic $topic');
}

void onDisconnected() {
  print('EXAMPLE::OnDisconnected client callback - Client disconnection');
  if (client.connectionStatus!.disconnectionOrigin ==
      MqttDisconnectionOrigin.solicited) {
    print('EXAMPLE::OnDisconnected callback is solicited, this is correct');
  } else {
    print(
        'EXAMPLE::OnDisconnected callback is unsolicited or none, this is incorrect - exiting');
    exit(-1);
  }
  if (pongCount == 3) {
    print('EXAMPLE:: Pong count is correct');
  } else {
    print('EXAMPLE:: Pong count is incorrect, expected 3. actual $pongCount');
  }
}

void onConnected() {
  print(
      'EXAMPLE::OnConnected client callback - Client connection was successful');
}
