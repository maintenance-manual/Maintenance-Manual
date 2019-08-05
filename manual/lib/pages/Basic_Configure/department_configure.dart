import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:manual/service/service_method.dart';

class DepartmentConfigure extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Text('部门配置'),
      ),
      body: Text('这里是部门配置界面'),
    ));
  }
}
