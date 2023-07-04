import 'package:http/http.dart' as http;
import 'package:rose/api/base.dart';
import 'dart:convert';

import 'package:rose/data/user.dart';

class UserApi {
  String baseUrl =
      BaseApiInterface().baseUrl + ":" + BaseApiInterface().basePort;

  Future<UserVO> getUserInfo(int userId) async {
    var url = Uri.parse(baseUrl + '/user/' + userId.toString());
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var responseBody = utf8.decode(response.bodyBytes);
      var jsonBody = jsonDecode(responseBody);
      return UserVO.fromJson(jsonBody);
    } else {
      print(response.reasonPhrase);
      return UserVO();
    }
  }
  // void sendImage(String path) async {
  //   var headers = {'Content-Type': 'multipart/form-data'};
  //   var request =
  //       http.MultipartRequest('POST', Uri.parse(this.baseUrl + '/user'));
  //   request.files.add(await http.MultipartFile.fromPath('user_file', path));
  //   request.headers.addAll(headers);

  //   http.StreamedResponse response = await request.send();

  //   if (response.statusCode == 200) {
  //     print(await response.stream.bytesToString());
  //   } else {
  //     print(response.reasonPhrase);
  //   }
  // }
}
