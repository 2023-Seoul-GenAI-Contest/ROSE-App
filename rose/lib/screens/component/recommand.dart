import 'package:flutter/material.dart';
import 'package:rose/models/color.dart';
import 'package:rose/screens/component/recommand_result.dart';
import 'package:rose/utilities/utility.dart';

class Recommand extends StatefulWidget {
  const Recommand({Key? key, required this.changeIndex}) : super(key: key);
  final Function changeIndex;
  @override
  _RecommandState createState() => _RecommandState();
}

class _RecommandState extends State<Recommand> {
  String _category = "default"; // or data
  String _showCategory = ""; // or data
  String _level = "basic"; // or advanced
  String _showLevel = ""; // or data
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
                      'assets/img/love.png',
                      fit: BoxFit.cover,
                      height: 110,
                    ),
                    Text(
                      "강의 추천",
                      style: TextStyle(
                        fontFamily: "medium",
                        fontSize: 20,
                        color: fromHex(GrayScale.Black),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 15,
                    ),
                    Text(
                      "월디가 강의 추천을 해줘요!",
                      style: TextStyle(
                        fontFamily: "medium",
                        fontSize: 14,
                        color: fromHex(GrayScale.Black),
                      ),
                    ),
                    Container(
                      height: 10,
                    ),
                    Text(
                      "아래의 학습하고 싶은 분야와",
                      style: TextStyle(
                        fontFamily: "medium",
                        fontSize: 10,
                        color: fromHex(GrayScale.Black),
                      ),
                    ),
                    Container(
                      height: 10,
                    ),
                    Text(
                      "역량 진단 결과를 선택해주세요",
                      style: TextStyle(
                        fontFamily: "medium",
                        fontSize: 10,
                        color: fromHex(GrayScale.Black),
                      ),
                    ),
                    Container(
                      height: 10,
                    ),
                    Text(
                      "아래 월디 얼굴을 눌러",
                      style: TextStyle(
                        fontFamily: "bold",
                        fontSize: 14,
                        color: fromHex(GrayScale.Black),
                      ),
                    ),
                    Container(
                      height: 10,
                    ),
                    Text(
                      "챗봇으로 물어봐도 추천해줘요!",
                      style: TextStyle(
                        fontFamily: "bold",
                        fontSize: 14,
                        color: fromHex(GrayScale.Black),
                      ),
                    )
                  ],
                ),
              ],
            )),
        Container(height: 20),
        Container(
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
                                _showCategory = "데이터 역량";
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
                                _showCategory = "디지털 역량";
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
                  height: 20,
                ),
                Text(
                  "선택한 분야 : " + _showCategory,
                  style: TextStyle(
                    fontFamily: "medium",
                    fontSize: 16,
                    color: fromHex(GrayScale.Black),
                  ),
                ),
                Container(
                  height: 30,
                ),
                Text(
                  "2. 관련 역량 진단 결과를 선택해주세요.",
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
                        width: MediaQuery.of(context).size.width - 300,
                        decoration: BoxDecoration(
                          color: Colors.red[900],
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
                                _level = "advanced";
                                _showLevel = "고급";
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "디지털 고급",
                                  style: TextStyle(
                                    fontFamily: "medium",
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ))),
                    Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width - 300,
                        decoration: BoxDecoration(
                          color: Colors.yellow[700],
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
                                _level = "intermediate";
                                _showLevel = "중급";
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "디지털 중급",
                                  style: TextStyle(
                                    fontFamily: "medium",
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ))),
                    Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width - 300,
                        decoration: BoxDecoration(
                          color: Colors.yellow,
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
                                _level = "basic";
                                _showLevel = "초급";
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "디지털 초급",
                                  style: TextStyle(
                                    fontFamily: "medium",
                                    fontSize: 14,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ))),
                  ],
                ),
                Container(
                  height: 20,
                ),
                Text(
                  "선택한 역량 진단 : " + _showLevel,
                  style: TextStyle(
                    fontFamily: "medium",
                    fontSize: 16,
                    color: fromHex(GrayScale.Black),
                  ),
                ),
                Container(
                  height: 20,
                ),
              ],
            )),
        Container(height: 20),
        Container(
            height: 50,
            width: MediaQuery.of(context).size.width - 30,
            decoration: BoxDecoration(
              color: _categoryDigitalButtonColor,
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
            child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RecommandResult(
                              category: _category, level: _level)));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "강의 추천 받으러 가기",
                      style: TextStyle(
                        fontFamily: "medium",
                        fontSize: 18,
                        color: _categoryDigitalButtonTextColor,
                      ),
                    ),
                  ],
                ))),
      ],
    );
  }
}
