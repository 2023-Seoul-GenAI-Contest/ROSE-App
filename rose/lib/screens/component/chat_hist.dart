import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:rose/api/chat.dart';
import 'package:rose/data/chat_response_data.dart';
import 'package:rose/models/color.dart';
import 'package:rose/utilities/utility.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ChatHist extends StatefulWidget {
  const ChatHist({Key? key, required this.sessionId}) : super(key: key);
  final int sessionId;
  @override
  _ChatHistState createState() => _ChatHistState();
}

class _ChatHistState extends State<ChatHist> {
  late final getChatRes = getChat();
  List<ChatResponseVO> messageList = [];
  ChatResponseVO chatResponseVO = ChatResponseVO();

  Future<List<ChatResponseVO>> getChat() async {
    context.loaderOverlay.show();
    final res = await ChatApi().getChatDetail(widget.sessionId);
    setState(() {
      if (ChatResponseVO != null) {
        messageList = res;
        context.loaderOverlay.hide();
      }
    });
    return messageList;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getChat();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          height: 30,
        ),
        Container(
            height: 130,
            width: MediaQuery.of(context).size.width - 50,
            decoration: BoxDecoration(
              color: fromHex('#FFFFFF'),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/img/introduce.png',
                  fit: BoxFit.cover,
                  height: 110,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "질문 했던 내용을 다시 봐요!",
                      style: TextStyle(
                        fontFamily: "medium",
                        fontSize: 16,
                        color: fromHex(GrayScale.Black),
                      ),
                    ),
                  ],
                ),
              ],
            )),
        Container(
          height: 10,
        ),
        for (var chat in messageList) ...[
          Column(
            children: [
              Row(
                  mainAxisAlignment: chat.msgType == 0
                      ? MainAxisAlignment.end
                      : MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 80,
                      decoration: BoxDecoration(
                        color: chat.msgType == 0
                            ? fromHex('#92B0FD')
                            : fromHex('#FFFFFF'),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        width: MediaQuery.of(context).size.width - 280,
                        child: SingleChildScrollView(
                            child: Text(chat.text ?? "",
                                style: TextStyle(
                                  fontFamily: "medium",
                                  fontSize: 16,
                                  color: fromHex(GrayScale.Black),
                                ))),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ]),
              const SizedBox(
                height: 10,
              ),
              chat.msgType == 1 && chat.status == "true"
                  ? Container(
                      padding: const EdgeInsets.only(top: 14, bottom: 14),
                      width: MediaQuery.of(context).size.width - 80,
                      decoration: BoxDecoration(
                        color: fromHex('#FFFFFF'),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.network(
                            chat.imgUrl ?? "",
                            fit: BoxFit.cover,
                            height: 110,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                child: Text(
                                  "[연관 강의]",
                                  style: TextStyle(
                                    fontFamily: "medium",
                                    fontSize: 22,
                                    color: fromHex(GrayScale.Black),
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                    height: 40,
                                    width:
                                        MediaQuery.of(context).size.width - 280,
                                    decoration: BoxDecoration(
                                      color: fromHex('#040C56'),
                                      borderRadius: BorderRadius.circular(20),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 7,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: TextButton(
                                        onPressed: () async {
                                          if (await canLaunchUrlString(
                                              chat.lectureUrl ?? "")) {
                                            await launchUrlString(
                                                chat.lectureUrl ?? "",
                                                mode: LaunchMode
                                                    .externalApplication);
                                          }
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "학습하러 가기",
                                              style: TextStyle(
                                                fontFamily: "bold",
                                                fontSize: 12,
                                                color: fromHex(GrayScale.White),
                                              ),
                                            ),
                                          ],
                                        ))),
                              ),
                            ],
                          ),
                        ],
                      ))
                  : Container(),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ]
      ],
    );
  }
}
