import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:manual/service/service_method.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manual/login_page.dart';

class AddDepartmentConfig extends StatelessWidget {
  const AddDepartmentConfig({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _addDepartmentConfig(),
    );
  }

  Widget _addDepartmentConfig() {
    return Scaffold(
      body: Container(
        width: ScreenUtil().setWidth(740),
        height: ScreenUtil().setHeight(350),
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.only(top: 25.0),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            new TextFormField(
              decoration: new InputDecoration(
                labelText: '请创建部门名称',
              ),
            ),
            new Divider(),
            new SizedBox(
              width: ScreenUtil().setWidth(750),
              height: ScreenUtil().setHeight(100),
              child: RaisedButton(
                onPressed: () {},
                child: Text('创建'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
