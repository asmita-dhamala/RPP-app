// lib/widgets/network_status_widget.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:raparva_app/core/utils/no_internet_widget.dart';
import 'package:raparva_app/provider/network_provider.dart';


class NetworkStatusWidget extends ConsumerWidget {
  final Widget child;

  const NetworkStatusWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOnline = ref.watch(isOnlineProvider);

    return isOnline ? child : const NoInternetWidget();
  }
}
