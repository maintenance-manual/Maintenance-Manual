import 'package:flutter/material.dart';
import 'package:manual/service/service_method.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class SequencingInput extends StatefulWidget {
  @override
  _SequencingInputState createState() => _SequencingInputState();
}

class _SequencingInputState extends State<SequencingInput> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('手册程序电子化管理系统'),
      ),
      body: Container(
        child: Center(
          child: Text('这是程序录入界面'),
        ),
      ),
    );
  }
}