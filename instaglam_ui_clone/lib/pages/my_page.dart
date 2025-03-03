import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  static final imageBgColors = [
    Colors.grey[50],
    Colors.grey[100],
    Colors.grey[200],
    Colors.grey[100],
    Colors.grey[50],
    Colors.grey[100],
    Colors.grey[200],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('マイページ')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  FaIcon(
                    FontAwesomeIcons.instagram,
                    size: 60,
                    color: Colors.purple,
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Text(
                        "7,041",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text("投稿"),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Column(
                    children: [
                      Text(
                        "4.6億",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text("フォロワー"),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Column(
                    children: [
                      Text(
                        "99",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text("フォロー"),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16, bottom: 16, left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Instagram",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text("#YoursToMake", style: TextStyle(color: Colors.blue)),
                  Text(
                    "www.facebook.com/emotional_objects",
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16, bottom: 16, left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          child: const Text('フォロー中'),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {},
                          child: const Text('メッセージ'),
                        ),
                      ),
                      const SizedBox(width: 8),
                      OutlinedButton(
                        onPressed: () {},
                        child: const Icon(Icons.keyboard_arrow_down),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              children:
                  imageBgColors.map((bgColor) {
                    return InstagramPostItem(bgColor: bgColor!);
                  }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class InstagramPostItem extends StatelessWidget {
  const InstagramPostItem({super.key, required this.bgColor});

  final Color bgColor;

  @override
  Widget build(BuildContext context) {
    return Container(color: bgColor, child: const Icon(Icons.image, size: 100));
  }
}
