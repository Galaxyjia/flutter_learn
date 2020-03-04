import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fijkplayer/fijkplayer.dart';
import '../../config/ navigator_util.dart';

class LoginVideo extends StatefulWidget {
  const LoginVideo();
  @override
  _LoginVideoState createState() => _LoginVideoState();
}

class _LoginVideoState extends State<LoginVideo> {
  final FijkPlayer player = FijkPlayer();

  final url =   "https://video.pearvideo.com/mp4/third/20190730/cont-1584187-10136163-164150-hd.mp4";
  @override
  void initState() {
    super.initState();
    player.setLoop(0);
    player.setDataSource(url,autoPlay: true);
  }

  @override
  void dispose() {
    super.dispose();
    player.release();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        FijkView(player: player,
                    fit: FijkFit.cover,),
        Positioned(
          width: MediaQuery.of(context).size.width,
          bottom: 26.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                onPressed: () {
                  NavigatorUtil.goHomePage(context);  // 跳转到Home页面
                },
                child: Container(
                  height: 44.0,
                  width: 240.0,
                  child: Center(
                    child: Text(
                      "微信登录",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                color: Color(0xffFFDB2E),
                textColor: Color(0xff202326),
                elevation: 0.0,
                focusElevation: 0.0,
                highlightElevation: 0.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                onPressed: () {},
                child: Container(
                  height: 44.0,
                  width: 240.0,
                  child: Center(
                    child: Text(
                      "手机号登录",
                      style: TextStyle(
                          fontSize: 15.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                color: Color(0xff202326),
                textColor: Color(0xffededed),
                elevation: 0.0,
                focusElevation: 0.0,
                highlightElevation: 0.0,
              ),
              SizedBox(
                height: 60.0,
              ),
              Text(
                "我已阅读并同意《服务协议》及《隐私政策》",
                style: TextStyle(color: Colors.white, fontSize: 13.0),
              )
            ],
          ),
        ),
        Positioned(
          width: MediaQuery.of(context).size.width,
          top: 80.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "登录",
                style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                "视频背景登录页面",
                style: TextStyle(color: Colors.white, fontSize: 15.0),
              )
            ],
          ),
        )
      ],
    ));
  }
}
