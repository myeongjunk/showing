import 'package:flutter/material.dart';
import 'package:showwing/theme/font.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
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
                    )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 29),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 18),
                        SizedBox(
                          height: 28,
                          width: 94,
                          child: Text(
                            'Hwamini',
                            style: Lora_Title_Large(),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: 71,
                          height: 20,
                          child: Text(
                            '@ hwa.min',
                            style: Lora_Label_Large(),
                          ),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          width: double.infinity,
                          height: 20,
                          child: Text(
                            '햇빛에서 사진 찍는 것을 좋아해요.',
                            style: Noto_Body2_Large(),
                          ),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          width: double.infinity,
                          height: 20,
                          child: Text(
                            'I like to be taken photo in sunlight.',
                            style: Noto_Body2_Large(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 58,
                  ),
                  SizedBox(
                    height: 390,
                    width: double.infinity,
                    child: Container(
                        child: Image.asset(
                      'assets/images/ming.png',
                    )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 29),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 18),
                        SizedBox(
                          height: 28,
                          width: double.infinity,
                          child: Text(
                            'Treeming Bird',
                            style: Lora_Title_Large(),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 20,
                          child: Text(
                            '@ tmb_ming',
                            style: Lora_Label_Large(),
                          ),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          height: 20,
                          child: Text(
                            '어두운 감성으로 저만의 색깔을 표현해요.',
                            style: Noto_Body2_Large(),
                          ),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          height: 20,
                          child: Text(
                            '자연과 함께 사진을 많이 찍었어요.',
                            style: Noto_Body2_Large(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 58,
                  ),
                  SizedBox(
                    height: 390,
                    width: double.infinity,
                    child: Container(
                        child: Image.asset(
                      'assets/images/okio.png',
                    )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 29),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 18),
                        SizedBox(
                          height: 28,
                          child: Text(
                            'Kyong',
                            style: Lora_Title_Large(),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 20,
                          child: Text(
                            '@ 0ki0h',
                            style: Lora_Label_Large(),
                          ),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          height: 20,
                          child: Text(
                            '카페 가는 것을 좋아해요.',
                            style: Noto_Body2_Large(),
                          ),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          height: 20,
                          child: Text(
                            '주로 우드한 인테리어 카페를 많이 가는 것 같아요',
                            style: Noto_Body2_Large(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 58,
                  ),
                  SizedBox(
                    height: 390,
                    width: double.infinity,
                    child: Container(
                        child: Image.asset(
                      'assets/images/sullendin.png',
                    )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 29),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 18),
                        SizedBox(
                          height: 28,
                          child: Text(
                            'Catgirl',
                            style: Lora_Title_Large(),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 20,
                          child: Text(
                            '@ sullendin',
                            style: Lora_Label_Large(),
                          ),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          height: 20,
                          child: Text(
                            '스타일링 하는 것이 재밌어요.',
                            style: Noto_Body2_Large(),
                          ),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          height: 20,
                          child: Text(
                            '다양한 포즈를 취하고 저만의 느낌을 주로 표현해요.',
                            style: Noto_Body2_Large(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 58,
                  ),
                  SizedBox(
                    height: 390,
                    width: double.infinity,
                    child: Container(
                        child: Image.asset(
                      'assets/images/boy.png',
                    )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 29),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 18),
                        SizedBox(
                          height: 28,
                          child: Text(
                            'Dajung',
                            style: Lora_Title_Large(),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 20,
                          child: Text(
                            '@ awanderingboy',
                            style: Lora_Label_Large(),
                          ),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          height: 20,
                          child: Text(
                            '쇼핑몰 운영하면서 여러 포즈와 보정을 많이 경험했어요.',
                            style: Noto_Body2_Large(),
                          ),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          height: 20,
                          child: Text(
                            '스타일링에 따른 보정 분위기도 저의 색으로 나타냈어요.',
                            style: Noto_Body2_Large(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: ,
    );
  }
}
