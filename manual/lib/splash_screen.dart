import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'dart:io';
import 'dart:convert';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 3000));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);

    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => LoginPage()),
            (route) => route == null);
      }
    });

    _controller.forward(); //播放动画
  }
  @override
  void setState(fn) {
    // TODO: implement setState
    _getpost();
    super.setState(fn);
  }
  void _getpost()async{
    try{
      Response response;
      response = await Dio().get('http://47.93.54.102:5000/read/readHandbook');
      print("獲取數據");
      return print(response);
    }catch(e){
      return print(e);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _animation,
      child: Image.asset(
        'assets/login2.jpg',
        scale: 2.0,
        fit: BoxFit.cover,
      ),
    );
  }
}
