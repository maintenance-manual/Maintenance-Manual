import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manual/pages/usercompetence_configure.dart';
import 'package:manual/provide/userconpentenceModelProvide.dart';
import 'package:provide/provide.dart';

//获取用户权限修改接口;
Future changeUserConpentceConfig(name, right1, right2, right3, right4) async {
  try {
    Dio dio = Dio();
    // dio.options.contentType =
    //     ContentType.parse("application/x-www-form-urlencoded");
    Response response = await dio.get(
        "http://47.93.54.102:5000/rightConfiguration/modify?username=$name&right1=$right1&right2=$right2&right3=$right3&right4=$right4",
        options: Options(
          responseType: ResponseType.plain,
        ));
    print('当前用户权限修改为:>>>');
    print(response.data);
    return response.data;
  } catch (e) {
    print(e);
  }
}

String tempname1; //名字
String tempdepartmentname1; //部门名字;
String tempPostConfigname1; //岗位名字;
bool isCheck1 = false;
bool isCheck2 = false;
bool isCheck3 = false;
bool isCheck4 = false;

class UserConpentenceChange extends StatefulWidget {
  String tempname; //名字
  String tempdepartmentname; //部门名字;
  String tempPostConfigname; //岗位名字;
  String isCheck11;
  String isCheck22;
  String isCheck33;
  String isCheck44;
  UserConpentenceChange(
      this.tempdepartmentname,
      this.tempPostConfigname,
      this.tempname,
      this.isCheck11,
      this.isCheck22,
      this.isCheck33,
      this.isCheck44) {
    tempname1 = this.tempname;
    tempdepartmentname1 = this.tempdepartmentname;
    tempPostConfigname1 = this.tempPostConfigname;
    if (isCheck11.contains("用户权限")) {
      isCheck1 = true;
    } else {
      isCheck1 = false;
    }
    if (isCheck22.contains("手册录入")) {
      isCheck2 = true;
    } else {
      isCheck2 = false;
    }
    if (isCheck33.contains("基本配置")) {
      isCheck3 = true;
    } else {
      isCheck3 = false;
    }
    if (isCheck44.contains("部门配置")) {
      isCheck4 = true;
    } else {
      isCheck4 = false;
    }
  }

  @override
  _UserConpentenceChangeState createState() => _UserConpentenceChangeState();
}

class _UserConpentenceChangeState extends State<UserConpentenceChange> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('权限配置'),
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
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    '请选择需要配置的权限：   ',
                    style: TextStyle(fontSize: ScreenUtil().setSp(32.0)),
                  ),
                ),
              ],
            ),
          ),
          _buttonselect(context),
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
                                    changeUserConpentceConfig(tempname1,
                                        isCheck1, isCheck2, isCheck3, isCheck4);
                                    print("修改成功");
                                    userConpentence();
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
                    child: Text('修改'),
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

//选择按钮组件，为用户配置权限;
  Widget _buttonselect(context) {
    return Container(
      alignment: Alignment.center,
      width: ScreenUtil().setWidth(740),
      height: ScreenUtil().setHeight(120),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(width: 2.0, color: Colors.black26)),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new Checkbox(
                    value: isCheck1,
                    activeColor: Colors.blueGrey,
                    onChanged: (bool val) {
                      setState(() {
                        isCheck1 = val;
                      });
                      print(isCheck1);
                    },
                  ),
                  Text('管理员'),
                ],
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Checkbox(
                    value: isCheck2,
                    activeColor: Colors.blueGrey,
                    onChanged: (bool val) {
                      setState(() {
                        isCheck2 = val;
                      });
                    },
                  ),
                  Text('手册录入'),
                ],
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Checkbox(
                    value: isCheck3,
                    activeColor: Colors.blueGrey,
                    onChanged: (bool val) {
                      setState(() {
                        isCheck3 = val;
                      });
                    },
                  ),
                  Text('基本配置'),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Checkbox(
                    value: isCheck4,
                    activeColor: Colors.blueGrey,
                    onChanged: (bool val) {
                      setState(() {
                        isCheck4 = val;
                      });
                    },
                  ),
                  Text('部门配置'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
