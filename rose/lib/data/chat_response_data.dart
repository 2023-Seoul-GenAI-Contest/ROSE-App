class ChatResponseVO {
  int? sessionId;
  int? clientId;
  int? msgType;
  int? msgNum;
  String? text;
  String? status;
  String? lectureUrl;
  String? imgUrl;

  ChatResponseVO(
      {this.sessionId,
      this.clientId,
      this.msgType,
      this.msgNum,
      this.text,
      this.status,
      this.lectureUrl,
      this.imgUrl});

  ChatResponseVO.fromJson(Map<String, dynamic> json) {
    sessionId = json['sessionId'];
    clientId = json['clientId'];
    msgType = json['msgType'];
    msgNum = json['msgNum'];
    text = json['text'];
    status = json['status'];
    lectureUrl = json['lectureUrl'];
    imgUrl = json['imgUrl'];
  }

  Map<String, dynamic> toJson() =>
      {'id': sessionId, 'text': text, 'lectureUrl': lectureUrl};
}
