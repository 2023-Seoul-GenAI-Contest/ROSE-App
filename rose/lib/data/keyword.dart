class KeywordVO {
  String? time;
  String? name;
  String? describe;

  KeywordVO({this.time, this.name, this.describe});

  KeywordVO.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    name = json['name'];
    describe = json['describe'];
  }

  Map<String, dynamic> toJson() => {
        'time': time,
        'name': name,
        'describe': describe,
      };
}
