import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:open_file/open_file.dart';

class AddNewWorkbook extends StatefulWidget {
  @override
  _AddNewWorkbookState createState() => _AddNewWorkbookState();
}

class _AddNewWorkbookState extends State<AddNewWorkbook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('手册程序电子化管理系统'),
      ),
      body: Center(
        child: Text('这是工作手册新增界面'),
      ),
    );
  }
}