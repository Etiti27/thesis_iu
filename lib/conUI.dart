import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectivityScreen extends StatefulWidget {
  @override
  _ConnectivityScreenState createState() => _ConnectivityScreenState();
}

class _ConnectivityScreenState extends State<ConnectivityScreen> {
  String _connectionStatus = 'Unknown';
  final Connectivity _connectivity = Connectivity();

  @override
  void initState() {
    super.initState();
    _connectivity.onConnectivityChanged
        .listen((List<ConnectivityResult> results) {
      // Process the list of connectivity results
      setState(() {
        if (results.contains(ConnectivityResult.mobile)) {
          _connectionStatus = 'Connected to Mobile Network';
        } else if (results.contains(ConnectivityResult.wifi)) {
          _connectionStatus = 'Connected to Wi-Fi';
        } else {
          _connectionStatus = 'No Internet Connection';
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Connectivity Example")),
      body: Center(
        child: Text(
          'Connection Status: $_connectionStatus',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
