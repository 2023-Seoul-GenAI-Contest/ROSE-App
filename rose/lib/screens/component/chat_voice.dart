import 'package:flutter/material.dart';
import 'package:rose/models/color.dart';
import 'package:rose/utilities/utility.dart';

class ChatVoice extends StatefulWidget {
  const ChatVoice({Key? key, required this.changeIndex}) : super(key: key);
  final Function changeIndex;
  @override
  _ChatVoiceState createState() => _ChatVoiceState();
}

class _ChatVoiceState extends State<ChatVoice> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
