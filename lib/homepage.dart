import 'package:flutter/material.dart';
import 'package:showwing/theme/font.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.photo_camera_outlined),
          onPressed: () {},
        ),
        title: Center(
          child: Text(
            'Main',
            style: Lora_Body_Large(),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.photo_outlined),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 390,
                    width: double.infinity,
                    child: Container(
                        child: Image.asset(
                      'assets/images/hwamin.png',
                      //fit: BoxFit.fill,
                    )),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 18),
                      Text(
                        'Hwamini',
                        style: Lora_Title_Large(),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '@ hwa.min',
                        style: Lora_Label_Large(),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        '나만의 일상을',
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
