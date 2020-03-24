import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DepartmentName_Configure_CreateNew extends StatefulWidget {
  DepartmentName_Configure_CreateNew({Key key}) : super(key: key);

  _DepartmentName_Configure_CreateNewState createState() =>
      _DepartmentName_Configure_CreateNewState();
}

class _DepartmentName_Configure_CreateNewState
    extends State<DepartmentName_Configure_CreateNew> {
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
              People_Connect_WorkName_Change1(),
              People_Connect_WorkName_Change2(),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: ScreenUtil().setWidth(300),
                        height: ScreenUtil().setHeight(80),
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
                          child: Text(
                            '创建',
                            style:
                                TextStyle(fontSize: ScreenUtil().setSp(25.0)),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(6.0),
                      child: SizedBox(
                        width: ScreenUtil().setWidth(300),
                        height: ScreenUtil().setHeight(80),
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            '返回上一页',
                            style:
                                TextStyle(fontSize: ScreenUtil().setSp(25.0)),
                          ),
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
  //GlobalKey<RefreshFooterState> _footerkey0 = GlobalKey<RefreshFooterState>();

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
      height: ScreenUtil().setHeight(150),
      width: ScreenUtil().setWidth(740),
      padding: EdgeInsets.all(2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(180),
            height: ScreenUtil().setHeight(130),
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
            height: ScreenUtil().setHeight(100),
            width: ScreenUtil().setWidth(550),
            child: _myDepartmentDropdownButton(),
          ),
        ],
      ),
    );
  }

//选择所属部门
  var _pickingChoice5 = 0;
  Widget _myDepartmentDropdownButton() {
    return Container(
      width: ScreenUtil().setWidth(500),
      alignment: Alignment.centerLeft,
      child: DropdownButton(
        value: _pickingChoice5,
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
          _pickingChoice5 = value;
        }),
      ),
    );
  }
}

class People_Connect_WorkName_Change1 extends StatefulWidget {
  People_Connect_WorkName_Change1({Key key}) : super(key: key);

  _People_Connect_WorkName_Change1State createState() =>
      _People_Connect_WorkName_Change1State();
}

class _People_Connect_WorkName_Change1State
    extends State<People_Connect_WorkName_Change1> {
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
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black26, width: 1.0),
              ),
            ),
            height: ScreenUtil().setHeight(100),
            width: ScreenUtil().setWidth(560),
            child: _myPeoppleDropdownButton(),
          ),
        ],
      ),
    );
  }

//选择工作名称
  var _pickingChoice6 = 0;
  Widget _myPeoppleDropdownButton() {
    return Container(
      width: ScreenUtil().setWidth(500),
      alignment: Alignment.centerLeft,
      child: DropdownButton(
        value: _pickingChoice6,
        items: <DropdownMenuItem>[
          DropdownMenuItem(
            child: Text('部门管理'),
            value: 0,
          ),
          DropdownMenuItem(
            child: Text('监察组织'),
            value: 1,
          ),
          DropdownMenuItem(
            child: Text('安全教育'),
            value: 2,
          ),
          DropdownMenuItem(
            child: Text('安全培训'),
            value: 3,
          ),
        ],
        onChanged: (value) => setState(() {
          _pickingChoice6 = value;
        }),
      ),
    );
  }
}

class People_Connect_WorkName_Change2 extends StatefulWidget {
  People_Connect_WorkName_Change2({Key key}) : super(key: key);

  _People_Connect_WorkName_Change2State createState() =>
      _People_Connect_WorkName_Change2State();
}

class _People_Connect_WorkName_Change2State
    extends State<People_Connect_WorkName_Change2> {
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
            height: ScreenUtil().setHeight(150),
            alignment: Alignment.centerRight,
            child: Text(
              '员工姓名：',
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
            height: ScreenUtil().setHeight(100),
            width: ScreenUtil().setWidth(560),
            child: _myPeoppleDropdownButton(),
          ),
        ],
      ),
    );
  }

//选择员工姓名
  var _pickingChoice7 = 0;
  Widget _myPeoppleDropdownButton() {
    return Container(
      width: ScreenUtil().setWidth(500),
      alignment: Alignment.centerLeft,
      child: DropdownButton(
        value: _pickingChoice7,
        items: <DropdownMenuItem>[
          DropdownMenuItem(
            child: Text('张三'),
            value: 0,
          ),
          DropdownMenuItem(
            child: Text('李四'),
            value: 1,
          ),
          DropdownMenuItem(
            child: Text('王五'),
            value: 2,
          ),
          DropdownMenuItem(
            child: Text('赵六'),
            value: 3,
          ),
        ],
        onChanged: (value) => setState(() {
          _pickingChoice7 = value;
        }),
      ),
    );
  }
}
