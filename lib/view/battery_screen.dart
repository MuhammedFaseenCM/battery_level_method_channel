import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BatteryScreen extends StatefulWidget {
  const BatteryScreen({super.key});

  static const batteryChannel = MethodChannel('muhammedfaseencm/battery');

  @override
  State<BatteryScreen> createState() => _BatteryScreenState();
}

class _BatteryScreenState extends State<BatteryScreen> {
  dynamic batteryLevel = "Loading";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Battery Level"),
        centerTitle: true,
        backgroundColor: Colors.lightGreenAccent,
        elevation: 5,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              batteryLevel,
              style:
                  const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
                onPressed: () {
                  getBatteryLevel();
                },
                child: const Text("Battery level"))
          ],
        ),
      ),
    );
  }

  Future getBatteryLevel() async {
    final newBatteryLevel =
        await BatteryScreen.batteryChannel.invokeMethod('getBatteryLevel');

    setState(() {
      batteryLevel = "$newBatteryLevel %";
    });
  }
}
