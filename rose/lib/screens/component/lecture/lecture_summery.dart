import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:rose/api/lecture.dart';
import 'package:rose/data/keyword.dart';
import 'package:rose/models/color.dart';
import 'package:rose/screens/component/lecture/lecture_quiz.dart';
import 'package:rose/utilities/utility.dart';

class LectureSummery extends StatefulWidget {
  const LectureSummery(
      {Key? key, required this.lectureId, required this.keywords})
      : super(key: key);
  final int lectureId;
  final List<KeywordVO> keywords;
  @override
  _LectureSummeryState createState() => _LectureSummeryState();
}

class _LectureSummeryState extends State<LectureSummery> {
  late final getSummary = setSummary();
  String summaryDetail = "";

  Future<String> setSummary() async {
    final summary = await LectureApi().getLectureSummary(widget.lectureId);
    setState(() {
      if (summary != null) {
        summaryDetail = summary;
      }
    });
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getSummary,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView(padding: const EdgeInsets.all(12), children: [
              Container(height: 80),
              Center(
                child: Text(
                  "강의 요약",
                  style: TextStyle(
                    fontFamily: "bold",
                    fontSize: 26,
                    color: fromHex(GrayScale.Black),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width - 280,
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
                child: Container(
                  padding: const EdgeInsets.all(14),
                  width: MediaQuery.of(context).size.width - 280,
                  child: SingleChildScrollView(
                      child: Text(summaryDetail,
                          style: TextStyle(
                            fontFamily: "medium",
                            fontSize: 18,
                            color: fromHex(GrayScale.Black),
                          ))),
                ),
              ),
              Container(
                height: 10,
              ),
              Center(
                child: Text(
                  "키워드 다시 보기",
                  style: TextStyle(
                    fontFamily: "bold",
                    fontSize: 26,
                    color: fromHex(GrayScale.Black),
                  ),
                ),
              ),
              Container(
                height: 10,
              ),
              for (var keyword in widget.keywords) ...[
                Container(
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
                        Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: MediaQuery.of(context).size.width - 50,
                          decoration: BoxDecoration(
                            color: fromHex('#040C56'),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            "   " + keyword.name.toString() + "   ",
                            style: TextStyle(
                              fontFamily: "medium",
                              fontSize: 18,
                              color: fromHex(GrayScale.White),
                            ),
                          ),
                        ),
                        Container(height: 5),
                        Container(
                          padding: const EdgeInsets.all(14),
                          width: MediaQuery.of(context).size.width,
                          child: SingleChildScrollView(
                              child: Text(keyword.describe.toString(),
                                  style: TextStyle(
                                    fontFamily: "medium",
                                    fontSize: 18,
                                    color: fromHex(GrayScale.Black),
                                  ))),
                        ),
                      ],
                    )),
                Container(height: 12),
              ],
              Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 260,
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
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    LectureQuiz(lectureId: widget.lectureId)));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "퀴즈 풀기",
                            style: TextStyle(
                              fontFamily: "medium",
                              fontSize: 18,
                              color: fromHex(GrayScale.White),
                            ),
                          ),
                        ],
                      ))),
            ]);
          } else {
            return Stack(
              children: [
                Positioned.fill(
                  top: 190,
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 200,
                        child: Image.asset(
                          'assets/img/run.png',
                          height: 500,
                        ),
                      )),
                ),
                Positioned.fill(
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          height: 140,
                          child: Text(
                            "생성형 AI가 강의 내용을 요약하고 있어요.",
                            style: TextStyle(
                              fontFamily: "medium",
                              fontSize: 18,
                              color: fromHex(GrayScale.Black),
                            ),
                          ))),
                ),
                const Positioned.fill(
                  top: 180,
                  child: Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator()),
                )
              ],
            );
          }
        });
  }
}
