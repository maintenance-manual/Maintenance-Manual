import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:manual/service/service_method.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddPeopleConfig extends StatelessWidget {
  const AddPeopleConfig({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _AddPeopleConfig(),
    );
  }

  Widget _AddPeopleConfig() {
    return Scaffold(
      body: Container(
        width: ScreenUtil().setWidth(740),
        height: ScreenUtil().setHeight(1334),
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.only(top: 25.0),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              new TextFormField(
                decoration: new InputDecoration(
                  labelText: '请输入员工姓名',
                ),
              ),
              new Divider(),
              new TextFormField(
                decoration: new InputDecoration(
                  labelText: '选择性别有待完善',
                ),
              ),
              new Divider(),
              new TextFormField(
                decoration: new InputDecoration(
                  labelText: '请输入电子邮箱',
                ),
              ),
              new Divider(),
              new TextFormField(
                decoration: new InputDecoration(
                  labelText: '请输入电话',
                ),
              ),
              new Divider(),
              new TextFormField(
                decoration: new InputDecoration(
                  labelText: '请选择所属部门',
                ),
              ),
              new Divider(),
              new TextFormField(
                decoration: new InputDecoration(
                  labelText: '请选择岗位名称',
                ),
              ),
              new Divider(),
              new SizedBox(
                width: ScreenUtil().setWidth(750),
                height: ScreenUtil().setHeight(100),
                child: RaisedButton(
                  onPressed: () {},
                  child: Text('新建'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
