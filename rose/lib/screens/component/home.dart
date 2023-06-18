import 'package:flutter/material.dart';
import 'package:rose/models/color.dart';
import 'package:rose/screens/component/recommand.dart';
import 'package:rose/utilities/utility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.changeIndex}) : super(key: key);
  final Function changeIndex;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        height: 16,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              width: MediaQuery.of(context).size.width - 230,
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
              child: TextButton(
                  onPressed: () {
                    setState(() {
                      widget.changeIndex("recommand");
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 12,
                      ),
                      Image.asset(
                        'assets/img/recommand.png',
                        fit: BoxFit.cover,
                        height: 140,
                      ),
                      Container(
                        height: 10,
                      ),
                      Text(
                        "강의 추천",
                        style: TextStyle(
                          fontFamily: "medium",
                          fontSize: 24,
                          color: fromHex(GrayScale.Black),
                        ),
                      ),
                      Container(
                        height: 10,
                      ),
                    ],
                  ))),
          Container(
              width: MediaQuery.of(context).size.width - 230,
              decoration: BoxDecoration(
                color: fromHex('#85D700'),
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
                    setState(() {
                      widget.changeIndex("lecture");
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 12,
                      ),
                      Text(
                        "수강 중인",
                        style: TextStyle(
                          fontFamily: "medium",
                          fontSize: 26,
                          color: fromHex(GrayScale.Black),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "강의",
                            style: TextStyle(
                              fontFamily: "medium",
                              fontSize: 26,
                              color: fromHex(GrayScale.Black),
                            ),
                          ),
                          Container(
                            width: 12,
                          ),
                        ],
                      ),
                      Container(
                        height: 10,
                      ),
                      Image.asset(
                        'assets/img/lecture.png',
                        fit: BoxFit.cover,
                        height: 90,
                      ),
                      Container(
                        height: 20,
                      ),
                    ],
                  ))),
        ],
      ),
      Container(height: 16),
      Center(
        child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width - 30,
            decoration: BoxDecoration(
              color: fromHex('#040C56'),
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
                onPressed: () async {
                  String _url = 'https://sdfedu.seoul.kr/main/index.jsp';
                  if (await canLaunchUrlString(_url)) {
                    await launchUrlString(_url,
                        mode: LaunchMode.externalApplication);
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 6,
                    ),
                    SvgPicture.asset(
                      'assets/img/campus.svg',
                      height: 30,
                    ),
                    Container(
                      width: 10,
                    ),
                    Text(
                      "에듀테크 캠퍼스 바로가기",
                      style: TextStyle(
                        fontFamily: "medium",
                        fontSize: 14,
                        color: fromHex(GrayScale.White),
                      ),
                    ),
                  ],
                ))),
      ),
      Container(height: 12),
      Container(
          height: 50,
          width: MediaQuery.of(context).size.width - 30,
          decoration: BoxDecoration(
            color: fromHex('#94B2FF'),
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
              onPressed: () async {
                String _url =
                    'https://sdfedu.seoul.kr/main/page.jsp?pid=course1.exam&cid=2';
                if (await canLaunchUrlString(_url)) {
                  await launchUrlString(_url,
                      mode: LaunchMode.externalApplication);
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 6,
                  ),
                  SvgPicture.asset(
                    'assets/img/graph.svg',
                    height: 34,
                  ),
                  Container(
                    width: 10,
                  ),
                  Text(
                    "디지털 역량 평가 하러 가기",
                    style: TextStyle(
                      fontFamily: "medium",
                      fontSize: 14,
                      color: fromHex(GrayScale.Black),
                    ),
                  ),
                ],
              ))),
      Container(height: 12),
      Container(
          height: 50,
          width: MediaQuery.of(context).size.width - 30,
          decoration: BoxDecoration(
            color: fromHex('#F23000'),
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
              onPressed: () async {
                String _url =
                    'https://www.youtube.com/channel/UCWFbtG6p3zGtJWT6VPsmMdw';
                if (await canLaunchUrlString(_url)) {
                  await launchUrlString(_url,
                      mode: LaunchMode.externalApplication);
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 3,
                  ),
                  Image.asset(
                    'assets/img/ico_gnb_yt.png',
                    fit: BoxFit.cover,
                    height: 40,
                  ),
                  Container(
                    width: 8,
                  ),
                  Text(
                    "에듀테크 캠퍼스 유튜브 바로가기",
                    style: TextStyle(
                      fontFamily: "medium",
                      fontSize: 14,
                      color: fromHex(GrayScale.White),
                    ),
                  ),
                ],
              ))),
      Container(height: 20),
      Text(
        "지금까지 월디에게 물어본 것",
        style: TextStyle(
          fontFamily: "medium",
          fontSize: 15,
          color: fromHex(GrayScale.Black),
        ),
      ),
      Container(
        width: 12,
      ),
      SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(8),
        child: Row(children: [
          Container(
              height: 150,
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
                    "질문 11",
                    style: TextStyle(
                      fontFamily: "medium",
                      fontSize: 16,
                      color: fromHex(GrayScale.Black),
                    ),
                  ),
                  Container(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width - 260,
                          decoration: BoxDecoration(
                            color: fromHex('#040C56'),
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
                              onPressed: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "추천 강의",
                                    style: TextStyle(
                                      fontFamily: "medium",
                                      fontSize: 14,
                                      color: fromHex(GrayScale.White),
                                    ),
                                  ),
                                  Text(
                                    "보러 가기",
                                    style: TextStyle(
                                      fontFamily: "medium",
                                      fontSize: 14,
                                      color: fromHex(GrayScale.White),
                                    ),
                                  ),
                                ],
                              ))),
                      Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width - 260,
                          decoration: BoxDecoration(
                            color: fromHex('#040C56'),
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
                              onPressed: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "답변",
                                    style: TextStyle(
                                      fontFamily: "medium",
                                      fontSize: 14,
                                      color: fromHex(GrayScale.White),
                                    ),
                                  ),
                                  Text(
                                    "보러 가기",
                                    style: TextStyle(
                                      fontFamily: "medium",
                                      fontSize: 14,
                                      color: fromHex(GrayScale.White),
                                    ),
                                  ),
                                ],
                              ))),
                    ],
                  ),
                ],
              )),
          Container(width: 12),
          Container(
              height: 150,
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
                    "질문 11",
                    style: TextStyle(
                      fontFamily: "medium",
                      fontSize: 16,
                      color: fromHex(GrayScale.Black),
                    ),
                  ),
                  Container(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width - 260,
                          decoration: BoxDecoration(
                            color: fromHex('#040C56'),
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
                              onPressed: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "추천 강의",
                                    style: TextStyle(
                                      fontFamily: "medium",
                                      fontSize: 14,
                                      color: fromHex(GrayScale.White),
                                    ),
                                  ),
                                  Text(
                                    "보러 가기",
                                    style: TextStyle(
                                      fontFamily: "medium",
                                      fontSize: 14,
                                      color: fromHex(GrayScale.White),
                                    ),
                                  ),
                                ],
                              ))),
                      Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width - 260,
                          decoration: BoxDecoration(
                            color: fromHex('#040C56'),
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
                              onPressed: () {},
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "답변",
                                    style: TextStyle(
                                      fontFamily: "medium",
                                      fontSize: 14,
                                      color: fromHex(GrayScale.White),
                                    ),
                                  ),
                                  Text(
                                    "보러 가기",
                                    style: TextStyle(
                                      fontFamily: "medium",
                                      fontSize: 14,
                                      color: fromHex(GrayScale.White),
                                    ),
                                  ),
                                ],
                              ))),
                    ],
                  ),
                ],
              )),
        ]),
      )
    ]);
  }
}
