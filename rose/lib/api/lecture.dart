import 'package:http/http.dart' as http;
import 'package:rose/api/base.dart';
import 'package:rose/data/chat.dart';
import 'package:rose/data/keyword.dart';
import 'package:rose/data/lecture.dart';
import 'package:rose/data/lecture_detail.dart';
import 'package:rose/data/quiz.dart';
import 'dart:convert';

import 'package:rose/data/user.dart';

class LectureApi {
  String baseUrl =
      BaseApiInterface().baseUrl + ":" + BaseApiInterface().basePort;

  Future<List<LectureListVO>> getLecturelist() async {
    List<LectureListVO> lectureList = [];
    var url = Uri.parse(baseUrl + '/lecture');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var responseBody = utf8.decode(response.bodyBytes);
      var jsonBody = jsonDecode(responseBody);
      for (var item in jsonBody) {
        lectureList.add(LectureListVO.fromJson(item));
      }
      return lectureList;
    } else {
      print(response.reasonPhrase);
      return lectureList;
    }
  }

  Future<List<LectureDetailVO>> getLectureDetail(int lectureId) async {
    List<LectureDetailVO> lectureDetailList = [];
    var url = Uri.parse(baseUrl + '/lecture/detail/' + lectureId.toString());
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var responseBody = utf8.decode(response.bodyBytes);
      var jsonBody = jsonDecode(responseBody);
      for (var item in jsonBody) {
        lectureDetailList.add(LectureDetailVO.fromJson(item));
      }
      return lectureDetailList;
    } else {
      print(response.reasonPhrase);
      return lectureDetailList;
    }
  }

  Future<List<KeywordVO>> getLectureKeyword(int lectureDetailId) async {
    List<KeywordVO> keywordList = [];
    var url = Uri.parse(
        baseUrl + '/lecture/' + lectureDetailId.toString() + '/keyword');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var responseBody = utf8.decode(response.bodyBytes);
      var jsonBody = jsonDecode(responseBody);
      for (var item in jsonBody['keyword']) {
        var secTime = item['time'].split(':')[1];
        var minTime = item['time'].split(':')[0];
        var totalTime = int.parse(secTime) + int.parse(minTime) * 60;
        item['time'] = totalTime.toString();
        keywordList.add(KeywordVO.fromJson(item));
      }
      return keywordList;
    } else {
      print(response.reasonPhrase);
      return keywordList;
    }
  }

  Future<String> getLectureSummary(int lectureDetailId) async {
    String summaryRes = "";
    var url = Uri.parse(
        baseUrl + '/lecture/' + lectureDetailId.toString() + '/summary');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var responseBody = utf8.decode(response.bodyBytes);
      var jsonBody = jsonDecode(responseBody);
      summaryRes = jsonBody['summary'];
      return summaryRes;
    } else {
      print(response.reasonPhrase);
      return summaryRes;
    }
  }

  Future<List<QuizVO>> getLectureQuiz(int lectureDetailId) async {
    List<QuizVO> lectureDetailList = [];
    var url =
        Uri.parse(baseUrl + '/lecture/' + lectureDetailId.toString() + '/quiz');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var responseBody = utf8.decode(response.bodyBytes);
      var jsonBody = jsonDecode(responseBody);
      for (var item in jsonBody) {
        item['selectedAnswer'] = "";
        lectureDetailList.add(QuizVO.fromJson(item));
      }
      return lectureDetailList;
    } else {
      print(response.reasonPhrase);
      return lectureDetailList;
    }
  }
}
