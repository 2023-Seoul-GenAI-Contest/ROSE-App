import 'package:flutter/material.dart';
import 'package:rose/models/color.dart';
import 'package:rose/utilities/utility.dart';

class ChatVoice extends StatefulWidget {
  const ChatVoice({Key? key, required this.changeIndex}) : super(key: key);
  final Function changeIndex;
  @override
  _ChatVoiceState createState() => _ChatVoiceState();
}

class _ChatVoiceState extends State<ChatVoice> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                Container(
                  width: 15,
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
                      "궁금한 점을 아래 버튼을 누르고 말해주세요!",
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
                      "글로 물어보고 싶으면",
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
                      "\"글로 물어보기\"를 눌러주세요",
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
        Container(
          height: 10,
        ),
        Container(
            height: 180,
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
                        fontSize: 24,
                        color: fromHex(GrayScale.Black),
                      ),
                    ),
                    Container(
                      height: 10,
                    ),
                    IconButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              fromHex('#FFB4B4')),
                        ),
                        color: fromHex('#FFB4B4'),
                        onPressed: () => {},
                        icon: const Icon(Icons.mic)),
                    Container(
                      height: 10,
                    ),
                    Text(
                      "예시) 키오스크 사용법을 알려줘! / 카카오톡은 어떻게 쓰는거야?",
                      style: TextStyle(
                        fontFamily: "medium",
                        fontSize: 12,
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
      ],
    );
  }
}
