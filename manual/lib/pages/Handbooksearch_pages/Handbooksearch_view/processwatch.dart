/**
 * 程序流程查看
 */
import 'package:flutter/material.dart';

class ProcessWatch extends StatefulWidget {
  ProcessWatch({Key key}) : super(key: key);

  @override
  _ProcessWatchState createState() => _ProcessWatchState();
}

class _ProcessWatchState extends State<ProcessWatch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title:Text('程序流程查看')),
       body:Text('data'),
    );
  }
}