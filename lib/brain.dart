import 'dart:async';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class Brain {
  static const platform = MethodChannel('com.example.thesis100/network');
  String _networkType = "Unknown";

  Future<double> measureDownloadSpeed(String url) async {
    try {
      final stopwatch = Stopwatch()..start();
      final response = await http.get(Uri.parse(url));
      stopwatch.stop();

      if (response.statusCode == 200) {
        final fileSize = response.contentLength ?? 0; // File size in bytes
        final timeTaken =
            stopwatch.elapsedMilliseconds / 1000; // Time in seconds
        final speedMbps =
            (fileSize / (1024 * 1024)) / timeTaken * 8; // Speed in Mbps
        return speedMbps;
      } else {
        throw Exception("Failed to download file");
      }
    } catch (e) {
      print("Error: $e");
      return 0.0;
    }
  }

  Future<void> setNetworkType() async {
    try {
      _networkType = await platform.invokeMethod('getNetworkType');
    } catch (e) {
      _networkType = "Failed to get network type: $e";
    }
  }

  String getNetworkType() {
    return _networkType;
  }
}
