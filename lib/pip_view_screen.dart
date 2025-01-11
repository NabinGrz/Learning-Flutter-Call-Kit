import 'package:fl_pip/fl_pip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PipViewScreen extends StatelessWidget {
  const PipViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Pip View"),
            CupertinoSwitch(
              value: true,
              onChanged: (value) {},
            ),
            ElevatedButton(
                onPressed: () async {
                  bool isAvailable = await FlPiP().isAvailable;
                  print(isAvailable);
                },
                child: const Text("Check Availables")),
            ElevatedButton.icon(
              onPressed: () async {
                bool val = await FlPiP().enable(
                  ios: const FlPiPiOSConfig(
                      // enabledWhenBackground: true,
                      // createNewEngine: true,
                      ),
                  android: const FlPiPAndroidConfig(
                    aspectRatio: Rational.vertical(),
                  ),
                );
                print(val);
              },
              label: const Text("Start Pip View"),
            ),
            ElevatedButton(
                onPressed: () async {
                  bool isAvailable = await FlPiP().disable();
                },
                child: const Text("Close")),
          ],
        ),
      ),
    );
  }
}
