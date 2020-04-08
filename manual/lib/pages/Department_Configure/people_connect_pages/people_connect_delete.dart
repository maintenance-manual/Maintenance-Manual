import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manual/login_page.dart';
import 'package:manual/model/departmentConfigureModel.dart';
import 'package:manual/model/peopleConnectionModel.dart';
import 'package:manual/pages/Department_Configure/people_connect_pages/people_connect_createnew.dart';
import 'package:manual/provide/peopleConnectModelProvide.dart';
import 'package:provide/provide.dart';

//引入人员工作对接删除接口;
Future deletepeopleConnection(deleteWorkname) async {
  try {
    print(worker + " " + deleteWorkname);
    Response response = await Dio().get(
        "http://47.93.54.102:5000/departmentConfigurations/personnel_work/delete?username=$worker&&work=$deleteWorkname",
        options: Options(
          responseType: ResponseType.plain,
        ));
    print('打印返回的删除数据' + response.data);
    return response.data;
  } catch (e) {}
}

class People_Connect_Delete extends StatelessWidget {
  String department;
  String worker;
  String workname;
  People_Connect_Delete(context, this.department, this.worker, this.workname);

//删除部门名称
  void deletePeopleConfigname(context, workname) {
    deletepeopleConnection(workname).then((val) {
      String deletepeopleConnectionname =
          department + "--" + worker + "--" + workname;
      var data = jsonDecode(val.toString());
      DeletePeopleConnectionModel deletepeopleConnectionmodel =
          DeletePeopleConnectionModel.fromJson(data);
      print(deletepeopleConnectionmodel.toJson());
      if (deletepeopleConnectionmodel.isDeleteWorker.contains("true")) {
        Provide.value<PeopleConnectionModelProvider>(context)
            .deletepeopleConnectionname(deletepeopleConnectionname);
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('删除成功'),
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
              title: Text('已删除数据'),
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
          title: Text('删除人员工作对接'),
        ),
        body: _viewPeopleconnect(context),
      ),
    );
  }

  Widget _viewPeopleconnect(context) {
    return Scaffold(
      body: Container(
        width: ScreenUtil().setWidth(740),
        height: ScreenUtil().setHeight(1100),
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.only(top: 1.0),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 2.0, color: Colors.black26),
                  ),
                ),
                child: Text('工作名称：  $workname',
                    style: TextStyle(fontSize: ScreenUtil().setSp(36.0))),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 2.0, color: Colors.black26),
                  ),
                ),
                child: Text('员工姓名：  $worker',
                    style: TextStyle(fontSize: ScreenUtil().setSp(36.0))),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.all(5.0),
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 2.0, color: Colors.black26),
                  ),
                ),
                child: Text('创建时间： ',
                    style: TextStyle(fontSize: ScreenUtil().setSp(36.0))),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    new SizedBox(
                      width: ScreenUtil().setWidth(300),
                      height: ScreenUtil().setHeight(100),
                      child: RaisedButton(
                        onPressed: () {
                          print(workname);
                          deletePeopleConfigname(context, workname);
                        },
                        child: Text('删除'),
                      ),
                    ),
                    new SizedBox(
                      width: ScreenUtil().setWidth(350),
                      height: ScreenUtil().setHeight(100),
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('返回上一页'),
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
