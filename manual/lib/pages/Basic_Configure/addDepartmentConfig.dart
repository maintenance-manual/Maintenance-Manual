import 'dart:io';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manual/model/departmentvView_model.dart';
import 'package:manual/provide/departmentname_config_provide.dart';
import 'package:provide/provide.dart';

String isAddDepartment;
String addDepartment;
//读取后台接口
Future getAddDepartmentname() async {
  try {
    Dio dio = Dio();
    dio.options.contentType =
        ContentType.parse("application/x-www-form-urlencoded");
    Response response = await dio.get(
        "http://47.93.54.102:5000/basicConfigurations/department/add?addDepartment=$addDepartment",
        options: Options(
          responseType: ResponseType.plain,
        ));
    return response.data;
  } catch (e) {
    print(e);
  }
}

class AddDepartmentConfig extends StatefulWidget {
  AddDepartmentConfig({Key key}) : super(key: key);

  _AddDepartmentConfigState createState() => _AddDepartmentConfigState();
}

class _AddDepartmentConfigState extends State<AddDepartmentConfig> {
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();

//添加部门
  void addDepart() {
    var loginForm = loginKey.currentState;
    if (loginForm.validate()) {
      loginForm.save();
      getAddDepartmentname().then((val) {
        var data = json.decode(val.toString());
        DepartmentCreateNew departmentCreateNew =
            DepartmentCreateNew.fromJson(data);
        setState(() {
          isAddDepartment = departmentCreateNew.isAddDepartment;
        });
        Provide.value<UserDepartmentModelProvide>(context).adddepartmentname(addDepartment);
        if (isAddDepartment.contains("true")) {
          Navigator.pop(context); //如果返回true，说明之前不存在该部门
        } else {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('该部门已存在'),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      '确定',
                      style: TextStyle(fontSize: ScreenUtil().setSp(25.0)),
                    ),
                  ),
                ],
              );
            },
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新增部门配置'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: ScreenUtil().setHeight(940),
          child: _addDepartmentConfig(context),
        ),
      ),
    );
  }

  Widget _addDepartmentConfig(context) {
    return Scaffold(
      body: Container(
        width: ScreenUtil().setWidth(740),
        height: ScreenUtil().setHeight(450),
        padding: EdgeInsets.all(10.0),
        child: Form(
          key: loginKey,
          child: Column(
            children: <Widget>[
              Container(
                height: ScreenUtil().setHeight(110),
                child: TextFormField(
                  decoration: new InputDecoration(
                    labelText: '请创建部门名称',
                  ),
                  onSaved: (value) {
                    addDepartment = value;
                  },
                  validator: (value) {
                    if (value.length == 0) return '创建部门不允许为空';
                  },
                  // onFieldSubmitted: (value) {},
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(6.0),
                      child: SizedBox(
                        width: ScreenUtil().setWidth(300),
                        height: ScreenUtil().setHeight(100),
                        child: RaisedButton(
                          onPressed: () {
                            addDepart();
                          },
                          child: Text('创建'),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(6.0),
                      child: SizedBox(
                        width: ScreenUtil().setWidth(300),
                        height: ScreenUtil().setHeight(100),
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('返回上一页'),
                        ),
                      ),
                    ),
                  ],
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
