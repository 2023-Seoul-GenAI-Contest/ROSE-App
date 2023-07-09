import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:rose/api/chat.dart';
import 'package:rose/data/chat_request_data.dart';
import 'package:rose/data/chat_response_data.dart';
import 'package:rose/models/color.dart';
import 'package:rose/utilities/utility.dart';
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

import 'package:url_launcher/url_launcher_string.dart';

class ChatVoice extends StatefulWidget {
  const ChatVoice({Key? key, required this.changeIndex}) : super(key: key);
  final Function changeIndex;
  @override
  _ChatVoiceState createState() => _ChatVoiceState();
}

class _ChatVoiceState extends State<ChatVoice> {
  final _audioRecorder = Record();
  bool _isRecording = false;
  ChatRequestVO chatRequestVO = ChatRequestVO();
  List messageList = [];
  int msgNum = 1;
  int? sessionId;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _audioRecorder.dispose();
    super.dispose();
  }

  Future<void> _start() async {
    if (await _audioRecorder.hasPermission()) {
      // We don't do anything with this but printing
      final isSupported = await _audioRecorder.isEncoderSupported(
        AudioEncoder.aacLc,
      );
      final dir = await getApplicationDocumentsDirectory();
      var path = dir.path;
      await _audioRecorder.start(
        path: '$path/voice.aac',
      );
    }
  }

  Future<void> _stop() async {
    final path = await _audioRecorder.stop();
    context.loaderOverlay.show();
    final getRes = await ChatApi().getChatVoice(path ?? '');
    chatRequestVO = ChatRequestVO(
        clientId: 1,
        sessionId: sessionId,
        msgNum: msgNum,
        msgType: 0,
        text: getRes);
    setState(() {
      messageList.add(chatRequestVO);
    });
    final chatResponseVO = await ChatApi().getChat(chatRequestVO);
    if (chatResponseVO != null) {
      setState(() {
        sessionId = chatResponseVO.sessionId;
        msgNum = msgNum + 2;
        messageList.add(chatResponseVO);
      });
      context.loaderOverlay.hide();
    }
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
                        fontSize: 14,
                        color: fromHex(GrayScale.Black),
                      ),
                    ),
                    Container(
                      height: 10,
                    ),
                    Text(
                      "궁금한 점을 아래 버튼을 누르고 말해주세요!",
                      style: TextStyle(
                        fontFamily: "medium",
                        fontSize: 10,
                        color: fromHex(GrayScale.Black),
                      ),
                    ),
                    Container(
                      height: 10,
                    ),
                    Text(
                      "글로 물어보고 싶으면",
                      style: TextStyle(
                        fontFamily: "medium",
                        fontSize: 10,
                        color: fromHex(GrayScale.Black),
                      ),
                    ),
                    Container(
                      height: 10,
                    ),
                    Text(
                      "\"글로 물어보기\"를 눌러주세요",
                      style: TextStyle(
                        fontFamily: "medium",
                        fontSize: 10,
                        color: fromHex(GrayScale.Black),
                      ),
                    )
                  ],
                ),
              ],
            )),
        Container(
          height: 10,
        ),
        Container(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 15,
                    ),
                    Text(
                      "원하시는 것을 말씀해주세요",
                      style: TextStyle(
                        fontFamily: "bold",
                        fontSize: 20,
                        color: fromHex(GrayScale.Black),
                      ),
                    ),
                    Container(
                      height: 10,
                    ),
                    SizedBox(
                      height: 70.0,
                      width: 70.0,
                      child: IconButton(
                          color: _isRecording
                              ? fromHex(Signiture.PrimaryNormal)
                              : fromHex(GrayScale.Black),
                          onPressed: () => {
                                _isRecording ? _stop() : _start(),
                                setState(() {
                                  _isRecording = !_isRecording;
                                })
                              },
                          icon: new Icon(Icons.mic, size: 70.0)),
                    ),
                    Container(
                      height: 10,
                    ),
                    _isRecording
                        ? Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              "듣고 있어요!",
                              style: TextStyle(
                                fontFamily: "medium",
                                fontSize: 16,
                                color: fromHex(GrayScale.Black),
                              ),
                            ))
                        : Text(""),
                    Text(
                      "예시) 키오스크 사용법을 알려줘! / 카카오톡은 어떻게 쓰는거야?",
                      style: TextStyle(
                        fontFamily: "medium",
                        fontSize: 10,
                        color: fromHex(GrayScale.Black),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 30,
                ),
              ],
            )),
        Container(
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
      ],
    ));
  }
}
