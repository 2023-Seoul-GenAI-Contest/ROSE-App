import 'package:flutter/material.dart';
import 'package:rose/models/color.dart';
import 'package:rose/screens/component/chat_text.dart';
import 'package:rose/screens/component/chat_voice.dart';
import 'package:rose/screens/component/home.dart';
import 'package:rose/screens/component/lecture/lecture_main.dart';
import 'package:rose/screens/component/my.dart';
import 'package:rose/screens/component/recommand.dart';
import 'package:rose/utilities/utility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;
  int _pageIndex = 0;
  String _showChatText = "월디에게 물어보세요!";

  @override
  void initState() {
    super.initState();
  }

  void _onItemTapped(int index) {
    if (index != 1) {
      setState(() {
        _pageIndex = index;
        _selectedIndex = index;
        _showChatText = "월디에게 물어보세요!";
      });
    }
  }

  void changeChatMode(int index) {
    if (index == 5) {
      setState(() {
        _pageIndex = 6;
        _showChatText = "말로 물어보기";
      });
    } else if (index == 6) {
      setState(() {
        _pageIndex = 5;
        _showChatText = "글로 물어보기!";
      });
    } else {
      setState(() {
        _pageIndex = 5;
        _showChatText = "글로 물어보기!";
      });
    }
  }

  void changeIndex(String index) {
    if (index == "recommand") {
      setState(() {
        _pageIndex = 3;
      });
    } else if (index == "lecture") {
      setState(() {
        _pageIndex = 4;
      });
    } else if (index == "chat_voice") {
      setState(() {
        _pageIndex = 5;
      });
    } else if (index == "chat_text") {
      setState(() {
        _pageIndex = 6;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          title: Image.asset(
            'assets/img/educampus-logo.png',
            fit: BoxFit.cover,
            width: 140,
          ),
          toolbarHeight: 70,
        ),
        body: (() {
          switch (_pageIndex) {
            case 0:
              return Home(changeIndex: changeIndex);
            case 2:
              return My(changeIndex: changeIndex);
            case 3:
              return Recommand(changeIndex: changeIndex);
            case 4:
              return LectureMain(changeIndex: changeIndex);
            case 5:
              return ChatVoice(changeIndex: changeIndex);
            case 6:
              return ChatText(changeIndex: changeIndex);
          }
        })(),
        floatingActionButton: FloatingActionButton.large(
          backgroundColor: _pageIndex == 5 || _pageIndex == 6
              ? fromHex('#94B2FF')
              : fromHex('#040C56'),
          onPressed: () {
            changeChatMode(_pageIndex);
          },
          child: _pageIndex == 5
              ? Image.asset(
                  'assets/img/center-chat.png',
                  height: 140,
                )
              : _pageIndex == 6
                  ? Image.asset(
                      'assets/img/center-voice.png',
                      height: 140,
                    )
                  : Image.asset(
                      'assets/img/center-btn.png',
                      height: 140,
                    ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: SizedBox(
            height: 80,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              elevation: 13.0,
              items: <BottomNavigationBarItem>[
                const BottomNavigationBarItem(
                  icon: Icon(Icons.home, size: 40),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.search, size: 40),
                  label: _showChatText,
                ),
                const BottomNavigationBarItem(
                  icon: Icon(Icons.person, size: 40),
                  label: 'My Page',
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            )));
  }
}
