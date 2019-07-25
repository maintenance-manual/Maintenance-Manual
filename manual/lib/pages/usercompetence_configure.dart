import 'package:flutter/material.dart';
import 'package:manual/service/service_method.dart';

class UserCompetence extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Text('用户权限配置'),
      ),
      body: Text('这里是用户权限配置界面'),
    ));
  }
}
