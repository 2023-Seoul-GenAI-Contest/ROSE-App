import 'package:flutter/material.dart';
import 'package:rose/data/quiz.dart';
import 'package:rose/models/color.dart';
import 'package:rose/screens/app.dart';
import 'package:rose/screens/component/home.dart';
import 'package:rose/utilities/utility.dart';

class LectureQuizFin extends StatefulWidget {
  const LectureQuizFin(
      {Key? key, required this.lectureId, required this.quizList})
      : super(key: key);
  final int lectureId;
  final List<QuizVO> quizList;

  @override
  _LectureQuizFinState createState() => _LectureQuizFinState();
}

class _LectureQuizFinState extends State<LectureQuizFin> {
  @override
  void initState() {
    super.initState();
    for (var quiz in widget.quizList) {
      if (quiz.selectedAnswer == quiz.answer) {
        quiz.isCorrect = true;
      } else {
        quiz.isCorrect = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
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
              'assets/img/ok.png',
              height: 500,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  "퀴즈의 정답을 확인해보아요!",
                  style: TextStyle(
                    fontFamily: "medium",
                    fontSize: 14,
                    color: fromHex(GrayScale.Black),
                  ),
                ),
              ),
              Container(
                height: 10,
              ),
              Container(
                child: Text(
                  "퀴즈 정답",
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
      for (var quiz in widget.quizList) ...[
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
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width - 50,
                          decoration: BoxDecoration(
                            color: quiz.selectedAnswer == select
                                ? fromHex('#AFABAB')
                                : fromHex('#92B0FD'),
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
                                setState(() {});
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
                      quiz.selectedAnswer == select
                          ? quiz.isCorrect == true
                              ? SizedBox(
                                  height: 60,
                                  child: Image.asset(
                                    'assets/img/quiz_ok.png',
                                  ),
                                )
                              : SizedBox(
                                  height: 60,
                                  child: Image.asset(
                                    'assets/img/quiz_fail.png',
                                  ),
                                )
                          : Container(),
                    ],
                  ),
                  Container(
                    height: 10,
                  )
                ],
                quiz.isCorrect == false
                    ? Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          "설명 : " + quiz.explain.toString(),
                          style: TextStyle(
                            fontFamily: "medium",
                            fontSize: 16,
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const App()));
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "메인 화면 가기",
                    style: TextStyle(
                      fontFamily: "medium",
                      fontSize: 18,
                      color: fromHex(GrayScale.White),
                    ),
                  ),
                ],
              ))),
    ]);
  }
}
