import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:manual/config/service_url.dart';
import 'package:manual/service/service_method.dart';
import 'main_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io';
import 'package:dio/dio.dart';

void getHttp() async {
  try {
    Response response = await Dio().get("http://47.93.54.102:5000/login?username=test&password=test");
    print(response);
  } catch (e) {
    print(e);
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  var _userNameTextFieldController;
  var _passwordTextFieldController;
  var userName;
  var password;

  void login() {
    var loginForm = loginKey.currentState;
    if (loginForm.validate()) {
      loginForm.save();
      print('userName:' + userName + ' password:' + password);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => MainPage()));
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    // _getData();
    getHttp();
    super.initState();
  }

  // void _getData() async{
  //   var data = {
  //     "username":"test",
  //     "password":"test",
  //   };
  //   await request('loginContent',formData: data).then((val){
  //     var data = json.decode(val.toString());
  //     print('手册浏览数据==========>$data');
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    // print('设备高度：${ScreenUtil.screenHeight}');
    // print('设备宽度：${ScreenUtil.screenWidth}');
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(60.0, 20.0, 50.0, 20.0),
            height: ScreenUtil().setHeight(525),
            width: ScreenUtil().setWidth(1080),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.blueGrey[400],
                Colors.blue[600],
                Colors.lightBlue[700]
              ]),
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.elliptical(20, 10)),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(1.0, 1.0),
                    blurRadius: 10.0,
                    spreadRadius: 2.0)
              ],
            ),
            child: Text(
              '登录',
              style: TextStyle(color: Colors.white, fontSize: 50.0),
            ),
          ),
          Container(
            child: Form(
              key: loginKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                verticalDirection: VerticalDirection.down,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(60.0, 80.0, 60.0, 5.0),
                    child: TextFormField(
                      autofocus: false,
                      style: TextStyle(color: Colors.black26, fontSize: 18.0),
                      decoration: InputDecoration(hintText: '请输入用户名'),
                      textAlign: TextAlign.center,
                      controller: _userNameTextFieldController,
                      obscureText: false,
                      onSaved: (value) {
                        userName = value;
                      },
                      onFieldSubmitted: (value) {},
                      validator: (value) {
                        if (value.length == 0) {
                          return "用户名不能为空";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(60.0, 20.0, 60.0, 55.0),
                    child: TextFormField(
                      autofocus: false,
                      style: TextStyle(color: Colors.black26, fontSize: 18.0),
                      decoration: InputDecoration(hintText: '请输入密码'),
                      textAlign: TextAlign.center,
                      controller: _passwordTextFieldController,
                      obscureText: true,
                      onSaved: (value) {
                        password = value;
                      },
                      validator: (value) {
                        if (value.length == 0) {
                          return "密码不能为空";
                        } else if (value.length < 6) {
                          return "密码长度不够6位";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  Container(
                    height: 45.0,
                    child: RaisedButton(
                      elevation: 1.5,
                      child: Text(
                        '登录',
                        style: TextStyle(color: Colors.black, fontSize: 18.0),
                      ),
                      color: Colors.white,
                      padding: EdgeInsets.fromLTRB(35.0, 6.0, 35.0, 6.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      onPressed: login,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      resizeToAvoidBottomPadding: false,
    );
  }
}
