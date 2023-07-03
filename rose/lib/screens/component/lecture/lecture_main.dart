import 'package:flutter/material.dart';
import 'package:rose/models/color.dart';
import 'package:rose/screens/component/lecture/lecture_video.dart';
import 'package:rose/utilities/utility.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LectureMain extends StatefulWidget {
  const LectureMain({Key? key, required this.changeIndex}) : super(key: key);
  final Function changeIndex;
  @override
  _LectureMainState createState() => _LectureMainState();
}

class _LectureMainState extends State<LectureMain> {
  String title = "[고급] 파이썬(Python)을 활용한 공공데이터 머신러닝";
  String describe = "파이썬 언어로 데이터 분석 전문가에 도전해보고 싶은 분들을 위해 준비한 심화과정입니다.";
  String thumbnailLink =
      "https://sdfedu.seoul.kr/data/file/9b85e37aeddf77343bf5a95c120a2735.jpg";
  String videoLink = "https://sdfedu.seoul.kr/classroom/index.jsp?cuid=1278";

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
                "수강 중인 강의",
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
            height: 200,
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
                  height: 15,
                ),
                Container(
                    width: MediaQuery.of(context).size.width - 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                            child: RichText(
                          textAlign: TextAlign.center,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          strutStyle: StrutStyle(fontSize: 16.0),
                          text: TextSpan(
                            text: title,
                            style: TextStyle(
                              fontFamily: "medium",
                              fontSize: 17,
                              color: fromHex(GrayScale.Black),
                            ),
                          ),
                        )),
                      ],
                    )),
                Container(
                  height: 10,
                ),
                Row(
                  children: [
                    Container(
                      width: 10,
                    ),
                    Image.network(
                      thumbnailLink,
                      fit: BoxFit.cover,
                      height: 110,
                    ),
                    Container(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            width: 180,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Flexible(
                                    child: RichText(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  strutStyle: StrutStyle(fontSize: 16.0),
                                  text: TextSpan(
                                    text: describe,
                                    style: TextStyle(
                                      fontFamily: "medium",
                                      fontSize: 12,
                                      color: fromHex(GrayScale.Black),
                                    ),
                                  ),
                                )),
                              ],
                            )),
                        Container(
                          height: 10,
                        ),
                        Center(
                          child: Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width - 280,
                              decoration: BoxDecoration(
                                color: fromHex('#040C56'),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: TextButton(
                                  onPressed: () async {
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const VideoApp()));
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 6,
                                      ),
                                      Text(
                                        "학습하러 가기",
                                        style: TextStyle(
                                          fontFamily: "bold",
                                          fontSize: 16,
                                          color: fromHex(GrayScale.White),
                                        ),
                                      ),
                                    ],
                                  ))),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            )),
        Container(height: 20)
      ],
    );
  }
}
