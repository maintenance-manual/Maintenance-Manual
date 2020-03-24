import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manual/model/postConfig_model.dart';
import 'package:manual/pages/Basic_Configure/deletePostConfig/delePosetConfig.dart';
import 'package:manual/provide/departmentname_config_provide.dart';
import 'package:manual/provide/postConfigModelProvide.dart';
import 'package:provide/provide.dart';
import './addPostConfig.dart'; //引入新增岗位页面;

PostConfigModel list;
//引入岗位配置后台数据接口;
Future getDepartment() async {
  try {
    Dio dio = Dio();
    // dio.options.contentType =
    //     ContentType.parse("application/x-www-form-urlencoded");
    Response response =
        await dio.get("http://47.93.54.102:5000/basicConfigurations/position",
            options: Options(
              responseType: ResponseType.plain,
            ));
    return response.data;
  } catch (e) {
    print(e);
  }
}

class PostConfigure extends StatefulWidget {
  PostConfigure({Key key}) : super(key: key);

  _PostConfigureState createState() => _PostConfigureState();
}

class _PostConfigureState extends State<PostConfigure> {
  @override
  void initState() {
    getDepartment().then((val) {
      var data = json.decode(val.toString());
      PostConfigModel postConfiglist = PostConfigModel.fromJson(data);
      setState(() {
        list = postConfiglist;
      });
      print('开始获取岗位数据......');
      print(list.positionList);
      Provide.value<PostConfigModelProvide>(context).getPostConfigList(list);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            appBar: AppBar(
              title: Text('岗位配置'),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    height: ScreenUtil().setHeight(110),
                    width: ScreenUtil().setWidth(750),
                    padding: EdgeInsets.only(top: 20),
                    margin: EdgeInsets.only(left: 15, right: 15),
                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(width: 1.0, color: Colors.black54))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '所属部门',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: ScreenUtil().setSp(35.0)),
                        ),
                        Container(
                          width: ScreenUtil().setWidth(150),
                        ),
                        Text(
                          '岗位名称',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: ScreenUtil().setSp(35.0)),
                        ),
                      ],
                    ),
                  ),
                  PostConfigShow(),
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
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AddPostConfig()));
                },
                mini: false,
                shape: CircleBorder(),
                isExtended: false,
              );
            }),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endDocked));
  }
}

//岗位配置显示目录；
class PostConfigShow extends StatelessWidget {
  List postConfigName = [];
  List departmentName = [];
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: ScreenUtil().setHeight(940),
          padding: EdgeInsets.all(1.0),
          child: Provide<PostConfigModelProvide>(
            builder: (context, child, postConfigModelProvide) {
              departmentName =
                  Provide.value<UserDepartmentModelProvide>(context)
                      .departmentnameList
                      .departmentList;
              postConfigName = Provide.value<PostConfigModelProvide>(context)
                  .postConfigList
                  .positionList;
              return Container(
                margin: EdgeInsets.only(left: 5, right: 5),
                child: ListView.builder(
                  itemCount: postConfigName.length, //有岗位的话，才一定会有部门;
                  itemBuilder: (context, index) {
                    return CardPostItem(context, postConfigName[index]);
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
