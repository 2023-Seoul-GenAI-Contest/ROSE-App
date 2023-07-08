class ChatHistVO {
  int? sessionId;
  String? text;
  String? lectureUrl;

  ChatHistVO({this.sessionId, this.text, this.lectureUrl});

  ChatHistVO.fromJson(Map<String, dynamic> json) {
    sessionId = json['sessionId'];
    text = json['text'];
    lectureUrl = json['lectureUrl'];
  }

  Map<String, dynamic> toJson() =>
      {'id': sessionId, 'text': text, 'lectureUrl': lectureUrl};
}
