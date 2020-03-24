import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:manual/model/peopleConfig_model.dart';
import 'people_config_change.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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

class PeopleConfigView extends StatefulWidget {
  final String temppeopleConfigname;
  PeopleConfigView(this.temppeopleConfigname){
    temppeopleConfigname1 =temppeopleConfigname;
  }

  _PeopleConfigViewState createState() => _PeopleConfigViewState();
}

class _PeopleConfigViewState extends State<PeopleConfigView> {
  @override
  void initState() {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('人员查看'),
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
                child: Text('员工姓名：$name',
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
                child: Text('性别：$sex ',
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
                child: Text('电子邮箱： $email',
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
                child: Text('电话： $phone',
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
                child: Text('所属部门：$department ',
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
                child: Text('岗位名称：$positon ',
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
                child: Text('创建时间：$createtime',
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
                child: Text('更新时间：$updatetime',
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PeopleConfigChange('$name')));
                        },
                        child: Text('修改'),
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