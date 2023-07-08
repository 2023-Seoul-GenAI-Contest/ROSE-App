import 'package:flutter/material.dart';
import 'package:rose/api/lecture.dart';
import 'package:rose/data/lecture.dart';
import 'package:rose/data/lecture_detail.dart';
import 'package:rose/models/color.dart';
import 'package:rose/screens/component/lecture/lecture_video.dart';
import 'package:rose/utilities/utility.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LectureDetail extends StatefulWidget {
  const LectureDetail({Key? key, required this.lectureId}) : super(key: key);
  final int lectureId;
  @override
  _LectureDetailState createState() => _LectureDetailState();
}

class _LectureDetailState extends State<LectureDetail> {
  List<LectureDetailVO> list = [];
  void getLectureDetail() async {
    final lectureDetailList =
        await LectureApi().getLectureDetail(widget.lectureId);
    setState(() {
      if (lectureDetailList != null) {
        list = lectureDetailList;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getLectureDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, top: 20, bottom: 20),
                child: Text(
                  "강의 영상 목록",
                  style: TextStyle(
                    fontFamily: "medium",
                    fontSize: 25,
                    color: fromHex(GrayScale.Black),
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              for (var lecture in list) ...[
                Container(
                    height: 120,
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Container(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width -
                                          150,
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
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        VideoApp(
                                                            lectureId: lecture
                                                                    .detailId ??
                                                                0,
                                                            videoUrl: lecture
                                                                    .videoLink ??
                                                                "")));
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 6,
                                              ),
                                              Text(
                                                "영상 보기",
                                                style: TextStyle(
                                                  fontFamily: "bold",
                                                  fontSize: 12,
                                                  color:
                                                      fromHex(GrayScale.White),
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
      )
    ]));
  }
}
