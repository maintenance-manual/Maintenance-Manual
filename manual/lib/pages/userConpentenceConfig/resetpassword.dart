import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manual/model/userconpentence_configModel.dart';
import 'package:manual/pages/Basic_Configure/addDepartmentConfig.dart';
import 'package:manual/pages/Basic_Configure/addPeopleConfig.dart';

//重置员工密码接口
Future resetpassword(tempname1) async {
  try {
    Dio dio = Dio();
    dio.options.contentType =
        ContentType.parse("application/x-www-form-urlencoded");
    Response response = await dio.get(
        "http://47.93.54.102:5000/rightConfiguration/reset?username=$tempname1",
        options: Options(
          responseType: ResponseType.plain,
        ));
    print(response.data);
    return response.data;
  } catch (e) {
    print(e);
  }
}

String tempname1; //名字
String tempdepartmentname1; //部门名字;
String tempPostConfigname1; //岗位名字;
String isResetRight;

class ResetPassword extends StatefulWidget {
  String tempname; //名字
  String tempdepartmentname; //部门名字;
  String tempPostConfigname; //岗位名字;

  ResetPassword(
      this.tempdepartmentname, this.tempPostConfigname, this.tempname) {
    tempname1 = this.tempname;
    tempdepartmentname1 = this.tempdepartmentname;
    tempPostConfigname1 = this.tempPostConfigname;
  }

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
//重置密码
  void resetpassword1(tempname1) {
    resetpassword(tempname1).then((val) {
      var data = json.decode(val.toString());
      ResetpasswordModel resetpasswordlist = ResetpasswordModel.fromJson(data);
      setState(() {
        isResetRight = resetpasswordlist.isResetRight;
      });
      print(isResetRight);
      if (isResetRight.contains("true")) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('重置成功'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('重置密码'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(100),
            decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: 2.0, color: Colors.black26)),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  width: ScreenUtil().setWidth(180),
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    '部门名称：   ',
                    style: TextStyle(fontSize: ScreenUtil().setSp(31.0)),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: ScreenUtil().setWidth(570),
                  child: Text(
                    '$tempdepartmentname1',
                    style: TextStyle(fontSize: ScreenUtil().setSp(34.0)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(100),
            decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: 2.0, color: Colors.black26)),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  width: ScreenUtil().setWidth(180),
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    '岗位名称：   ',
                    style: TextStyle(fontSize: ScreenUtil().setSp(31.0)),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: ScreenUtil().setWidth(570),
                  child: Text(
                    '$tempPostConfigname1',
                    style: TextStyle(fontSize: ScreenUtil().setSp(34.0)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(100),
            decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: 2.0, color: Colors.black26)),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  width: ScreenUtil().setWidth(180),
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    '员工姓名：   ',
                    style: TextStyle(fontSize: ScreenUtil().setSp(31.0)),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  width: ScreenUtil().setWidth(570),
                  child: Text(
                    '$tempname1',
                    style: TextStyle(fontSize: ScreenUtil().setSp(34.0)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(100),
            decoration: BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: 2.0, color: Colors.black26)),
            ),
            child: Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(left: 5.0, top: 5.0, bottom: 5.0),
                  child: Text(
                    '是否重置密码：',
                    style: TextStyle(fontSize: ScreenUtil().setSp(45.0)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                new SizedBox(
                  width: ScreenUtil().setWidth(300),
                  height: ScreenUtil().setHeight(100),
                  child: RaisedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text(
                                '你确定要修改此员工权限吗？',
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(36.0)),
                              ),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () {
                                    resetpassword1(tempname1);
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    '确定',
                                    style: TextStyle(
                                        fontSize: ScreenUtil().setSp(25.0)),
                                  ),
                                ),
                                FlatButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    '取消',
                                    style: TextStyle(
                                        fontSize: ScreenUtil().setSp(25.0)),
                                  ),
                                ),
                              ],
                            );
                          });
                    },
                    child: Text('重置'),
                  ),
                ),
                new SizedBox(
                  width: ScreenUtil().setWidth(350),
                  height: ScreenUtil().setHeight(100),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('返回上一页'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
