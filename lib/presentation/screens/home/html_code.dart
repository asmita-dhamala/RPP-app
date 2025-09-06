// html_code.dart
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class HtmlCodeWidget extends StatelessWidget {
  final String htmlContent;

  const HtmlCodeWidget({Key? key, required this.htmlContent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: HtmlWidget(
        htmlContent,
        onTapUrl: (url) {
          print('Tapped URL: $url');
          return true; // allow url launch
        },
      ),
    );
  }
}
