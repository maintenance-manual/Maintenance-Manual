import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manual/login_page.dart';
import 'package:manual/model/peopleConnectionModel.dart';
import 'package:manual/provide/departmentConfigurationModelProvide.dart';
import 'package:manual/provide/peopleConnectModelProvide.dart';
import 'package:provide/provide.dart';

//引入新增人员工作对接后台数据接口
Future addpeopleConnectiondata(worker, workname) async {
  try {
    Response response = await Dio().get(
        "http://47.93.54.102:5000/departmentConfigurations/personnel_work/add?username=$worker&&work=$workname",
        options: Options(
          responseType: ResponseType.plain,
        ));
    print(response.data);
    return response.data;
  } catch (e) {
    print(e);
  }
}

String people_departmentname;
String workname;
String worker;
String isAddWorker;
AddPeopleConnectionModel addPeopleConnectionModel; //添加人员工作对接模型;

class PeopleConnection_CreateNew extends StatefulWidget {
  PeopleConnection_CreateNew(departmentname1) {
    people_departmentname = departmentname1;
  }

  _PeopleConnection_CreateNewState createState() =>
      _PeopleConnection_CreateNewState();
}

class _PeopleConnection_CreateNewState
    extends State<PeopleConnection_CreateNew> {
  void addActionofPeopleConnection() {
    addpeopleConnectiondata(worker, workname).then((val) {
      String addPeopleConnecitonItem =
          (people_departmentname + "--" + worker + "--" + workname).toString();
      var data = jsonDecode(val.toString());
      addPeopleConnectionModel = AddPeopleConnectionModel.fromJson(data);
      print(addPeopleConnectionModel.toJson());
      setState(() {
        isAddWorker = addPeopleConnectionModel.isAddWorker;
      });
      if (isAddWorker.contains("true")) {
        Provide.value<PeopleConnectionModelProvider>(context)
            .addpeopleConnectionnameitem(addPeopleConnecitonItem);
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('添加成功'),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    '确定',
                    style: TextStyle(fontSize: ScreenUtil().setSp(28.0)),
                  ),
                ),
              ],
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('人员已包含该工作，对接失败'),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    '确定',
                    style: TextStyle(fontSize: ScreenUtil().setSp(28.0)),
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
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('人员工作对接'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              WorkDepartmentselect(people_departmentname),
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
                            addActionofPeopleConnection();
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
  WorkDepartmentselect(departmentname);

  _WorkDepartmentselectState createState() => _WorkDepartmentselectState();
}

class _WorkDepartmentselectState extends State<WorkDepartmentselect> {
  GlobalKey<FormState> searchKey0 = GlobalKey<FormState>();

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
              '所属部门： ',
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
            width: ScreenUtil().setWidth(550),
            child: Text(
              '$people_departmentname',
              style: TextStyle(fontSize: ScreenUtil().setSp(32)),
            ),
          ),
        ],
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

//选择手册名称
  List<DropdownMenuItem> getworknameListData(list_workname) {
    //读取人员工作对接里的数据并做好下标传给items，弄成下拉菜单
    List<DropdownMenuItem> items = List<DropdownMenuItem>.generate(
        list_workname.length,
        (index) => new DropdownMenuItem(
            child: new Text(list_workname[index]), value: index));
    return items;
  }

//选择工作名称
  var _pickingChoice6 = 0;
  Widget _myPeoppleDropdownButton() {
    List worknamelist =
        Provide.value<DepartmentConfigurationModelProvider>(context)
            .departmentConfigurationModel
            .workList;
    List list1 = List();
    worknamelist.forEach((val) {
      list1.add(val.toString().split('--')[1]);
    });
    Set quchonglist = list1.toSet();
    return Container(
      width: ScreenUtil().setWidth(500),
      alignment: Alignment.centerLeft,
      child: DropdownButton(
        value: _pickingChoice6,
        items: getworknameListData(quchonglist.toList()),
        onChanged: (value) => setState(() {
          _pickingChoice6 = value;
          workname = quchonglist.toList()[value].toString();
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

//选择手册名称
  List<DropdownMenuItem> getworkerNameListData(list_workname) {
    //读取人员工作对接里的数据并做好下标传给items，弄成下拉菜单
    List<DropdownMenuItem> items = List<DropdownMenuItem>.generate(
        list_workname.length,
        (index) => new DropdownMenuItem(
            child: new Text(list_workname[index]), value: index));
    return items;
  }

//选择员工姓名
  var _pickingChoice7 = 0;
  Widget _myPeoppleDropdownButton() {
    List worknamelist = Provide.value<PeopleConnectionModelProvider>(context)
        .peopleConnectionModel
        .workList;
    List list2 = List();
    worknamelist.forEach((val) {
      list2.add(val.toString().split('--')[1]);
    });
    Set quchonglist = list2.toSet();
    return Container(
      width: ScreenUtil().setWidth(500),
      alignment: Alignment.centerLeft,
      child: DropdownButton(
        value: _pickingChoice7,
        items: getworkerNameListData(quchonglist.toList()),
        onChanged: (value) => setState(() {
          _pickingChoice7 = value;
          worker = quchonglist.toList()[value].toString();
        }),
      ),
    );
  }
}
