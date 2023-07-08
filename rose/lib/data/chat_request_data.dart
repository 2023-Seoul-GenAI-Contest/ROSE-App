class ChatRequestVO {
  int? sessionId;
  int? clientId = 1; // 홍길동 고정
  int? msgType = 0;
  int? msgNum;
  String? text;

  ChatRequestVO(
      {this.sessionId, this.clientId, this.msgType, this.msgNum, this.text});

  ChatRequestVO.fromJson(Map<String, dynamic> json) {
    sessionId = json['sessionId'];
    clientId = json['clientId'];
    msgType = json['msgType'];
    msgNum = json['msgNum'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() => {
        'sessionId': sessionId,
        'clientId': clientId,
        'msgType': msgType,
        'msgNum': msgNum,
        'text': text
      };
}
