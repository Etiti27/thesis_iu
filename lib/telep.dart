import 'package:flutter/material.dart';
import 'package:thesis100/brain.dart';

class NetworkTypeScreen extends StatefulWidget {
  @override
  _NetworkTypeScreenState createState() => _NetworkTypeScreenState();
}

class _NetworkTypeScreenState extends State<NetworkTypeScreen> {
  @override
  void initState() {
    super.initState();
    _setNetworkType();
  }

  String _networkType = "";
  Future<void> _setNetworkType() async {
    Brain brain = Brain();
    await brain.setNetworkType();
    _networkType = brain.getNetworkType();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Network Type Checker",
          style: TextStyle(color: Colors.white),
        ),
        leading: const CircleAvatar(
          backgroundImage: AssetImage("assets/logo.jpg"),
        ),
        backgroundColor: Colors.indigo,
        elevation: 10,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            fit: FlexFit.loose,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Network Type:",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  _networkType,
                  style: const TextStyle(
                      color: Colors.red,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _setNetworkType,
                  child: Text("Refresh"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
