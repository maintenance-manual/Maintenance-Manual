import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:manual/service/service_method.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Basic_Configure/addDepartmentConfig.dart'; //引入新增部门页面;

class DepartmentConfigure extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('部门配置'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              DepartmentConfigureDemo(),
            ],
          ),
        ),
        floatingActionButton: new Builder(builder: (BuildContext context) {  //悬浮按钮用来新建;
          return FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: Colors.grey,
              foregroundColor: Colors.white,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddDepartmentConfig()));
              },
              mini: false,
              shape: CircleBorder(),
              isExtended: false,
            );
        }),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked
      ),
    );
  }
}

//部门名称下列表组件
class DepartmentConfigureDemo extends StatefulWidget {
  DepartmentConfigureDemo({Key key}) : super(key: key);

  _DepartmentConfigureDemoState createState() =>
      _DepartmentConfigureDemoState();
}

class _DepartmentConfigureDemoState extends State<DepartmentConfigureDemo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('部门浏览'),
    );
  }
}
