
import 'package:flutter/material.dart';
import 'package:raparva_app/data/models/info_center_model.dart';

class InfoCardNotice extends StatelessWidget {
  const InfoCardNotice({Key? key, required InfoCenterItem item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notice'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'This is the Notice Page',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
