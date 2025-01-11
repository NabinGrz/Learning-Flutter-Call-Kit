import 'package:flutter/material.dart';
import 'package:flutter_callkit_incoming/entities/call_kit_params.dart';
import 'package:flutter_callkit_incoming/entities/entities.dart';
import 'package:flutter_callkit_incoming/flutter_callkit_incoming.dart';
import 'package:learning_call_kit/pip_view_screen.dart';
import 'package:uuid/uuid.dart';
import 'package:uuid/v4.dart';

import 'call_kit_utils.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  CallKitUtils.setUpCallKitEventListeners();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton.icon(
              onPressed: () async {
                //!! Set status call connected (only for iOS - used to determine Incoming Call or Outgoing Call status in phone book)
                await CallKitUtils.setCallConnected();
                //!! After the call is ACCEPT or startCall please call this func. normally it should be called when webrtc/p2p.... is established.
              },
              label: const Text("Outgoing Call"),
            ),
            ElevatedButton.icon(
              onPressed: () async {
                await CallKitUtils.incomingCall(0, "voiceChat");
              },
              label: const Text("Audio Call"),
            ),
            ElevatedButton.icon(
              onPressed: () async {
                await CallKitUtils.incomingCall(1, "videoChat");
              },
              label: const Text("Video Call"),
            ),
            ElevatedButton.icon(
              onPressed: () async {},
              label: const Text("Missed Call IOS"),
            ),
            ElevatedButton.icon(
              onPressed: () {
                // PIPView.of(context)?.presentBelow(const PipViewScreen());
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PipViewScreen()));
              },
              label: const Text("Navigate"),
            ),
          ],
        ),
      ),
    );
  }
}
