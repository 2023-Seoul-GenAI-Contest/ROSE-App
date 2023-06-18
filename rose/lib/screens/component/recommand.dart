import 'package:flutter/material.dart';
import 'package:rose/models/color.dart';
import 'package:rose/utilities/utility.dart';

class Recommand extends StatefulWidget {
  const Recommand({Key? key, required this.changeIndex}) : super(key: key);
  final Function changeIndex;
  @override
  _RecommandState createState() => _RecommandState();
}

class _RecommandState extends State<Recommand> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("recommand"));
  }
}
