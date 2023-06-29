import 'package:http/http.dart' as http;
import 'package:rose/api/base.dart';

class UserApi {
  String baseUrl =
      BaseApiInterface().baseUrl + ":" + BaseApiInterface().basePort;
  void sendImage(String path) async {
    var headers = {'Content-Type': 'multipart/form-data'};
    var request =
        http.MultipartRequest('POST', Uri.parse(this.baseUrl + '/user'));
    request.files.add(await http.MultipartFile.fromPath('user_file', path));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }
}
