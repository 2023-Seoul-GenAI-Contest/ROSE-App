import 'package:flutter/material.dart';
import 'package:rose/models/color.dart';
import 'package:rose/screens/component/home.dart';
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

  void _onItemTapped(int index) {
    if (index != 1) {
      setState(() {
        _selectedIndex = index;
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
      body: const Home(),
      floatingActionButton: Container(
        height: 100.0,
        width: 100.0,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () async {
              // await availableCameras().then((value) => Navigator.push(context,
              //     MaterialPageRoute(builder: (_) => Freeze(cameras: value))));
            },
            child: Icon(Icons.camera_alt_rounded),
            backgroundColor: fromHex(Signiture.PrimaryNormal),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: SizedBox(
            height: 80,
            child: BottomNavigationBar(
              elevation: 13.0,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, size: 50),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.search, size: 40),
                  label: '글로 물어보기',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person, size: 50),
                  label: 'My Page',
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
            )),
      ),
      //
    );
  }
}
