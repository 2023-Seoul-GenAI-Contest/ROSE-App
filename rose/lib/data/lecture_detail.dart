class LectureDetailVO {
  int? detailId;
  String? title;
  String? describe;
  String? videoLink;

  LectureDetailVO({this.detailId, this.title, this.describe, this.videoLink});

  LectureDetailVO.fromJson(Map<String, dynamic> json) {
    detailId = json['lectureDetail']['lectureDetailId'];
    title = json['lectureDetail']['displayTitle'];
    describe = json['lectureDetail']['text'];
    videoLink = json['videoLink'];
  }

  Map<String, dynamic> toJson() => {
        'id': detailId,
        'title': title,
        'describe': describe,
        'videoLink': videoLink
      };
}
