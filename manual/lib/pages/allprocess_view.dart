import 'package:flutter/material.dart';

class AllProcessView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('手册程序电子化管理系统'),
      ),
      body: Container(
        child: Center(
          child: Text('这是查看所有程序的流程步骤页面'),
        ),
      ),
    );
  }
}