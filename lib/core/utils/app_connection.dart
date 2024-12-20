import 'package:connectivity_plus/connectivity_plus.dart';

class AppConnection {
  static final Connectivity _connectivity = Connectivity();

  ///True if device is connected to [mobile] or [wifi] otherwise false
  static Future<bool> checkConnectionState() async {
    final connection = await _connectivity.checkConnectivity();
    if (!connection.contains(ConnectivityResult.none)) {
      return true;
    } else {
      return false;
    }
  }
}
