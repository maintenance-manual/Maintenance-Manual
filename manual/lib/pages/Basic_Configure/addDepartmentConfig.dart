import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddDepartmentConfig extends StatelessWidget {
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  String departmentConfifName;

 void login() {
    var loginForm = loginKey.currentState;
    if (loginForm.validate()) {
      loginForm.save();
      print(departmentConfifName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新增部门配置'),
      ),
      body: Container(
          child: _addDepartmentConfig(context),
      ),
    );
  }

  Widget _addDepartmentConfig(context) {
    return Scaffold(
      body: Container(
        width: ScreenUtil().setWidth(740),
        height: ScreenUtil().setHeight(500),
        padding: EdgeInsets.all(10.0),
        color: Colors.pink,
        child: Form(
          key: loginKey,
          child: Column(
            children: <Widget>[
              Container(
                height: ScreenUtil().setHeight(100),
                child:  TextFormField(
                decoration: new InputDecoration(
                  labelText: '请创建部门名称',
                ),
                onSaved: (value) {
                  departmentConfifName = value;
                },
                validator: (value) {
                  return null;
                },
                onFieldSubmitted: (value) {},
              ),
              ),
              new Divider(),
              new SizedBox(
                width: ScreenUtil().setWidth(750),
                height: ScreenUtil().setHeight(100),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.pop(context, departmentConfifName);
                  },
                  child: Text('创建'),
                ),
              ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }
}
