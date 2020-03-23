import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePsw extends StatefulWidget {
  @override
  _ChangePswState createState() => _ChangePswState();
}

class _ChangePswState extends State<ChangePsw> {
  GlobalKey<FormState> changePwKey = GlobalKey<FormState>();
  String oldPwText = '';
  String newPwText = '';
  String confirmNewPwText = '';
  void changePw() {
    var changePwForm = changePwKey.currentState;
    if (changePwForm.validate()) {
      changePwForm.save();
      print(oldPwText + ' ' + newPwText + ' ' + confirmNewPwText);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('手册程序电子化管理系统'),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          children: <Widget>[
            Container(
              height: ScreenUtil().setHeight(200),
              width: ScreenUtil().setWidth(750),
              padding: EdgeInsets.only(left: 15.0, top: 15.0),
              child: Text(
                '修改密码',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: ScreenUtil().setSp(50),
                  fontWeight: FontWeight.w600,
                ),
              ),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: Colors.black12))),
            ),
            Container(
              child: Form(
                key: changePwKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  verticalDirection: VerticalDirection.down,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    _setOldPw(),
                    _setNewPw(),
                    _confirmNewPww(),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              child: FlatButton(
                color: Colors.blueGrey[400],
                highlightColor: Colors.blueGrey,
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                child: Text(
                  '确认修改',
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                ),
                padding: EdgeInsets.fromLTRB(13, 4, 13, 4),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                onPressed: changePw,
              ),
            )
          ],
        ),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }

  Widget _setOldPw() {
    return Container(
      height: ScreenUtil().setHeight(180),
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.only(top: 10.0),
      margin: EdgeInsets.only(bottom: 10, top: 35),
      child: Column(
        children: <Widget>[
          Container(
            child: Text(
              '旧密码',
              style: TextStyle(
                  color: Colors.black, fontSize: ScreenUtil().setSp(35)),
            ),
          ),
          Container(
              height: ScreenUtil().setHeight(100),
              child: Padding(
                padding: EdgeInsets.only(left: 35.0, right: 35.0),
                child: TextFormField(
                  autofocus: false,
                  style: TextStyle(color: Colors.black26, fontSize: 18.0),
                  decoration: InputDecoration(),
                  textAlign: TextAlign.center,
                  obscureText: false,
                  onSaved: (value) {
                    oldPwText = value;
                  },
                  validator: (value) {
                    if (value.length == 0) {
                      return "密码不能为空";
                    } else if (value.length < 6) {
                      return "密码长度不够6位";
                    } else {
                      return null;
                    }
                    /** continue...*/
                  },
                  onFieldSubmitted: (value) {},
                  /** continue...*/
                ),
              )),
        ],
      ),
    );
  }

  Widget _setNewPw() {
    return Container(
      height: ScreenUtil().setHeight(180),
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.only(top: 10.0),
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        children: <Widget>[
          Container(
            child: Text(
              '新密码',
              style: TextStyle(
                  color: Colors.black, fontSize: ScreenUtil().setSp(35)),
            ),
          ),
          Container(
              height: ScreenUtil().setHeight(100),
              child: Padding(
                padding: EdgeInsets.only(left: 35.0, right: 35.0),
                child: TextFormField(
                  autofocus: false,
                  style: TextStyle(color: Colors.black26, fontSize: 18.0),
                  decoration: InputDecoration(),
                  textAlign: TextAlign.center,
                  obscureText: false,
                  onSaved: (value) {
                    newPwText = value;
                  },
                  validator: (value) {
                    if (value.length == 0) {
                      return "密码不能为空";
                    } else if (value.length < 6) {
                      return "密码长度不够6位";
                    } else {
                      return null;
                    }
                    /** continue...*/
                  },
                  onFieldSubmitted: (value) {},
                  /** continue...*/
                ),
              )),
        ],
      ),
    );
  }

  Widget _confirmNewPww() {
    return Container(
      height: ScreenUtil().setHeight(180),
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.only(top: 10.0),
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        children: <Widget>[
          Container(
            child: Text(
              '确认新密码',
              style: TextStyle(
                  color: Colors.black, fontSize: ScreenUtil().setSp(35)),
            ),
          ),
          Container(
              height: ScreenUtil().setHeight(100),
              child: Padding(
                padding: EdgeInsets.only(left: 35.0, right: 35.0),
                child: TextFormField(
                  autofocus: false,
                  style: TextStyle(color: Colors.black26, fontSize: 18.0),
                  decoration: InputDecoration(),
                  textAlign: TextAlign.center,
                  obscureText: false,
                  onSaved: (value) {
                    confirmNewPwText = value;
                  },
                  validator: (value) {
                    if (value.length == 0) {
                      return "密码不能为空";
                    } else if (value.length < 6) {
                      return "密码长度不够6位";
                    } else {
                      return null;
                    }
                    /** continue...*/
                  },
                  onFieldSubmitted: (value) {},
                  /** continue...*/
                ),
              )),
        ],
      ),
    );
  }
}
