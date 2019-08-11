import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
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
                DepartMentConfigShow(),
              ],
            ),
          ),
          floatingActionButton: new Builder(builder: (BuildContext context) {
            //悬浮按钮用来新建;
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
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked),
    );
  }
}

//部门显示目录
class DepartMentConfigShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          _departmentName(),
          _departmentDelete(),
        ],
      ),
    );
  }

  //部门名称目录;
  Widget _departmentName() {
    return Container(
      width: ScreenUtil().setWidth(550),
      height: ScreenUtil().setHeight(80),
      color: Colors.white,
      padding: EdgeInsets.only(top: 2.0),
      child: Text(
        '传入部门名称组件{数组}',
        textAlign: TextAlign.left,
        style:
            TextStyle(color: Colors.black45, fontSize: ScreenUtil().setSp(30)),
      ), //显示部门名称;
    );
  }

  //部门名称删除组件
  Widget _departmentDelete() {
    return Container(
      width: ScreenUtil().setWidth(200),
      height: ScreenUtil().setHeight(80),
      padding: EdgeInsets.all(1.0),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(left: BorderSide(width: 1.0, color: Colors.black45))),
      child: InkWell(
        onTap: () {
        }, //删除
        child: Icon(Icons.delete),
      ),
    );
  }
}
