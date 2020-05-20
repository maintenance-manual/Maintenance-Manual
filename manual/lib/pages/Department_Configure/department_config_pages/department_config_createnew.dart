import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manual/login_page.dart';
import 'package:manual/model/departmentConfigureModel.dart';
import 'package:manual/provide/departmentConfigurationModelProvide.dart';
import 'package:provide/provide.dart';

Future adddepartmentConfiguration(String workname, String description) async {
  try {
    Response response = await Dio().get(
        'http://47.93.54.102:5000/departmentConfigurations/name/add?username=$userName&&work=$workname&&description=$description',
        options: Options(
          responseType: ResponseType.plain,
        ));
    print('>>>' + response.data);
    return response.data;
  } catch (e) {}
}

String departmentname_1;
String searchText1;
String searchText2;
String isAddWork;

class DepartmentName_Configure_CreateNew extends StatefulWidget {
  DepartmentName_Configure_CreateNew(departmentname) {
    departmentname_1 = departmentname;
  }

  DepartmentName_Configure_CreateNew_State createState() =>
      DepartmentName_Configure_CreateNew_State();
}

class DepartmentName_Configure_CreateNew_State
    extends State<DepartmentName_Configure_CreateNew> {
  GlobalKey<FormState> searchKey1 = GlobalKey<FormState>();
  GlobalKey<FormState> searchKey2 = GlobalKey<FormState>();

  void search() {
    var searchForm1 = searchKey1.currentState;
    var searchForm2 = searchKey2.currentState;
    if (searchForm1.validate() && searchForm2.validate()) {
      searchForm1.save();
      searchForm2.save();
      adddepartmentConfiguration1();
    }
  }

  void adddepartmentConfiguration1() {
    print(searchText1 + " " + searchText2);
    adddepartmentConfiguration(searchText1, searchText2).then((onValue) {
      var data = jsonDecode(onValue.toString());
      AddDepartmentConfigurationModel departmentCreateNew =
          AddDepartmentConfigurationModel.fromJson(data);
      setState(() {
        isAddWork = departmentCreateNew.isAddWork;
      });
      String adddepartmentConfiglist =
          departmentname_1 + "--" + searchText1 + "--" + searchText2;
      print(adddepartmentConfiglist);
      if (isAddWork.contains("true")) {
        Provide.value<DepartmentConfigurationModelProvider>(context)
            .adddepartmentConfigurationlist(adddepartmentConfiglist);
        Navigator.pop(context); //如果返回true，说明之前不存在该部门
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('该工作配置已存在'),
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
          title: Text('新建工作名称'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              WorkDepartmentselect(),
              // WorkName_Change1(),
              _worknameInputWidget(),//工作名称
              _descriptionInputWidget(),//工作描述
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
                           search();
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

  Widget _worknameInputWidget() {
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

  Widget _descriptionInputWidget() {
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
                          searchText2 = value;
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

class WorkDepartmentselect extends StatefulWidget {
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
      height: ScreenUtil().setHeight(120),
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.all(2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
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
            width: ScreenUtil().setWidth(560),
            child: Text(
              departmentname_1,
              style: TextStyle(fontSize: ScreenUtil().setSp(38)),
            ),
          ),
        ],
      ),
    );
  }
}

