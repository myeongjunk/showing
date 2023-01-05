import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:showwing/theme/font.dart';

class DisplayAndSaveImagePage extends StatefulWidget {
  const DisplayAndSaveImagePage({super.key, required this.imagePath});
  final String imagePath;

  DisplayAndSaveImagePageState createState() =>
      DisplayAndSaveImagePageState(imagePath: this.imagePath);
}

class DisplayAndSaveImagePageState extends State<DisplayAndSaveImagePage> {
  DisplayAndSaveImagePageState({
    Key? key,
    required this.imagePath,
  });

  final String imagePath;
  final String albumName = 'Media';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text(
            '',
            style: Lora_Body_Large(),
          ),
        ),
        actions: [
          // Camera Front-Rear Controller
          IconButton(
            onPressed: () {
              GallerySaver.saveImage(imagePath, albumName: albumName)
                  .then((value) => print('>>>> save value= $value'))
                  .catchError((err) {
                print('error :( $err');
              });
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
    );
  }
}
