import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'connectivity_presenter.dart';

enum ConnectionType { mobile, wifi, none, other }

extension ConnectionTypeString on ConnectionType {
  String get stringValue {
    switch (this) {
      case ConnectionType.mobile:
        return 'mobile';
      case ConnectionType.wifi:
        return 'wifi';
      case ConnectionType.none:
        return 'none';
      case ConnectionType.other:
        return 'other';
    }
  }
}

class ConnectivityManager with ChangeNotifier {
  final _connectivity = Connectivity();
  ConnectivityPresenter connectivityPresenter;
  StreamSubscription<ConnectivityResult>? _subscription;

  ConnectivityManager(this.connectivityPresenter);

  ConnectionType _connectionType = ConnectionType.none;

  ConnectionType get connectionType => _connectionType;

  bool _isOnline = true;

  bool get isOnline => _isOnline;

  Future<void> startMonitoring() async {
    await checkConnectivity();
    _subscription =
        _connectivity.onConnectivityChanged.listen(updateConnectionStatus);
  }

  Future<void> checkConnectivity() async {
    try {
      final status = await _connectivity.checkConnectivity();
      updateConnectionStatus(status);
    } on PlatformException catch (e) {
      // Log.d('Platform Exception: $e');
    }
  }

  Future<bool> isReachable() async {
    try {
      List<InternetAddress> result;
      result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {}

    return false;
  }

  Future<bool> checkInternet() async {
    try {
      // check if login/health is working in case of any network state change
      /*  final http.Response response = await http.get(
        headers: {
          'Accept': 'application/dns-json',
          'Cache-Control': 'no-store'
        },
      ).timeout(const Duration(seconds: 20));
*/ /*
      if (response.statusCode == 200) {
        return true;
      }*/
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<void> updateConnectionStatus(ConnectivityResult result) async {
    if (result == ConnectivityResult.mobile) {
      _connectionType = ConnectionType.mobile;
    } else if (result == ConnectivityResult.wifi) {
      _connectionType = ConnectionType.wifi;
    } else if (result == ConnectivityResult.none) {
      _connectionType = ConnectionType.none;
    } else {
      _connectionType = ConnectionType.other;
    }

    if (result == ConnectivityResult.none) {
      _isOnline = false;
    } else {
      if (kIsWeb) {
        _isOnline = await checkInternet();
      } else {
        _isOnline = await isReachable();
      }
    }

    connectivityPresenter.showConnectionStatus(isOnline: _isOnline);
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    _subscription?.cancel();
  }
}
