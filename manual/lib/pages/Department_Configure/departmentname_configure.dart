import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:manual/login_page.dart';
import 'package:manual/model/departmentConfigureModel.dart';
import 'package:manual/provide/departmentConfigurationModelProvide.dart';
import 'package:manual/service/service_method.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import './department_config_pages/department_config_change.dart'; //引入工作名称配置修改页面;
import './department_config_pages/department_config_view.dart'; //引入工作名称配置查看页面;
import './department_config_pages/department_config_delete.dart'; //引入工作名称配置删除页面;
import './department_config_pages/department_config_createnew.dart'; //引入工作名称配置删除页面;

DepartmentConfigurationModel departmentConfigurationModel;

//读取工作名称配置内容
Future getdepartmentConfigurationslist() async {
  try {
    Response response = await Dio().get(
        "http://47.93.54.102:5000/departmentConfigurations/name?username=$userName",
        options: Options(
          responseType: ResponseType.plain,
        ));
    return response.data;
  } catch (e) {
    print(e);
  }
}

class DepartmentNameConfigure extends StatefulWidget {
  DepartmentNameConfigure({Key key}) : super(key: key);

  @override
  _DepartmentNameConfigureState createState() =>
      _DepartmentNameConfigureState();
}

class _DepartmentNameConfigureState extends State<DepartmentNameConfigure> {
  String departmentname; //用来取出当前部门名称;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('开始读取工作配置数据.....');
    getdepartmentConfigurationslist().then((val) {
      var data = jsonDecode(val.toString());
      setState(() {
        departmentConfigurationModel =
            DepartmentConfigurationModel.fromJson(data);
        departmentname =
            departmentConfigurationModel.workList[0].split('--')[0];
      });
      Provide.value<DepartmentConfigurationModelProvider>(context)
          .getdepartmentConfigurationlist(departmentConfigurationModel);
      print(departmentConfigurationModel.toJson());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Text('工作名称配置'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: ScreenUtil().setHeight(110),
              width: ScreenUtil().setWidth(750),
              padding: EdgeInsets.only(top: 20),
              margin: EdgeInsets.only(left: 15, right: 15),
              child: Text(
                '工作名称配置',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: ScreenUtil().setSp(50),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              height: ScreenUtil().setHeight(100),
              margin: EdgeInsets.only(left: 15, right: 15),
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          DepartmentName_Configure_CreateNew(departmentname)));
                },
                child: Text(
                  '新建',
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: ScreenUtil().setSp(28.0)),
                ),
              ),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: Colors.black))),
            ),
            Department_ConfigShow(),
          ],
        ),
      ),
    ));
  }
}

//工作名称配置目录
class Department_ConfigShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(940),
            padding: EdgeInsets.all(1.0),
            child: Provide<DepartmentConfigurationModelProvider>(builder:
                (context, child, departmentConfigurationModelProvider) {
              return ListView.builder(
                itemCount: departmentConfigurationModelProvider
                    .departmentConfigurationModel.workList.length,
                itemBuilder: (context, index) {
                  List worklist = departmentConfigurationModelProvider
                      .departmentConfigurationModel.workList[index]
                      .split('--');

                  return _myDrawer1(
                      context, worklist[0], worklist[1], worklist[2]);
                },
              );
            }),
          ),
        ],
      ),
    );
  }

  //部门名称目录;
  Widget _myDrawer1(context, departmentname, work_name, description) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.all(5.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            color: Colors.black12,
          ),
          child: Column(
            children: <Widget>[
              ExpansionTile(
                title: Text(
                  '所属部门：$departmentname',
                  style: TextStyle(fontSize: ScreenUtil().setSp(36.0)),
                ),
                children: <Widget>[
                  ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text('工作名称：$work_name'),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text('工作描述：$description'),
                        ),
                      ],
                    ),
                    trailing: Container(
                      width: ScreenUtil().setWidth(250),
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DepartmentName_Configure_Change(
                                              departmentname,
                                              work_name,
                                              description)));
                            },
                            child: Container(
                              width: ScreenUtil().setWidth(70),
                              height: ScreenUtil().setHeight(60),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  color: Colors.orangeAccent),
                              child: Text(
                                '修改',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          DepartmentName_Configure_View(
                                              departmentname,
                                              work_name,
                                              description)));
                            },
                            child: Container(
                              width: ScreenUtil().setWidth(70),
                              height: ScreenUtil().setHeight(60),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  color: Colors.orangeAccent),
                              child: Text(
                                '查看',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      DepartmentName_Configure_Delete(
                                          departmentname,
                                          work_name,
                                          description)));
                            },
                            child: Container(
                              width: ScreenUtil().setWidth(70),
                              height: ScreenUtil().setHeight(60),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  color: Colors.orangeAccent),
                              child: Text(
                                '删除',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
