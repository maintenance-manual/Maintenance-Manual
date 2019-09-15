import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingProcessDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('手册信息详情页'),
        ),
        body: Container(
          child: _viewPeopleConfig(context),
        ),
      ),
    );
  }

  Widget _viewPeopleConfig(context) {
    return Scaffold(
      body: Container(
        width: ScreenUtil().setWidth(740),
        height: ScreenUtil().setHeight(1100),
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.only(top: 1.0),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 2.0, color: Colors.black26),
                  ),
                ),
                child: Text('修订标识：',
                    style: TextStyle(fontSize: ScreenUtil().setSp(36.0))),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 2.0, color: Colors.black26),
                  ),
                ),
                child: Text('步骤编号： ',
                    style: TextStyle(fontSize: ScreenUtil().setSp(36.0))),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 2.0, color: Colors.black26),
                  ),
                ),
                child: Text('程序流程： ',
                    style: TextStyle(fontSize: ScreenUtil().setSp(36.0))),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 2.0, color: Colors.black26),
                  ),
                ),
                child: Text('责任部门： ',
                    style: TextStyle(fontSize: ScreenUtil().setSp(36.0))),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 2.0, color: Colors.black26),
                  ),
                ),
                child: Text('工作名称： ',
                    style: TextStyle(fontSize: ScreenUtil().setSp(36.0))),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 2.0, color: Colors.black26),
                  ),
                ),
                child: Text('岗位名称： ',
                    style: TextStyle(fontSize: ScreenUtil().setSp(36.0))),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 2.0, color: Colors.black26),
                  ),
                ),
                child: Text('工作规范：',
                    style: TextStyle(fontSize: ScreenUtil().setSp(36.0))),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 2.0, color: Colors.black26),
                  ),
                ),
                child: Text('人员姓名：',
                    style: TextStyle(fontSize: ScreenUtil().setSp(36.0))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
