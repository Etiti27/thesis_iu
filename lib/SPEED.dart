import 'package:flutter/material.dart';

class SpeedTestScreen extends StatefulWidget {
  @override
  _SpeedTestScreenState createState() => _SpeedTestScreenState();
}

class _SpeedTestScreenState extends State<SpeedTestScreen> {
  String downloadSpeed4G = "Not Tested";
  String downloadSpeed5G = "Not Tested";

  final String testFileUrl =
      "https://speed.hetzner.de/10MB.bin"; // Replace with your test file URL

  Future<void> _testSpeed(String networkType) async {
    final speed = await measureDownloadSpeed(testFileUrl);
    setState(() {
      if (networkType == "4G") {
        downloadSpeed4G = "${speed.toStringAsFixed(2)} Mbps";
      } else if (networkType == "5G") {
        downloadSpeed5G = "${speed.toStringAsFixed(2)} Mbps";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("4G/5G Speed Test")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _testSpeed("4G"),
              child: Text("Test 4G Speed"),
            ),
            Text("4G Download Speed: $downloadSpeed4G"),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _testSpeed("5G"),
              child: Text("Test 5G Speed"),
            ),
            Text("5G Download Speed: $downloadSpeed5G"),
          ],
        ),
      ),
    );
  }
}
