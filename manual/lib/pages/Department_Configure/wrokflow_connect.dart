import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:manual/login_page.dart';
import 'package:manual/model/wrokflowModel/workflowmodel.dart';
import 'package:manual/pages/Department_Configure/add_processworkconnection.dart';
import 'package:manual/pages/Department_Configure/wrokflow_connect/wrokflowconnectsearch.dart';
import 'package:manual/provide/departmentname_config_provide.dart';
import 'package:manual/provide/workflowModelProvide/workflowModelProvide.dart';
import 'package:manual/service/service_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';

/**
 * 流程工作对接查询页面
 */
// 流程工作对接通用接口
Future _getwrokflowDatamethod(
    String parameter1, String parameter2, String inputparameter) async {
  try {
    Dio dio = Dio();
    Response response = await dio.get(
        'http://47.93.54.102:5000/departmentConfigurations/process_work/$parameter1?username=$userName&&$parameter2=$inputparameter',
        options: Options(responseType: ResponseType.plain));
    // print('流程工作对接查看数据：' + response.data);
    return response.data;
  } catch (e) {}
}

//查看本部门所有工作流程
Future _getallwrokflow() async {
  try {
    Dio dio = Dio();
    Response response = await dio.get(
        'http://47.93.54.102:5000/departmentConfigurations/process_work/all?username=$userName',
        options: Options(responseType: ResponseType.plain));
    // print('流程工作对接查看数据：' + response.data);
    return response.data;
  } catch (e) {}
}

WrokFlowModel allwrokflowmodel; //初始化查到所有流程工作模型；

class WrokflowConfigure extends StatefulWidget {
  @override
  _WrokflowConfigureState createState() => _WrokflowConfigureState();
}

class _WrokflowConfigureState extends State<WrokflowConfigure> {
  GlobalKey<FormState> searchKey = GlobalKey<FormState>();
  List wrokflowlist = [];
  //查找的参数
  String searchtype = '';
  String belongDepartment = '';
  String sequenceNumber = '';
  String fixingMark = '';
  String keyWord = '';
  //查找的类型
  String findtype = '';
  String qurty_by_findtype = '';

