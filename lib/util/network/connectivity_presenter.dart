import 'dart:async';

import 'package:flutter/foundation.dart';

class ConnectivityPresenter {
  bool _isNoNetworkPageDisplaying = false;
  bool _isTimerStarted = false;
  Timer? _timer;

  Duration? duration;

  ConnectivityPresenter({this.duration});

  ConnectivityPresenter.fromDelay(int delay) {
    duration = const Duration(milliseconds: 1000);
    if (delay > 1000) {
      duration = Duration(milliseconds: delay);
    }
  }

  void showConnectionStatus({bool isOnline = false, bool forced = false}) {
    if (forced) {
      _isNoNetworkPageDisplaying = false;
    }
    isOnline ? _hideNoInternetPage() : _showNoInternetPage();
  }

  void _hideNoInternetPage() {
    if (_isTimerStarted) {
      _timer?.cancel();
      _isTimerStarted = false;
    }
    if (_isNoNetworkPageDisplaying) {
      _isNoNetworkPageDisplaying = false;

      if (kIsWeb) {
      } else {}
    }
  }

  void _showNoInternetPage() {
    if (_isTimerStarted) return;
    _timer = Timer(duration ?? Duration.zero, () async {
      if (!_isNoNetworkPageDisplaying) {
        _isNoNetworkPageDisplaying = true;

        if (kIsWeb) {
        } else {}
      }
      _isTimerStarted = false;
    });
    _isTimerStarted = true;
  }
}
