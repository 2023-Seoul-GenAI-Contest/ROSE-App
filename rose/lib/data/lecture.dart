class LectureListVO {
  int? id;
  String? title;
  String? describe;
  String? thumbnailLink;
  String? videoLink;
  int? totalTime;

  LectureListVO(
      {this.id,
      this.title,
      this.describe,
      this.thumbnailLink,
      this.videoLink,
      this.totalTime});

  LectureListVO.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    describe = json['describe'];
    thumbnailLink = json['thumbnailLink'];
    videoLink = json['videoLink'];
    totalTime = json['totalTime'];
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'describe': describe,
        'thumbnailLink': thumbnailLink,
        'videoLink': videoLink,
        'totalTime': totalTime
      };
}
