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
                      onFieldSubmitted: (value) {

                      },
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
      resizeToAvoidBottomPadding: false,
    );
  }
}
