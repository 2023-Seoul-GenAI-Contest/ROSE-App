import 'package:flutter/material.dart';
import 'package:rose/api/lecture.dart';
import 'package:rose/data/quiz.dart';
import 'package:rose/data/quiz_answer.dart';
import 'package:rose/models/color.dart';
import 'package:rose/screens/component/lecture/lecture_quiz_fin.dart';
import 'package:rose/utilities/utility.dart';

class LectureQuiz extends StatefulWidget {
  const LectureQuiz({Key? key, required this.lectureId}) : super(key: key);
  final int lectureId;

  @override
  _LectureQuizState createState() => _LectureQuizState();
}

class _LectureQuizState extends State<LectureQuiz> {
  late final getQuiz = setQuiz();
  List<QuizVO> quizList = [];
  List<QuizAnswerVO> answerList = [];

  Future<List<QuizVO>> setQuiz() async {
    final quiz = await LectureApi().getLectureQuiz(widget.lectureId);
    setState(() {
      if (quiz != null) {
        quizList = quiz;
      }
    });
    return quiz;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getQuiz,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView(padding: const EdgeInsets.all(8), children: [
              Container(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 100,
                    child: Image.asset(
                      'assets/img/run.png',
                      height: 500,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text(
                          "강의 내용을 바탕으로 퀴즈를 만들었어요!",
                          style: TextStyle(
                            fontFamily: "medium",
                            fontSize: 10,
                            color: fromHex(GrayScale.Black),
                          ),
                        ),
                      ),
                      Container(
                        height: 10,
                      ),
                      Container(
                        child: Text(
                          "퀴즈 풀기",
                          style: TextStyle(
                            fontFamily: "bold",
                            fontSize: 30,
                            color: fromHex(GrayScale.Black),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                height: 20,
              ),
              for (var quiz in quizList) ...[
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Text(
                            quiz.questionNum.toString() +
                                "번 문제. " +
                                quiz.question.toString(),
                            style: TextStyle(
                              fontFamily: "medium",
                              fontSize: 18,
                              color: fromHex(GrayScale.Black),
                            ),
                          ),
                        ),
                        Container(
                          height: 20,
                        ),
                        for (var select in quiz.example ?? []) ...[
                          Container(
                              width: MediaQuery.of(context).size.width - 50,
                              decoration: BoxDecoration(
                                color: fromHex('#92B0FD'),
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
                                  onPressed: () {
                                    setState(() {
                                      quiz.selectedAnswer = select;
                                    });
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        select,
                                        style: TextStyle(
                                          fontFamily: "medium",
                                          fontSize: 18,
                                          color: fromHex(GrayScale.Black),
                                        ),
                                      ),
                                    ],
                                  ))),
                          Container(
                            height: 10,
                          )
                        ],
                        quiz.selectedAnswer != ""
                            ? Container(
                                padding: EdgeInsets.only(left: 20, right: 20),
                                child: Text(
                                  "선택한 정답 : " + quiz.selectedAnswer.toString(),
                                  style: TextStyle(
                                    fontFamily: "medium",
                                    fontSize: 18,
                                    color: fromHex(GrayScale.Black),
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    )),
                Container(height: 12),
              ],
              Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width - 50,
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
                                builder: (context) => LectureQuizFin(
                                    lectureId: widget.lectureId,
                                    quizList: quizList)));
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "정답 확인하러 가기",
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
                            "생성형 AI가 퀴즈를 만들고 있어요.",
                            style: TextStyle(
                              fontFamily: "medium",
                              fontSize: 14,
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
