import 'package:http/http.dart' as http;
import 'package:rose/api/base.dart';
import 'package:rose/data/chat.dart';
import 'package:rose/data/chat_request_data.dart';
import 'package:rose/data/chat_response_data.dart';
import 'dart:convert';

import 'package:rose/data/user.dart';

class ChatApi {
  String baseUrl =
      BaseApiInterface().baseUrl + ":" + BaseApiInterface().basePort;

  Future<List<ChatHistVO>> getChatHist(int userId) async {
    List<ChatHistVO> chatHistList = [];
    var url = Uri.parse(baseUrl + '/chat/hist?clientId=' + userId.toString());
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var responseBody = utf8.decode(response.bodyBytes);
      var jsonBody = jsonDecode(responseBody);
      for (var item in jsonBody) {
        chatHistList.add(ChatHistVO.fromJson(item));
      }
      return chatHistList;
    } else {
      print(response.reasonPhrase);
      return chatHistList;
    }
  }

  Future<String> getChatVoice(String path) async {
    var responseBody;
    var headers = {'Content-Type': 'multipart/form-data'};
    var request =
        http.MultipartRequest('POST', Uri.parse(baseUrl + '/chat/voice'));
    request.files.add(await http.MultipartFile.fromPath('file', path));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      late final responseBody = response.stream.bytesToString();
      print(responseBody);
      return responseBody;
    } else {
      print(response.reasonPhrase);
      return responseBody;
    }
  }

  Future<ChatResponseVO> getChat(ChatRequestVO chat) async {
    ChatResponseVO resChat = ChatResponseVO();
    var url = Uri.parse(baseUrl + '/chat/text');
    Map<String, String> headers = {"Content-type": "application/json"};
    http.Response response = await http.post(url,
        body: json.encode(chat.toJson()), headers: headers);
    if (response.statusCode == 200) {
      var responseBody = utf8.decode(response.bodyBytes);
      var jsonBody = jsonDecode(responseBody);
      jsonBody['sessionId'] = int.parse(jsonBody['sessionId']);
      jsonBody['clientId'] = int.parse(jsonBody['clientId']);
      jsonBody['msgType'] = int.parse(jsonBody['msgType']);
      jsonBody['msgNum'] = int.parse(jsonBody['msgNum']);
      resChat = ChatResponseVO.fromJson(jsonBody);
      return resChat;
    } else {
      print(response.reasonPhrase);
      return resChat;
    }
  }

  Future<List<ChatResponseVO>> getChatDetail(int sessionId) async {
    List<ChatResponseVO> chatHistList = [];
    var url =
        Uri.parse(baseUrl + '/chat/' + sessionId.toString() + '?clientId=1');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var responseBody = utf8.decode(response.bodyBytes);
      var jsonBody = jsonDecode(responseBody);
      for (var item in jsonBody) {
        item['msgNum'] = int.parse(item['msgNum']);
        item['status'] = item['status'].toString();
        item['text'] = item['msg'];
        chatHistList.add(ChatResponseVO.fromJson(item));
      }
      return chatHistList;
    } else {
      print(response.reasonPhrase);
      return chatHistList;
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
