// lib/providers/network_providers.dart
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';

class NetworkStatusNotifier extends StateNotifier<ConnectivityResult> {
  NetworkStatusNotifier() : super(ConnectivityResult.none) {
    _initConnectivity();
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen((result) {
      state = result.isNotEmpty ? result[0] : ConnectivityResult.none;
    });
  }

  late final StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  Future<void> _initConnectivity() async {
    try {
      final result = await Connectivity().checkConnectivity();
      state = result.isNotEmpty ? result[0] : ConnectivityResult.none;
    } catch (_) {
      state = ConnectivityResult.none;
    }
  }

  Future<void> manualCheckConnectivity() async {
    await _initConnectivity();
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }
}

final networkStatusProvider = StateNotifierProvider<NetworkStatusNotifier, ConnectivityResult>(
  (ref) => NetworkStatusNotifier(),
);

final isOnlineProvider = Provider<bool>((ref) {
  final status = ref.watch(networkStatusProvider);
  return status == ConnectivityResult.wifi ||
      status == ConnectivityResult.mobile ||
      status == ConnectivityResult.ethernet;
});
