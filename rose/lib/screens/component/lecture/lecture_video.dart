import 'package:flutter/material.dart';
import 'package:rose/api/lecture.dart';
import 'package:rose/data/keyword.dart';
import 'package:rose/models/color.dart';
import 'package:rose/screens/component/lecture/lecture_summery.dart';
import 'package:rose/utilities/utility.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

/// Stateful widget to fetch and then display video content.
class VideoApp extends StatefulWidget {
  const VideoApp({super.key, required this.lectureId, required this.videoUrl});
  final String videoUrl;
  final int lectureId;
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;
  List<KeywordVO> keyWordList = [];
  late final keywordList = setKeywordList();
  bool _openDesc = false;
  bool _openKey = false;
  String? pointName = "";
  String? pointDesc = "";
  Icon _icon = Icon(Icons.play_arrow);

  Future<List<KeywordVO>> setKeywordList() async {
    final keywordListRes =
        await LectureApi().getLectureKeyword(widget.lectureId);
    setState(() {
      if (keywordListRes != null) {
        keyWordList = keywordListRes;
      }
    });
    return keywordListRes;
  }

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(
      Uri.parse(widget.videoUrl),
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );

    _controller.addListener(() {
      if (_controller.value.duration == _controller.value.position) {
        _icon = const Icon(Icons.next_plan);
      } else if (_controller.value.isPlaying) {
        setState(() {
          _icon = const Icon(Icons.pause);
        });
      } else {
        setState(() {
          _icon = const Icon(Icons.play_arrow);
        });
      }
      for (var pointKeyword in keyWordList) {
        if (pointKeyword.time ==
            _controller.value.position.inSeconds.toString()) {
          setState(() {
            _openKey = true;
            pointName = pointKeyword.name;
            pointDesc = pointKeyword.describe;
          });
        }
      }
    });
    _controller.setLooping(false);
    _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: keywordList,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            EasyLoading.dismiss();
            return Scaffold(
              backgroundColor: Colors.white,
              body: Stack(
                children: [
                  _controller.value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller))
                      : Container(),
                  _openDesc
                      ? Positioned(
                          bottom: 20,
                          left: 20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width - 30,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Container(
                                    padding: EdgeInsets.all(10),
                                    child: Text(pointDesc ?? "default",
                                        style: TextStyle(
                                          fontFamily: "medium",
                                          fontSize: 16,
                                          color: fromHex(GrayScale.Black),
                                        ))),
                              ),
                            ],
                          ))
                      : Container(),
                  Positioned(
                      bottom: 0,
                      width: MediaQuery.of(context).size.width,
                      child: VideoProgressIndicator(
                        _controller,
                        allowScrubbing: false,
                        colors: const VideoProgressColors(
                            backgroundColor: Colors.blueGrey,
                            bufferedColor: Colors.blueGrey,
                            playedColor: Colors.blueAccent),
                      )),
                ],
              ),
              bottomSheet: SizedBox(
                  // SizedBox로 감싸고 height로 높이를 설정.
                  height: 100,
                  child: Column(
                    children: [
                      Container(
                        height: 20,
                      ),
                      Text("키워드를 눌러보세요!",
                          style: TextStyle(
                            fontFamily: "medium",
                            fontSize: 16,
                            color: fromHex(GrayScale.Black),
                          )),
                      Center(
                        child: _openKey
                            ? ElevatedButton(
                                child: Text(pointName ?? "default"),
                                onPressed: () => {
                                  setState(() {
                                    _openDesc = !_openDesc;
                                  })
                                },
                              )
                            : Container(),
                      ),
                    ],
                  )),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    if (_controller.value.duration ==
                        _controller.value.position) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LectureSummery(
                                  keywords: keyWordList,
                                  lectureId: widget.lectureId)));
                    } else {
                      _controller.value.isPlaying
                          ? _controller.pause()
                          : _controller.play();
                    }
                  });
                },
                child: _icon,
              ),
            );
          } else {
            return Stack(
              children: [
                Positioned.fill(
                  top: 190,
                  child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 200,
                        child: Image.asset(
                          'assets/img/run.png',
                          height: 500,
                        ),
                      )),
                ),
                Positioned.fill(
                  child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          height: 140,
                          child: Text(
                            "생성형 AI가 키워드를 만들고 있어요.",
                            style: TextStyle(
                              fontFamily: "medium",
                              fontSize: 18,
                              color: fromHex(GrayScale.Black),
                            ),
                          ))),
                ),
                const Positioned.fill(
                  top: 180,
                  child: Align(
                      alignment: Alignment.center,
                      child: CircularProgressIndicator()),
                )
              ],
            );
          }
        });
  }
}
