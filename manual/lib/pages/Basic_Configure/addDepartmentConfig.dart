import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddDepartmentConfig extends StatelessWidget {
  const AddDepartmentConfig({Key key}) : super(key: key);

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
    String departmentConfifName;
    return Scaffold(
      body: Container(
        width: ScreenUtil().setWidth(740),
        height: ScreenUtil().setHeight(350),
        padding: EdgeInsets.all(10.0),
        color: Colors.white,
        child: Column(
          children: <Widget>[
            new TextFormField(
              decoration: new InputDecoration(
                labelText: '请创建部门名称',
              ),
              onSaved:(value){
                departmentConfifName=value;
              },
            ),
            new Divider(),
            new SizedBox(
              width: ScreenUtil().setWidth(750),
              height: ScreenUtil().setHeight(100),
              child: RaisedButton(
                onPressed: () {
                  Navigator.pop(context,departmentConfifName);
                },
                child: Text('创建'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
