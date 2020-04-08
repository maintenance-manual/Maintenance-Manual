import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manual/login_page.dart';
import 'package:manual/model/departmentConfigureModel.dart';
import 'package:manual/pages/Basic_Configure/addPeopleConfig.dart';
import 'package:manual/provide/departmentConfigurationModelProvide.dart';
import 'package:provide/provide.dart';

String isModifyWork;
ModifyDepartmentConfigurationModel
    modifyDepartmentConfigurationModel; //当前页面用来存放查询到的修改工作名称配置模型;
//引入修改工作名称配置后台数据接口
Future modifyDepartmentConfiguration(workname, description) async {
  try {
    Response response = await Dio().get(
        "http://47.93.54.102:5000/departmentConfigurations/name/modify?username=$userName&&work=$workname&&description=$description",
        options: Options(
          responseType: ResponseType.plain,
        ));
    return response.data;
  } catch (e) {
    print(e);
  }
}

String departmentname;
String oldworkname;
String olddescription;

class DepartmentName_Configure_Change extends StatefulWidget {
  DepartmentName_Configure_Change(
      departmentname1, oldworkname1, olddescription1) {
    departmentname = departmentname1;
    oldworkname = oldworkname1;
    olddescription = olddescription1;
  }

  @override
  _DepartmentName_Configure_ChangeState createState() =>
      _DepartmentName_Configure_ChangeState();
}

class _DepartmentName_Configure_ChangeState
    extends State<DepartmentName_Configure_Change> {
  GlobalKey<FormState> searchKey1 = GlobalKey<FormState>();
  GlobalKey<FormState> searchKey2 = GlobalKey<FormState>();

  String searchText1 = '';
  String searchText2 = '';
  void search() {
    var searchForm1 = searchKey1.currentState;
    var searchForm2 = searchKey2.currentState;
    if (searchForm1.validate() && searchForm1.validate()) {
      searchForm1.save();
      searchForm2.save();
      print(searchText1);
      modifyDepartmentConfiguration(searchText1, searchText2).then((val) {
        var data = json.decode(val.toString());
        modifyDepartmentConfigurationModel =
            ModifyDepartmentConfigurationModel.fromJson(data);
        setState(() {
          isModifyWork = modifyDepartmentConfigurationModel.isModifyWork;
        });
        if (isModifyWork.contains('true')) {
          Provide.value<DepartmentConfigurationModelProvider>(context)
              .modifyDepartmentConfigurationname(departmentname, oldworkname,
                  olddescription, searchText1, searchText2);
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                    '修改信息成功,请返回查看',
                    style: TextStyle(fontSize: ScreenUtil().setSp(36.0)),
                  ),
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
              });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('工作名称修改'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                width: ScreenUtil().setWidth(750),
                padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.only(top: 10.0, left: 5.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 1.0, color: Colors.black38),
                  ),
                ),
                child: Text(
                  '所属部门：  $departmentname',
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(36.0), color: Colors.black),
                ),
              ),
              _worknameModifywidget(),
              Divider(
                color: Colors.black,
                thickness: 2.0,
              ),
              _descriptionModifywidget(),
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
                            search();
                          },
                          child: Text('保存'),
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

  Widget _worknameModifywidget() {
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

  Widget _descriptionModifywidget() {
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
              '工作描述：',
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
