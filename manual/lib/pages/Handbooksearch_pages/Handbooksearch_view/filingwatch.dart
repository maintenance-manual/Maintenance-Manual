/**
 * 存档信息查看
 */
import 'package:flutter/material.dart';

class FilingWatch extends StatefulWidget {
  FilingWatch({Key key}) : super(key: key);

  @override
  _FilingWatchState createState() => _FilingWatchState();
}

class _FilingWatchState extends State<FilingWatch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('存档信息查看')),
      body: Text('data'),
    );
  }
}
