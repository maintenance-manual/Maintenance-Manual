import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DepartmentName_Configure_CreateNew extends StatelessWidget {
  const DepartmentName_Configure_CreateNew({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('人员工作对接'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              WorkDepartmentselect(),
               Divider(
                color: Colors.black,
                thickness: 2.0,
              ),
              People_Connect_WorkName_Change1(),
              Divider(
                color: Colors.black,
                thickness: 2.0,
              ),
              People_Connect_WorkName_Change2(),
              Divider(
                color: Colors.black,
                thickness: 2.0,
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
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text(
                                      '你确定要创建此信息吗？',
                                      style: TextStyle(
                                          fontSize: ScreenUtil().setSp(36.0)),
                                    ),
                                    actions: <Widget>[
                                      FlatButton(
                                        onPressed: () {},
                                        child: Text(
                                          '确定',
                                          style: TextStyle(
                                              fontSize:
                                                  ScreenUtil().setSp(25.0)),
                                        ),
                                      ),
                                      FlatButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          '取消',
                                          style: TextStyle(
                                              fontSize:
                                                  ScreenUtil().setSp(25.0)),
                                        ),
                                      ),
                                    ],
                                  );
                                });
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
    );
  }
}

class WorkDepartmentselect extends StatelessWidget {
  GlobalKey<FormState> searchKey0 = GlobalKey<FormState>();
  GlobalKey<RefreshFooterState> _footerkey0 = GlobalKey<RefreshFooterState>();

  String searchText0 = '';
  void search1() {
    var searchForm = searchKey0.currentState;
    if (searchForm.validate()) {
      searchForm.save();
      print(searchText0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(200),
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.all(2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(180),
            height: ScreenUtil().setHeight(180),
            alignment: Alignment.centerRight,
            child: Text(
              '所属部门：',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(32.0), color: Colors.black),
            ),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            height: ScreenUtil().setHeight(180),
            width: ScreenUtil().setWidth(560),
            child: Row(
              children: <Widget>[
                Form(
                    key: searchKey0,
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      height: ScreenUtil().setHeight(150),
                      width: ScreenUtil().setWidth(500),
                      child: TextFormField(
                        autofocus: false,
                        style: TextStyle(color: Colors.black38, fontSize: 18.0),
                        decoration: InputDecoration(hintText: '请输入需要修改的工作名称'),
                        textAlign: TextAlign.center,
                        obscureText: false,
                        onSaved: (value) {
                          searchText0 = value;
                        },
                        validator: (value) {
                          return null;
                          /** continue...*/
                        },
                        onFieldSubmitted: (value) {},
                        /** continue...*/
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class People_Connect_WorkName_Change1 extends StatelessWidget {
  GlobalKey<FormState> searchKey1 = GlobalKey<FormState>();
  GlobalKey<RefreshFooterState> _footerkey1 = GlobalKey<RefreshFooterState>();

  String searchText1 = '';
  void search1() {
    var searchForm = searchKey1.currentState;
    if (searchForm.validate()) {
      searchForm.save();
      print(searchText1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(200),
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.all(2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(180),
            height: ScreenUtil().setHeight(180),
            alignment: Alignment.centerRight,
            child: Text(
              '工作名称：',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(32.0), color: Colors.black),
            ),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            height: ScreenUtil().setHeight(180),
            width: ScreenUtil().setWidth(560),
            child: Row(
              children: <Widget>[
                Form(
                    key: searchKey1,
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      height: ScreenUtil().setHeight(150),
                      width: ScreenUtil().setWidth(500),
                      child: TextFormField(
                        autofocus: false,
                        style: TextStyle(color: Colors.black38, fontSize: 18.0),
                        decoration: InputDecoration(hintText: '请输入需要修改的工作名称'),
                        textAlign: TextAlign.center,
                        obscureText: false,
                        onSaved: (value) {
                          searchText1 = value;
                        },
                        validator: (value) {
                          return null;
                          /** continue...*/
                        },
                        onFieldSubmitted: (value) {},
                        /** continue...*/
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class People_Connect_WorkName_Change2 extends StatelessWidget {
  GlobalKey<FormState> searchKey2 = GlobalKey<FormState>();
  GlobalKey<RefreshFooterState> _footerkey2 = GlobalKey<RefreshFooterState>();

  @override
  bool get wantKeepAlive => true;

  String searchText = '';
  void search() {
    var searchForm = searchKey2.currentState;
    if (searchForm.validate()) {
      searchForm.save();
      print(searchText);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(200),
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.all(2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(180),
            height: ScreenUtil().setHeight(180),
            alignment: Alignment.centerRight,
            child: Text(
              '员工姓名：',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(32.0), color: Colors.black),
            ),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            height: ScreenUtil().setHeight(180),
            width: ScreenUtil().setWidth(560),
            child: Row(
              children: <Widget>[
                Form(
                    key: searchKey2,
                    child: Container(
                      margin: EdgeInsets.all(10.0),
                      height: ScreenUtil().setHeight(150),
                      width: ScreenUtil().setWidth(500),
                      child: TextFormField(
                        autofocus: false,
                        style: TextStyle(color: Colors.black38, fontSize: 18.0),
                        decoration: InputDecoration(hintText: '请对该工作进行简要描述'),
                        textAlign: TextAlign.center,
                        obscureText: false,
                        onSaved: (value) {
                          searchText = value;
                        },
                        validator: (value) {
                          return null;
                          /** continue...*/
                        },
                        onFieldSubmitted: (value) {},
                        /** continue...*/
                      ),
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
