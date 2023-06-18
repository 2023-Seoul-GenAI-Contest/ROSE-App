import 'package:flutter/material.dart';
import 'package:rose/models/color.dart';
import 'package:rose/utilities/utility.dart';

class ChatText extends StatefulWidget {
  const ChatText({Key? key, required this.changeIndex}) : super(key: key);
  final Function changeIndex;
  @override
  _ChatTextState createState() => _ChatTextState();
}

class _ChatTextState extends State<ChatText> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
