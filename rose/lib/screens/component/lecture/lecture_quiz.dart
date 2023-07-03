import 'package:flutter/material.dart';

class LectureQuiz extends StatefulWidget {
  const LectureQuiz({Key? key}) : super(key: key);

  @override
  _LectureQuizState createState() => _LectureQuizState();
}

class _LectureQuizState extends State<LectureQuiz> {
  final bearItem = {
  "list": [
    {"image": "assets/images/img_blue.png", "name": "파랑이"},
    {"image": "assets/images/img_mint.png", "name": "민트트"},
    {"image": "assets/images/img_skyblue.png", "name": "하늘이"},
    {"image": "assets/images/img_white.png", "name": "하양이"},
    {"image": "assets/images/img_pink.png", "name": "분홍이"},
    {"image": "assets/images/img_yellow.png", "name": "노랑이"},
    {"image": "assets/images/img_purple.png", "name": "보라라"},
    {"image": "assets/images/img_mix.png", "name": "믹스스"}
  ]
};
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
