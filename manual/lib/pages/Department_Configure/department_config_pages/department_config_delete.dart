import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manual/login_page.dart';
import 'package:manual/model/departmentConfigureModel.dart';
import 'package:manual/pages/Handbooksearch_pages/handbook_show.dart';
import 'package:manual/provide/departmentConfigurationModelProvide.dart';
import 'package:provide/provide.dart';

//引入删除工作名称配置后台数据接口
Future deleteDepartmentConfiguration(context, workname) async {
  try {
    Response response = await Dio().get(
        "http://47.93.54.102:5000/departmentConfigurations/name/delete?username=$userName&&work=$workname",
        options: Options(
          responseType: ResponseType.plain,
        ));
    return response.data;
  } catch (e) {
    print(e);
  }
}

//删除工作名称配置
void deleteDepartmentConfigurationitem(
    context, departmentname, workname, description) {
  deleteDepartmentConfiguration(context, workname).then((val) {
    String deleteDepartmentItem =
        departmentname + "--" + workname + "--" + description;
    var data = json.decode(val.toString());
    DeletedepartmentConfigurationModel departmentlist =
        DeletedepartmentConfigurationModel.fromJson(data);
    if (departmentlist.isDeleteWork.contains('true')) {
      Provide.value<DepartmentConfigurationModelProvider>(context)
          .deletedepartmentConfigurationname(deleteDepartmentItem);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                '删除成功,请返回上页面',
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

class DepartmentName_Configure_Delete extends StatelessWidget {
  String departmentname;
  String workname;
  String description;
  DepartmentName_Configure_Delete(
      this.departmentname, this.workname, this.description);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('删除工作描述'),
        ),
        body: _viewPeopleConfig(context),
      ),
    );
  }

  Widget _viewPeopleConfig(context) {
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
                child: Text('所属部门： $departmentname',
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
                child: Text('工作名称： $workname',
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
                child: Text('工作描述： $description',
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
                          deleteDepartmentConfigurationitem(
                              context, departmentname, workname, description);
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
