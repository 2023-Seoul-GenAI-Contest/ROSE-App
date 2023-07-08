class QuizVO {
  String? answer;
  String? selectedAnswer;
  String? explain;
  String? question;
  String? questionNum;
  bool? isCorrect;
  List<String>? example;

  QuizVO(
      {this.answer,
      this.selectedAnswer,
      this.explain,
      this.question,
      this.questionNum,
      this.isCorrect,
      this.example});

  QuizVO.fromJson(Map<String, dynamic> json) {
    answer = json['answer'];
    selectedAnswer = json['selectedAnswer'];
    explain = json['explain'];
    question = json['question'];
    questionNum = json['questionNum'];
    isCorrect = json['isCorrect'];
    example = json['example'].cast<String>();
  }

  Map<String, dynamic> toJson() => {
        'answer': answer,
        'selectedAnswer': selectedAnswer,
        'explain': explain,
        'question': question,
        'questionNum': questionNum,
        'isCorrect': isCorrect,
        'example': example
      };
}
