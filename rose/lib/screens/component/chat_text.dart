import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:rose/api/chat.dart';
import 'package:rose/data/chat_request_data.dart';
import 'package:rose/data/chat_response_data.dart';
import 'package:rose/models/color.dart';
import 'package:rose/utilities/utility.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ChatText extends StatefulWidget {
  const ChatText({Key? key, required this.changeIndex}) : super(key: key);
  final Function changeIndex;
  @override
  _ChatTextState createState() => _ChatTextState();
}

class _ChatTextState extends State<ChatText> {
  late final getChatRes = getChat();
  List messageList = [];
  int? sessionId;
  int msgNum = 1;
  ChatRequestVO chatRequestVO = ChatRequestVO();
  ChatResponseVO chatResponseVO = ChatResponseVO();

  String _textFormFieldValue = "";

  Future<ChatResponseVO> getChat() async {
    context.loaderOverlay.show();
    final res = await ChatApi().getChat(chatRequestVO);
    setState(() {
      if (chatResponseVO != null) {
        chatResponseVO = res;
        sessionId = res.sessionId;
        messageList.add(chatResponseVO);
        context.loaderOverlay.hide();
      }
    });
    return chatResponseVO;
  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
        child: Column(
      children: [
        Container(
          height: 20,
        ),
        Container(
            height: 130,
            width: MediaQuery.of(context).size.width - 30,
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
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 15,
                    ),
                    Text(
                      "월디는 말도 잘 알아 들어요!",
                      style: TextStyle(
                        fontFamily: "medium",
                        fontSize: 16,
                        color: fromHex(GrayScale.Black),
                      ),
                    ),
                    Container(
                      height: 10,
                    ),
                    Text(
                      "궁금한 점을 아래 버튼을 누르고 적어주세요!",
                      style: TextStyle(
                        fontFamily: "medium",
                        fontSize: 12,
                        color: fromHex(GrayScale.Black),
                      ),
                    ),
                    Container(
                      height: 10,
                    ),
                    Text(
                      "말로 물어보고 싶으면",
                      style: TextStyle(
                        fontFamily: "medium",
                        fontSize: 12,
                        color: fromHex(GrayScale.Black),
                      ),
                    ),
                    Container(
                      height: 10,
                    ),
                    Text(
                      "\"말로 물어보기\"를 눌러주세요",
                      style: TextStyle(
                        fontFamily: "medium",
                        fontSize: 12,
                        color: fromHex(GrayScale.Black),
                      ),
                    )
                  ],
                ),
              ],
            )),
        const SizedBox(
          height: 10,
        ),
        Expanded(
            child: ListView(
          children: [
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
                                offset:
                                    Offset(0, 3), // changes position of shadow
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
                  chat.msgType == 1 && chat.status == "True"
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
                                    margin: const EdgeInsets.only(
                                        top: 10, bottom: 10),
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
                                            MediaQuery.of(context).size.width -
                                                280,
                                        decoration: BoxDecoration(
                                          color: fromHex('#040C56'),
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
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
                                                  chat.lectureUrl)) {
                                                await launchUrlString(
                                                    chat.lectureUrl,
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
                                                    color: fromHex(
                                                        GrayScale.White),
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
        )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 80,
              child: TextFormField(
                  decoration: const InputDecoration(counterText: ''),
                  onChanged: (value) {
                    setState(() {
                      _textFormFieldValue = value;
                    });
                  }),
            ),
            Container(
                height: 40,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: TextButton(
                  onPressed: () async {
                    chatRequestVO = ChatRequestVO(
                        clientId: 1,
                        sessionId: sessionId,
                        msgNum: msgNum,
                        msgType: 0,
                        text: _textFormFieldValue);
                    print(chatRequestVO.toJson());
                    getChat();
                    setState(() {
                      messageList.add(chatRequestVO);
                      msgNum = msgNum + 2;
                      _textFormFieldValue = "";
                    });
                  },
                  child: Text(
                    "전송",
                    style: TextStyle(
                      fontFamily: "medium",
                      fontSize: 14,
                      color: fromHex(GrayScale.Black),
                    ),
                  ),
                )),
          ],
        ),
      ],
    ));
  }
}
