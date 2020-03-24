import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manual/provide/departmentname_config_provide.dart';
import 'package:provide/provide.dart';
import '../Basic_Configure/addDepartmentConfig.dart'; //引入新增部门页面;
import 'dart:io';
import 'package:dio/dio.dart';
import 'dart:convert';
import '../../model/departmentvView_model.dart';
import 'deleteDepartment/deleteDepartment.dart';

DepartmentViewModel list;
var deleteDepartment;
//引入读取部门配置后台数据接口
Future getDepartment() async {
  try {
    Dio dio = Dio();
    Response response =
        await dio.get("http://47.93.54.102:5000/basicConfigurations/department",
            options: Options(
              responseType: ResponseType.plain,
            ));
    print('后台部门数据接口');
    print(response.data);
    return response.data;
  } catch (e) {
    print(e);
  }
}

//引入删除部门配置后台数据接口
Future deleteDepartmentname(context, deleteDepartment) async {
  try {
    Dio dio = Dio();
    // dio.options.contentType =
    //     ContentType.parse("application/x-www-form-urlencoded");
    Response response = await dio.get(
        "http://47.93.54.102:5000/basicConfigurations/department/delete?deleteDepartment=$deleteDepartment",
        options: Options(
          responseType: ResponseType.plain,
        ));
    return response.data;
  } catch (e) {
    print(e);
  }
}

class DepartmentConfigure extends StatefulWidget {
  DepartmentConfigure({Key key}) : super(key: key);

  _DepartmentConfigureState createState() => _DepartmentConfigureState();
}

class _DepartmentConfigureState extends State<DepartmentConfigure> {
  @override
  void initState() {
    getDepartment().then((val) {
      var data = json.decode(val.toString());
      DepartmentViewModel departmentlist = DepartmentViewModel.fromJson(data);
      setState(() {
        list = departmentlist;
      });
      print('开始获取部門名稱数据......');
      print(list.departmentList);
      Provide.value<UserDepartmentModelProvide>(context)
          .getdepartmentname(list);
      print(list.toJson());
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('部门配置'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: ScreenUtil().setHeight(150),
                width: ScreenUtil().setWidth(750),
                padding: EdgeInsets.only(top: 20),
                margin: EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black54))),
                child: Text(
                  '部门名称',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: ScreenUtil().setSp(50),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              DepartMentConfigShow(list),
            ],
          ),
        ),
        floatingActionButton: new Builder(builder: (BuildContext context) {
          //悬浮按钮用来新建;
          return FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => AddDepartmentConfig()));
            },
            mini: false,
            shape: CircleBorder(),
            isExtended: false,
          );
        }),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        resizeToAvoidBottomPadding: false,
      ),
    );
  }
}

//部门显示目录
class DepartMentConfigShow extends StatelessWidget {
  DepartMentConfigShow(list);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          height: ScreenUtil().setHeight(940),
          padding: EdgeInsets.all(1.0),
          child: Provide<UserDepartmentModelProvide>(
            builder: (context, child, userDepartmentModelProvide) {
              list = Provide.value<UserDepartmentModelProvide>(context)
                  .departmentnameList;
              return Container(
                child: ListView.builder(
                  itemCount: list.departmentList.length,
                  itemBuilder: (context, index) {
                    return CardItem(context, list.departmentList[index]);
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
