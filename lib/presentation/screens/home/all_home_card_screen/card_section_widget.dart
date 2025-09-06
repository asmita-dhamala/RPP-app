// lib/widgets/card_section_widget.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardSectionWidget<T> extends ConsumerWidget {
  // ignore: deprecated_member_use
  final AlwaysAliveProviderBase<AsyncValue<T>> contentProvider;
  final Widget Function(T data) itemBuilder;

  const CardSectionWidget({
    Key? key,
    required this.contentProvider,
    required this.itemBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(contentProvider);

    return asyncValue.when(
      data: itemBuilder,
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(child: Text('Error: $error')),
    );
  }
}
