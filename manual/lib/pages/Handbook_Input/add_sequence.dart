import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_file/open_file.dart';

class AddNewSequence extends StatefulWidget {
  @override
  _AddNewSequenceState createState() => _AddNewSequenceState();
}

class _AddNewSequenceState extends State<AddNewSequence> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('手册程序电子化管理系统'),
      ),
      body: Center(
        child: Text('这是新建程序界面'),
      ),
    );
  }
}