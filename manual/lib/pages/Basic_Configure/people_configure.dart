import 'package:flutter/material.dart';
import 'package:manual/service/service_method.dart';
import '../Basic_Configure/addPeopleConfig.dart';  //引入人员新建页面;

class PeopleConfigure extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Text('人员配置'),
      ),
      body: Text('这里是人员配置界面'),
      floatingActionButton: new Builder(builder: (BuildContext context) {  //悬浮按钮用来新建;
          return FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: Colors.grey,
              foregroundColor: Colors.white,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddPeopleConfig()));
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
