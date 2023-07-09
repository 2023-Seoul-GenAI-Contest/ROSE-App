import 'package:flutter/material.dart';
import 'package:rose/api/lecture.dart';
import 'package:rose/data/lecture.dart';
import 'package:rose/models/color.dart';
import 'package:rose/utilities/utility.dart';
import 'package:url_launcher/url_launcher_string.dart';

class RecommandResult extends StatefulWidget {
  const RecommandResult({Key? key, required this.category, required this.level})
      : super(key: key);
  final String category;
  final String level;

  @override
  _RecommandResultState createState() => _RecommandResultState();
}

class _RecommandResultState extends State<RecommandResult> {
  List<LectureListVO> list = [];
  void getLecturelist() async {
    final lectureList = await LectureApi()
        .getLectureRecommandlist(widget.category, widget.level);
    setState(() {
      if (lectureList != null) {
        list = lectureList;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getLecturelist();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
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
                      height: 20,
                    ),
                    Image.asset(
                      'assets/img/love.png',
                      fit: BoxFit.cover,
                      height: 120,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 10,
                    ),
                    Text(
                      "알려주신 내용을 바탕으로",
                      style: TextStyle(
                        fontFamily: "medium",
                        fontSize: 12,
                        color: fromHex(GrayScale.Black),
                      ),
                    ),
                    Container(
                      height: 10,
                    ),
                    Text(
                      "강의를 추천한 목록이에요!",
                      style: TextStyle(
                        fontFamily: "medium",
                        fontSize: 12,
                        color: fromHex(GrayScale.Black),
                      ),
                    ),
                    Container(
                      height: 10,
                    ),
                    Text(
                      "강의 추천 결과",
                      style: TextStyle(
                        fontFamily: "bold",
                        fontSize: 28,
                        color: fromHex(GrayScale.Black),
                      ),
                    ),
                    Container(
                      height: 10,
                    ),
                  ],
                ),
              ],
            )),
        Container(height: 20),
        Column(
          children: [
            for (var lecture in list) ...[
              Container(
                  height: 180,
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
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                  child: RichText(
                                textAlign: TextAlign.center,
                                softWrap: false,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                strutStyle: StrutStyle(fontSize: 16.0),
                                text: TextSpan(
                                  text: lecture.title,
                                  style: TextStyle(
                                    fontFamily: "medium",
                                    fontSize: 19,
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
                            lecture.thumbnailLink ?? "",
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
                                          text: lecture.describe,
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
                                    width:
                                        MediaQuery.of(context).size.width - 280,
                                    decoration: BoxDecoration(
                                      color: fromHex('#040C56'),
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 7,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: TextButton(
                                        onPressed: () async {
                                          String _url = lecture.videoLink ?? "";
                                          if (await canLaunchUrlString(_url)) {
                                            await launchUrlString(_url,
                                                mode: LaunchMode
                                                    .externalApplication);
                                          }
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 6,
                                            ),
                                            Text(
                                              "학습하러 가기",
                                              style: TextStyle(
                                                fontFamily: "bold",
                                                fontSize: 12,
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
              Container(
                height: 30,
              ),
            ]
          ],
        ),
        Container(height: 20)
      ],
    );
  }
}
