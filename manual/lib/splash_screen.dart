import 'package:flutter/material.dart';
import 'login_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {

  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this,duration: Duration(milliseconds: 3000));
    _animation = Tween(begin: 0.0,end: 1.0).animate(_controller);

    _animation.addStatusListener((status){
      if(status == AnimationStatus.completed)
      {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>LoginPage()), (route)=>route==null);
      }
    });

    _controller.forward();//播放动画

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
        'assets/login1.jpg',
        scale: 2.0,
        fit: BoxFit.cover,
        ),
    );
  }
}