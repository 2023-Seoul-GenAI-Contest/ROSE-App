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
  String _category = "default"; // or data
  String _level = "basic"; // or advanced
  Color _categoryDigitalButtonColor = fromHex('#040C56');
  Color _categoryDigitalButtonTextColor = fromHex(GrayScale.White);

  void setBtnState(String category, String level) {
    setState(() {
      _category = category;
      _level = level;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 30,
        ),
        Container(
            height: 160,
            width: MediaQuery.of(context).size.width - 30,
            decoration: BoxDecoration(
              color: fromHex('#FFFFFF'),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Container(
                      height: 10,
                    ),
                    Image.asset(
                      'assets/img/stand.png',
                      fit: BoxFit.cover,
                      height: 110,
                    ),
                    Text(
                      "강의 추천",
                      style: TextStyle(
                        fontFamily: "medium",
                        fontSize: 26,
                        color: fromHex(GrayScale.Black),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 15,
                ),
                Column(
                  children: [
                    Container(
                      height: 15,
                    ),
                    Container(
                      height: 15,
                    ),
                  ],
                ),
                Container(
                  height: 30,
                ),
              ],
            )),
        Container(height: 20),
        Container(
            height: 350,
            width: MediaQuery.of(context).size.width - 30,
            decoration: BoxDecoration(
              color: fromHex('#FFFFFF'),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 10,
                ),
                Text(
                  "1. 학습하고 싶은 분야를 선택해주세요.",
                  style: TextStyle(
                    fontFamily: "medium",
                    fontSize: 16,
                    color: fromHex(GrayScale.Black),
                  ),
                ),
                Container(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width - 260,
                        decoration: BoxDecoration(
                          color: _categoryDigitalButtonColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                _category = "data";
                                _categoryDigitalButtonColor =
                                    fromHex('#040C56');
                                _categoryDigitalButtonTextColor =
                                    fromHex(GrayScale.White);
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "데이터 역량",
                                  style: TextStyle(
                                    fontFamily: "medium",
                                    fontSize: 16,
                                    color: _categoryDigitalButtonTextColor,
                                  ),
                                ),
                              ],
                            ))),
                    Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width - 260,
                        decoration: BoxDecoration(
                          color: _categoryDigitalButtonColor,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                _category = "digital";
                                _categoryDigitalButtonColor =
                                    fromHex('#040C56');
                                _categoryDigitalButtonTextColor =
                                    fromHex(GrayScale.White);
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "디지털 역량",
                                  style: TextStyle(
                                    fontFamily: "medium",
                                    fontSize: 16,
                                    color: _categoryDigitalButtonTextColor,
                                  ),
                                ),
                              ],
                            ))),
                  ],
                ),
                Container(
                  height: 30,
                ),
              ],
            )),
      ],
    );
  }
}