  int count = 0;
  void search() {
    var searchForm = searchKey.currentState;
    if (searchForm.validate()) {
      searchForm.save();
      count = 0;
      setState(() {
        if (belongDepartment != '') {
          searchtype = belongDepartment;
          findtype = 'department';
          qurty_by_findtype = 'query_by_department';
          count++;
        }
        if (sequenceNumber != '') {
          searchtype = sequenceNumber;
          findtype = 'procedureNumber';
          qurty_by_findtype = 'query_by_procedure_number';
          count++;
        }
        if (fixingMark != '') {
          searchtype = fixingMark;
          findtype = 'revision';
          qurty_by_findtype = 'query_by_revision';
          count++;
        }
        if (keyWord != '') {
          searchtype = keyWord;
          findtype = 'keyword';
          qurty_by_findtype = 'query_by_keyword';
          count++;
        }
      });
      if (count == 1) {
        print(qurty_by_findtype + " " + findtype + " " + searchtype);
        searchbykeyword_method(qurty_by_findtype, findtype, searchtype);
      } else {
        Fluttertoast.showToast(
          msg: "请输入单一查询条件",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
        );
      }
    }
  }

//查询后数据
  Future searchbykeyword_method(parameter1, parameter2, inputparameter) {
    _getwrokflowDatamethod(parameter1, parameter2, inputparameter).then((val) {
      var data = jsonDecode(val.toString());
      WrokFlowModel wrokFlowModel = WrokFlowModel.fromJson(data);
      Provide.value<WorkFlowModelProvide>(context)
          .getwrokflowlist(wrokFlowModel);
      setState(() {
        wrokflowlist =
            Provide.value<WorkFlowModelProvide>(context).wrokflowModel.workList;
      });
      if (wrokflowlist.length == 0) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('没有记录！'),
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
        print("传递： "+wrokflowlist.toString());
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>
                WrokFlowConnectSearch(context, wrokflowlist, inputparameter)));
      }
    });
  }

  void getallwrokflow() {
    _getallwrokflow().then((val) {
      var data = jsonDecode(val.toString());
      allwrokflowmodel = WrokFlowModel.fromJson(data);
      Provide.value<WorkFlowModelProvide>(context)
          .getwrokflowlist(allwrokflowmodel);
      print(allwrokflowmodel.toJson());
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getallwrokflow();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('手册程序电子化管理系统'),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: ScreenUtil().setHeight(110),
                width: ScreenUtil().setWidth(750),
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  '流程工作对接',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: ScreenUtil().setSp(50),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                height: ScreenUtil().setHeight(100),
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            AddNewProcessConnect(allwrokflowmodel)));
                  },
                  child: Text(
                    '新建',
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: ScreenUtil().setSp(25)),
                  ),
                ),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1, color: Colors.black12))),
              ),
              _searchList(),
              Container(
                margin: EdgeInsets.all(30),
                alignment: Alignment.centerLeft,
                child: FlatButton(
                  color: Colors.blueGrey,
                  highlightColor: Colors.blueGrey[700],
                  colorBrightness: Brightness.dark,
                  splashColor: Colors.grey,
                  child: Text("查找"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  onPressed: (/** continue...*/) {
                    search();
                    // Navigator.of(context).push(MaterialPageRoute(
                    //       builder: (context) => WrokFlowConnectSearch()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }

  Widget _searchList() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Form(
        key: searchKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Text(
                '所属部门：',
                style: TextStyle(fontSize: ScreenUtil().setSp(30)),
              ),
            ),
            Container(
              height: ScreenUtil().setHeight(100),
              width: ScreenUtil().setWidth(460),
              alignment: Alignment.centerLeft,
              child: TextFormField(
                autofocus: false,
                style: TextStyle(color: Colors.black54, fontSize: 18.0),
                decoration: InputDecoration(hintText: '输入所属部门查询'),
                obscureText: false,
                onSaved: (value) {
                  belongDepartment = value;
                },
                validator: (value) {
                  return null;
                  /** continue...*/
                },
                onFieldSubmitted: (value) {},
                /** continue...*/
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                '程序编号：',
                style: TextStyle(fontSize: ScreenUtil().setSp(30)),
              ),
            ),
            Container(
              height: ScreenUtil().setHeight(100),
              width: ScreenUtil().setWidth(460),
              alignment: Alignment.centerLeft,
              child: TextFormField(
                autofocus: false,
                style: TextStyle(color: Colors.black54, fontSize: 18.0),
                decoration: InputDecoration(hintText: '输入程序编号查询'),
                obscureText: false,
                onSaved: (value) {
                  sequenceNumber = value;
                },
                validator: (value) {
                  return null;
                  /** continue...*/
                },
                onFieldSubmitted: (value) {},
                /** continue...*/
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                '修订标记：',
                style: TextStyle(fontSize: ScreenUtil().setSp(30)),
              ),
            ),
            Container(
              height: ScreenUtil().setHeight(100),
              width: ScreenUtil().setWidth(460),
              alignment: Alignment.centerLeft,
              child: TextFormField(
                autofocus: false,
                style: TextStyle(color: Colors.black54, fontSize: 18.0),
                decoration: InputDecoration(hintText: '输入修订标识查询'),
                obscureText: false,
                onSaved: (value) {
                  fixingMark = value;
                },
                validator: (value) {
                  return null;
                  /** continue...*/
                },
                onFieldSubmitted: (value) {},
                /** continue...*/
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                '关键字查找：',
                style: TextStyle(fontSize: ScreenUtil().setSp(30)),
              ),
            ),
            Container(
              height: ScreenUtil().setHeight(100),
              width: ScreenUtil().setWidth(460),
              alignment: Alignment.centerLeft,
              child: TextFormField(
                autofocus: false,
                style: TextStyle(color: Colors.black54, fontSize: 18.0),
                decoration: InputDecoration(hintText: '输入关键字模糊查询'),
                obscureText: false,
                onSaved: (value) {
                  keyWord = value;
                },
                validator: (value) {
                  return null;
                  /** continue...*/
                },
                onFieldSubmitted: (value) {},
                /** continue...*/
              ),
            ),
          ],
        ),
      ),
    );
  }
}
