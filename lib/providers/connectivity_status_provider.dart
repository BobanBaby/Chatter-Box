import 'dart:async';

import 'package:chatter_box/utils/enums.dart';
import 'package:connectivity/connectivity.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

class ConnectivityService {
  // Create our public controller
  StreamController<ConnectivityStatus> connectionStatusController =
      StreamController<ConnectivityStatus>();

  ConnectivityService() {
    // Subscribe to the connectivity Chanaged Steam
    Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      // Use Connectivity() here to gather more info if you need t
      connectionStatusController.add(await _getStatusFromResult());
    });
    init();
  }

  init() async {
    connectionStatusController.add(await _getStatusFromResult());
  }

  // Convert from the third part enum to our own enum
  Future<ConnectivityStatus> _getStatusFromResult() async {
    if (await DataConnectionChecker().hasConnection) {
      // Mobile data detected & internet connection confirmed.
      return ConnectivityStatus.Online;
    } else {
      // Mobile data detected but no internet connection found.
      return ConnectivityStatus.Offline;
    }
  }
}
