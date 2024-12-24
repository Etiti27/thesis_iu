import 'package:connectivity_plus/connectivity_plus.dart';

Future<String> getNetworkType() async {
  final connectivityResult = await Connectivity().checkConnectivity();
  if (connectivityResult == ConnectivityResult.mobile) {
    return "Mobile Data (4G/5G)";
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return "Wi-Fi";
  }
  return "Unknown";
}
