import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Notifications", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: 5,
        separatorBuilder: (_, __) => const Divider(color: Colors.white24),
        itemBuilder: (context, index) => ListTile(
          title: Text(
            'Notification ${index + 1}',
            style: const TextStyle(color: Colors.white),
          ),
          subtitle: const Text(
            'This is a notification detail',
            style: TextStyle(color: Colors.white70),
          ),
          leading: const Icon(Icons.notifications, color: Colors.white),
        ),
      ),
    );
  }
}
