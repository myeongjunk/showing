import 'package:flutter/material.dart';
import 'package:showwing/theme/font.dart';

class MingPage extends StatelessWidget {
  const MingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: Padding(
              padding: const EdgeInsets.only(left: 20.92),
              child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  }))),
    );
  }
}
