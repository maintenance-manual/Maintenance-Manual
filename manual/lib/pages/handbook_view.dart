import 'package:flutter/material.dart';

class HandBookView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Text('手册浏览'),
      ),
      body: Text('这里是手册浏览界面'),
    ));
  }
}
