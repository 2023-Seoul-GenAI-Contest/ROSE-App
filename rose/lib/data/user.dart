class UserVO {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? level;
  int? enrollLecture;
  int? finshLecture;
  String? createdAt;
  String? modifiedAt;

  UserVO(
      {this.id,
      this.name,
      this.email,
      this.phone,
      this.level,
      this.enrollLecture,
      this.finshLecture,
      this.createdAt,
      this.modifiedAt});

  UserVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    level = json['level'];
    enrollLecture = json['enrollLecture'];
    finshLecture = json['finshLecture'];
    createdAt = json['createdAt'];
    modifiedAt = json['modifiedAt'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'phone': phone,
        'level': level,
        'enrollLecture': enrollLecture,
        'finshLecture': finshLecture,
        'createdAt': createdAt,
        'modifiedAt': modifiedAt,
      };
}
