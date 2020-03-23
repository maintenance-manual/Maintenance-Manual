import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:manual/model/userDetailsModel.dart';
import 'package:manual/provide/userDetailsModelProvide.dart';
import 'package:manual/service/service_method.dart';
import 'package:provide/provide.dart';
import 'main_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io';
import 'package:dio/dio.dart';

var userName;
var password;

var userListRight1;
var userListRight2;
var userListRight3;
var userListRight4;
Future getHttp() async {
  try {
    Dio dio = Dio();
    dio.options.contentType =
        ContentType.parse("application/x-www-form-urlencoded");
    Response response = await dio.get(
        "http://47.93.54.102:5000/login/?username=$userName&password=$password",
        options: Options(
          responseType: ResponseType.plain,
        ));
    print(response);
    return response.data;
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
  String userisLogin;
  List userList;
  var _userNameTextFieldController;
  var _passwordTextFieldController;

  Widget login() {
    var loginForm = loginKey.currentState;
    if (loginForm.validate()) {
      loginForm.save();
      print('userName:' + userName + ' password:' + password);
      getHttp().then((val) {
        var data = json.decode(val.toString());
        UserDetailsModel userList = UserDetailsModel.fromJson(data);
        setState(() {
          //userList = userList;
          userisLogin = userList.login;
          userListRight1 = userList.right1;
          userListRight2 = userList.right2;
          userListRight3 = userList.right3;
          userListRight4 = userList.right4;
        });
        print('开始获取用户数据......');
        Provide.value<UserDetailsModelProvide>(context)
            .getuserDetails(userList);
        print(userList.toJson());
        if (userisLogin.contains("true")) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => MainPage(userName, userListRight1,
                  userListRight2, userListRight3, userListRight4)));
        } else {
          print('该用户不具备相应权限');
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('用户名或密码错误'),
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
  void initState() {
    // TODO: implement initState
    // _getData();
    // getHttp();
    super.initState();
  }

  void _getData() async {
    await request('handbookview').then((val) {
      var data = json.decode(val.toString());
      print('手册浏览数据==========>$data');
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: true);
    // print('设备高度：${ScreenUtil.screenHeight}');

    // print('设备宽度：${ScreenUtil.screenWidth}');

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                          } else if (value.length < 3) {
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
      ),
      resizeToAvoidBottomPadding: true,
    );
  }
}
