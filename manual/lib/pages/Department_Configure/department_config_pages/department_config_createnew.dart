import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DepartmentName_Configure_CreateNew extends StatefulWidget {
  DepartmentName_Configure_CreateNew({Key key}) : super(key: key);

  DepartmentName_Configure_CreateNew_State createState() =>
      DepartmentName_Configure_CreateNew_State();
}

class DepartmentName_Configure_CreateNew_State
    extends State<DepartmentName_Configure_CreateNew> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('新建工作名称'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              WorkDepartmentselect(),
              WorkName_Change1(),
              WorkName_Change2(),
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

class WorkDepartmentselect extends StatefulWidget {
  WorkDepartmentselect({Key key}) : super(key: key);

  _WorkDepartmentselectState createState() => _WorkDepartmentselectState();
}

class _WorkDepartmentselectState extends State<WorkDepartmentselect> {
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
      height: ScreenUtil().setHeight(120),
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
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black26, width: 1.0),
              ),
            ),
            padding: EdgeInsets.all(5.0),
            height: ScreenUtil().setHeight(180),
            width: ScreenUtil().setWidth(560),
            child: _myDepartmentDropdownButton(),
          ),
        ],
      ),
    );
  }

//选择所属部门
  var _pickingChoice4 = 0;
  Widget _myDepartmentDropdownButton() {
    return Container(
      width: ScreenUtil().setWidth(500),
      alignment: Alignment.centerLeft,
      child: DropdownButton(
        value: _pickingChoice4,
        items: <DropdownMenuItem>[
          DropdownMenuItem(
            child: Text('航空安全质量部门'),
            value: 0,
          ),
          DropdownMenuItem(
            child: Text('定检中队'),
            value: 1,
          ),
          DropdownMenuItem(
            child: Text('采购部门'),
            value: 2,
          ),
          DropdownMenuItem(
            child: Text('维修与管理部门'),
            value: 3,
          ),
        ],
        onChanged: (value) => setState(() {
          _pickingChoice4 = value;
        }),
      ),
    );
  }
}

class WorkName_Change1 extends StatefulWidget {
  WorkName_Change1({Key key}) : super(key: key);

  _WorkName_Change1State createState() => _WorkName_Change1State();
}

class _WorkName_Change1State extends State<WorkName_Change1> {
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
      height: ScreenUtil().setHeight(150),
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

class WorkName_Change2 extends StatefulWidget {
  WorkName_Change2({Key key}) : super(key: key);

  _WorkName_Change2State createState() => _WorkName_Change2State();
}

class _WorkName_Change2State extends State<WorkName_Change2> {
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
      height: ScreenUtil().setHeight(150),
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
              '工作描述：',
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(32.0), color: Colors.black),
            ),
          ),
          Container(
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
