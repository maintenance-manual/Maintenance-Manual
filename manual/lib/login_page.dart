import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var _userNameTextFieldController;
    var _passwordTextFieldController;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(60.0, 50.0, 50.0, 50.0),
            height: 250.0,
            width: 500.0,
            color: Colors.teal,
            child: Text(
              '登录',
              style: TextStyle(color: Colors.black87,fontSize: 50.0),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(60.0, 120.0, 60.0, 5.0),
            child: TextField(
              style: TextStyle(color: Colors.black26, fontSize: 18.0),
              decoration: InputDecoration(hintText: '请输入用户名'),
              textAlign: TextAlign.center,
              controller: _userNameTextFieldController,
              obscureText: false,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(60.0, 20.0, 60.0, 45.0),
            child: TextField(
              style: TextStyle(color: Colors.black26, fontSize: 18.0),
              decoration: InputDecoration(hintText: '请输入密码'),
              textAlign: TextAlign.center,
              controller: _passwordTextFieldController,
              obscureText: true,
            ),
          ),
          Container(
            child: RaisedButton(
              child: Text(
                '登录',
                style: TextStyle(color: Colors.black,fontSize: 18.0),
              ),
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(35.0, 6.0, 35.0, 6.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              onPressed: () {},
            ),
          ),
          Container(
            height: 92.0,
          ),
        ],
      ),
    );
  }
}
