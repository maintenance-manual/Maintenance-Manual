import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manual/model/postConfig_model.dart';
import 'package:manual/provide/departmentname_config_provide.dart';
import 'package:manual/provide/postConfigModelProvide.dart';
import 'package:provide/provide.dart';

List list_postDepartmentname = [];
String addDepartmentname;
String addPostConfigname;
String isaddPostConfigname;

Future getAddPostConfigname() async {
  //读取后台增加数据接口;
  try {
    Dio dio = Dio();
    // dio.options.contentType =
    //     ContentType.parse("application/x-www-form-urlencoded");
    Response response = await dio.get(
        "http://47.93.54.102:5000/basicConfigurations/position/add?itsDepartment=$addDepartmentname&addPosition=$addPostConfigname",
        options: Options(
          responseType: ResponseType.plain,
        ));
    return response.data;
  } catch (e) {
    print(e);
  }
}

class AddPostConfig extends StatefulWidget {
  AddPostConfig({Key key}) : super(key: key);

  _AddPostConfigState createState() => _AddPostConfigState();
}

class _AddPostConfigState extends State<AddPostConfig> {
  GlobalKey<FormState> addpostConfigKey = GlobalKey<FormState>();

//添加岗位配置业务逻辑
  void getPosetConfig() {
    var addpostConfigForm = addpostConfigKey.currentState;
    if (addpostConfigForm.validate()) {
      addpostConfigForm.save();
      getAddPostConfigname().then((val) {
        var data = json.decode(val.toString());
        AddPostConfigModel postConfigCreateNew =
            AddPostConfigModel.fromJson(data);
        setState(() {
          isaddPostConfigname = postConfigCreateNew.isAddPosition;
        });
        //判断是否在同一部门下创建相同岗位
        if (isaddPostConfigname.contains("true")) {
          //如果返回true，说明之前不存在该岗位;
          Provide.value<PostConfigModelProvide>(context)
              .addPostConfignameList(addPostConfigname); 
          Navigator.pop(context);
        } else {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('该岗位已存在'),
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
            },
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新增岗位配置'),
      ),
      body: Container(
        child: _addPostConfig(context),
      ),
    );
  }

  Widget _addPostConfig(context) {
    return Scaffold(
      body: Container(
        width: ScreenUtil().setWidth(740),
        height: ScreenUtil().setHeight(1334),
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.only(top: 1.0),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      width: ScreenUtil().setWidth(160),
                      child: Text("所属部门：",
                          style: TextStyle(fontSize: ScreenUtil().setSp(30.0))),
                    ),
                    Container(
                      width: ScreenUtil().setWidth(500),
                      child: _myDepartmentDropdownButton(),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      width: ScreenUtil().setWidth(160),
                      child: Text("岗位名称：",
                          style: TextStyle(fontSize: ScreenUtil().setSp(30.0))),
                    ),
                    Container(
                      width: ScreenUtil().setWidth(500),
                      alignment: Alignment.center,
                      child: Form(
                        key: addpostConfigKey,
                        child: TextFormField(
                          decoration: new InputDecoration(
                            labelText: '请输入岗位名称',
                          ),
                          onSaved: (value1) {
                            addPostConfigname = value1;
                          },
                          validator: (value1) {
                            if (value1.length == 0) return '创建岗位不允许为空';
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              new Divider(),
              new SizedBox(
                width: ScreenUtil().setWidth(750),
                height: ScreenUtil().setHeight(100),
                child: RaisedButton(
                  onPressed: () {
                    getPosetConfig();
                  },
                  child: Text('保存'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem> getListData() {
    //读取部门名称里的数据并做好下标传给items，弄成下拉菜单;
    List<DropdownMenuItem> items = List<DropdownMenuItem>.generate(
        list_postDepartmentname.length,
        (index) => new DropdownMenuItem(
            child: new Text(list_postDepartmentname[index]), value: index));
    return items;
  }

  var _pickingChoice = 0;
  Widget _myDepartmentDropdownButton() {
    list_postDepartmentname = Provide.value<UserDepartmentModelProvide>(context)
        .departmentnameList
        .departmentList;
    print(list_postDepartmentname);
    return Container(
      width: ScreenUtil().setWidth(500),
      alignment: Alignment.centerLeft,
      child: DropdownButton(
        value: _pickingChoice,
        items: getListData(),
        onChanged: (value) => setState(() {
          _pickingChoice = value;
          addDepartmentname =
              list_postDepartmentname[_pickingChoice]; //将需要添加的部门确定出来;
        }),
      ),
    );
  }
}
