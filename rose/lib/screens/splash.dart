import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rose/screens/app.dart';
import 'package:rose/utilities/utility.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    const duration = Duration(seconds: 5);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const App()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 150,
            ),
            Container(
              height: 198,
              margin: const EdgeInsets.only(left: 10),
              // alignment: Alignment.center,
              child: Image.asset(
                'assets/img/hello.png',
                height: 300,
              ),
            ),
            Container(height: 15),
            const Text("월디:로즈",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'bold',
                )),
            Container(height: 20),
            const Text("[Worldy : Robot Online Smart Education]",
                style: TextStyle(
                  fontSize: 13,
                  fontFamily: 'light',
                )),
            Container(height: 50),
            Container(
              height: 200,
              margin: const EdgeInsets.only(left: 10),
              // alignment: Alignment.center,
              child: Image.asset(
                'assets/img/1.png',
                width: 200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
