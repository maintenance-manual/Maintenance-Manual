import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:manual/model/peopleConfig_model.dart';
import 'package:manual/provide/peopleConfigModelProvide.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

String deletepeopleConfigname;
String temppeopleConfigname1; //当前页面用来存放传递过来的员工姓名变量;
PeopleConfigViewModel temppeopleConfigViewmodel; //当前页面用来存放查询到的员工信息模型;
//引入人员查看数据接口
Future lookPeopleConfig() async {
  try {
    Dio dio = Dio();
    // dio.options.contentType =
    //     ContentType.parse("application/x-www-form-urlencoded");
    Response response = await dio.get(
        "http://47.93.54.102:5000/basicConfigurations/human/check?name=$temppeopleConfigname1",
        options: Options(
          responseType: ResponseType.plain,
        ));
    print('当前人员信息为');
    print(response.data);
    return response.data;
  } catch (e) {
    print(e);
  }
}

//引入删除人员配置接口；
Future deletePeopleConfig(deletepeopleConfigname) async {
  try {
    print(deletePeopleConfig);
    Dio dio = Dio();
    // dio.options.contentType =
    //     ContentType.parse("application/x-www-form-urlencoded");
    Response response = await dio.get(
        "http://47.93.54.102:5000/basicConfigurations/human/del?name=$deletepeopleConfigname",
        options: Options(
          responseType: ResponseType.plain,
        ));
    print('当前删除人员信息为');
    print(response.data);
    return response.data;
  } catch (e) {
    print(e);
  }
}

class PeopleConfigViDelete extends StatefulWidget {
  final String temppeopleConfigname;
  PeopleConfigViDelete(this.temppeopleConfigname) {
    temppeopleConfigname1 = temppeopleConfigname;
    deletepeopleConfigname = temppeopleConfigname;
  }

  _PeopleConfigViDeleteState createState() => _PeopleConfigViDeleteState();
}

class _PeopleConfigViDeleteState extends State<PeopleConfigViDelete> {
  @override
  void initState() {
    // TODO: implement initState
    lookPeopleConfig().then((val) {
      var data = json.decode(val.toString());
      PeopleConfigViewModel peopleConfigViewmodel =
          PeopleConfigViewModel.fromJson(data);
      setState(() {
        temppeopleConfigViewmodel = peopleConfigViewmodel;
      });
      print(temppeopleConfigViewmodel.toJson());
    });
    super.initState();
  }

//删除部门名称
  void deletePeopleConfigname(context, deletepeopleConfigname) {
    print(deletepeopleConfigname);
    deletePeopleConfig(deletepeopleConfigname).then((val) {
      var data = json.decode(val.toString());
      DeletePeopleConfigModel peopleConfiglist =
          DeletePeopleConfigModel.fromJson(data);
          print(peopleConfiglist.position);
      Provide.value<PeopleConfigModelProvide>(context)
          .deletePeopleConfiglist(deletepeopleConfigname);
      String isDeleteHuman;
      isDeleteHuman = peopleConfiglist.isDeleteHuman;
      if (isDeleteHuman.contains('true')) {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  '删除成功，请返回其他页面刷新！',
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
      } else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  '删除失败，该员工信息可能已删除',
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
      print('删除......');
      print(peopleConfiglist.toJson());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('删除人员'),
      ),
      body: _viewPeopleConfig(
          context,
          temppeopleConfigViewmodel.name,
          temppeopleConfigViewmodel.sex,
          temppeopleConfigViewmodel.email,
          temppeopleConfigViewmodel.phone,
          temppeopleConfigViewmodel.department,
          temppeopleConfigViewmodel.position,
          temppeopleConfigViewmodel.createTime,
          temppeopleConfigViewmodel.updateTime),
    );
  }

  Widget _viewPeopleConfig(context, name, sex, email, phone, department,
      positon, createtime, updatetime) {
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
                child: Text('员工姓名：${name}',
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
                child: Text('性别：${sex} ',
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
                child: Text('电子邮箱： ${email}',
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
                child: Text('电话： ${phone}',
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
                child: Text('所属部门：${department} ',
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
                child: Text('岗位名称：${positon} ',
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
                child: Text('创建时间：${createtime}',
                    style: TextStyle(fontSize: ScreenUtil().setSp(31.0))),
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
                child: Text('更新时间：${updatetime}',
                    style: TextStyle(fontSize: ScreenUtil().setSp(31.0))),
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
                          print('>>>>>>>>>>>>>>>');
                          print(deletepeopleConfigname);
                          deletePeopleConfigname(context, deletepeopleConfigname);
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
