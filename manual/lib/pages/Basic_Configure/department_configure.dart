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

var list;
//引入后台数据接口
Future getHttp1() async {
  try {
    Dio dio = Dio();
    dio.options.contentType =
        ContentType.parse("application/x-www-form-urlencoded");
    Response response =
        await dio.get("http://47.93.54.102:5000/basicConfigurations/department",
            options: Options(
              responseType: ResponseType.plain,
            ));
    print(response.statusCode);
    print(response);
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
    getHttp1().then((val) {
      var data = json.decode(val.toString());
      DepartmentViewModel departmentlist = DepartmentViewModel.fromJson(data);
      setState(() {
        list = departmentlist.departmentList;
      });
      print('开始获取手册浏览数据......');
      print(list);
      // Provide.value<UserDepartmentModelProvide>(context)
      //     .getdepartmentname(list);
      // print(list);
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
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1.0, color: Colors.black54))),
                child: Text(
                  '部门名称',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: Colors.black, fontSize: ScreenUtil().setSp(35.0)),
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
            backgroundColor: Colors.grey,
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
          height: ScreenUtil().setHeight(940),
          padding: EdgeInsets.all(1.0),
          child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return _cardList(index);
            },
          ),
        ),
      ],
    );
  }

  //部门名称目录;
  Widget _cardList(index) {
    return Container(
      margin: EdgeInsets.only(top: 1.0),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1.0, color: Colors.black38))),
      child: ListTile(
        contentPadding: EdgeInsets.only(left: 6.0),
        title: Text(
          '${list[index]}',
          style: TextStyle(
            fontSize: 15.0,
          ),
        ),
        trailing: IconButton(
          onPressed: () {}, //添加删除逻辑
          icon: Icon(Icons.delete),
          iconSize: 25.0,
        ),
      ),
    );
  }
}
