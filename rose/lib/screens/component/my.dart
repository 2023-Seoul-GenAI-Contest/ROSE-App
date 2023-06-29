import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:rose/models/color.dart';
import 'package:rose/utilities/utility.dart';

class My extends StatefulWidget {
  const My({Key? key, required this.changeIndex}) : super(key: key);
  final Function changeIndex;
  @override
  _MyState createState() => _MyState();
}

class _MyState extends State<My> {
  String name = "김지원";
  String email = "asdf1234@naver.com";
  String phone = "010-1234-5678";
  String birth = "1999.01.01";
  int enterLec = 10;
  int finshLec = 3;
  double percent = 5 / 40;

  String convertBirth(String birth) {
    String result = "";
    result = birth.substring(0, 4) +
        "년 " +
        birth.substring(5, 7) +
        "월 " +
        birth.substring(8, 10) +
        "일";
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20, top: 20, bottom: 20),
              child: Text(
                "마이페이지",
                style: TextStyle(
                  fontFamily: "medium",
                  fontSize: 25,
                  color: fromHex(GrayScale.Black),
                ),
              ),
            ),
          ],
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 10,
                ),
                Image.asset(
                  'assets/img/stand.png',
                  fit: BoxFit.cover,
                  height: 110,
                ),
                Container(
                  width: 15,
                ),
                Column(
                  children: [
                    Container(
                      height: 15,
                    ),
                    Text(
                      "나의 정보",
                      style: TextStyle(
                        fontFamily: "medium",
                        fontSize: 16,
                        color: fromHex(GrayScale.Black),
                      ),
                    ),
                    Container(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 8),
                                child: Text(
                                  "회원명",
                                  style: TextStyle(
                                    fontFamily: "medium",
                                    fontSize: 12,
                                    color: fromHex(GrayScale.Black),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 8),
                                child: Text(
                                  "이메일",
                                  style: TextStyle(
                                    fontFamily: "medium",
                                    fontSize: 12,
                                    color: fromHex(GrayScale.Black),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 8),
                                child: Text(
                                  "휴대폰",
                                  style: TextStyle(
                                    fontFamily: "medium",
                                    fontSize: 12,
                                    color: fromHex(GrayScale.Black),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 8),
                                child: Text(
                                  "생년월일",
                                  style: TextStyle(
                                    fontFamily: "medium",
                                    fontSize: 12,
                                    color: fromHex(GrayScale.Black),
                                  ),
                                ),
                              ),
                            ]),
                        Container(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 8),
                              child: Text(
                                name,
                                style: TextStyle(
                                  fontFamily: "medium",
                                  fontSize: 12,
                                  color: fromHex(GrayScale.Black),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 8),
                              child: Text(
                                email,
                                style: TextStyle(
                                  fontFamily: "medium",
                                  fontSize: 12,
                                  color: fromHex(GrayScale.Black),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 8),
                              child: Text(
                                phone,
                                style: TextStyle(
                                  fontFamily: "medium",
                                  fontSize: 12,
                                  color: fromHex(GrayScale.Black),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 8),
                              child: Text(
                                convertBirth(birth),
                                style: TextStyle(
                                  fontFamily: "medium",
                                  fontSize: 12,
                                  color: fromHex(GrayScale.Black),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
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
                  "나의 디지털 배지",
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
                    Image.asset(
                      'assets/img/bronze.png',
                      fit: BoxFit.cover,
                      height: 110,
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          child: Text(
                            "수강 신청 과목 수",
                            style: TextStyle(
                              fontFamily: "medium",
                              fontSize: 10,
                              color: fromHex(GrayScale.Black),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          child: Text(
                            "과목 이수 수",
                            style: TextStyle(
                              fontFamily: "medium",
                              fontSize: 10,
                              color: fromHex(GrayScale.Black),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          child: Text(
                            enterLec.toString(),
                            style: TextStyle(
                              fontFamily: "medium",
                              fontSize: 10,
                              color: fromHex(GrayScale.Black),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 8),
                          child: Text(
                            finshLec.toString(),
                            style: TextStyle(
                              fontFamily: "medium",
                              fontSize: 10,
                              color: fromHex(GrayScale.Black),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Container(
                  width: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/img/bronze.png',
                      fit: BoxFit.cover,
                      height: 60,
                    ),
                    Image.asset(
                      'assets/img/silver-disable.png',
                      fit: BoxFit.cover,
                      height: 60,
                    ),
                    Image.asset(
                      'assets/img/gold-disable.png',
                      fit: BoxFit.cover,
                      height: 60,
                    ),
                    Image.asset(
                      'assets/img/diamond-disable.png',
                      fit: BoxFit.cover,
                      height: 60,
                    ),
                  ],
                ),
                Container(
                  width: 15,
                ),
                Column(
                  children: [
                    Container(
                      alignment: FractionalOffset(percent - 0.07, 1 - percent),
                      child: FractionallySizedBox(
                          child: Image.asset('assets/img/my-pregress.png',
                              height: 50, fit: BoxFit.cover)),
                    ),
                    LinearPercentIndicator(
                      padding: EdgeInsets.only(left: 20),
                      percent: percent,
                      lineHeight: 10,
                      backgroundColor: Colors.black38,
                      progressColor: Colors.indigo.shade900,
                      width: MediaQuery.of(context).size.width - 50,
                    )
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
