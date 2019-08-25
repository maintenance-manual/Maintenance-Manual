import 'package:flutter/material.dart';
import 'package:manual/service/service_method.dart';
import './addPostConfig.dart';  //引入新增岗位页面;

class PostConfigure extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Text('岗位配置'),
      ),
      body: Text('这里是岗位配置界面'),
       floatingActionButton: new Builder(builder: (BuildContext context) {  //悬浮按钮用来新建;
          return FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: Colors.grey,
              foregroundColor: Colors.white,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddPostConfig()));
              },
              mini: false,
              shape: CircleBorder(),
              isExtended: false,
            );
        }),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked
    ));
  }
}
