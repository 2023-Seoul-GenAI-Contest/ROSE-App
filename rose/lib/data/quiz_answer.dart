class QuizAnswerVO {
  String? answer;
  String? questionNum;

  QuizAnswerVO({this.answer, this.questionNum});

  QuizAnswerVO.fromJson(Map<String, dynamic> json) {
    answer = json['answer'];
    questionNum = json['questionNum'];
  }

  Map<String, dynamic> toJson() => {
        'answer': answer,
        'questionNum': questionNum,
      };
}
