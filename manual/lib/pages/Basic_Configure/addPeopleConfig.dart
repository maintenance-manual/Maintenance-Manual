import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manual/provide/departmentname_config_provide.dart';
import 'package:manual/provide/peopleConfigModelProvide.dart';
import 'package:manual/provide/postConfigModelProvide.dart';
import 'package:provide/provide.dart';
import 'addPostConfig.dart';

String name;
String sex;
String email;
String phone;
String departmentname = '无';
String postConfigname;
//引入添加人员配置数据接口;
Future addPeopleConfigname(
    context, name, sex, email, phone, departmentname, postConfigname) async {
  try {
    Dio dio = Dio();
    dio.options.contentType =
        ContentType.parse("application/x-www-form-urlencoded");
    Response response = await dio.get(
        "http://47.93.54.102:5000/basicConfigurations/human/add?name=$name&sex=$sex&email=$email&phone=$phone&department=$departmentname&position=$postConfigname",
        options: Options(
          responseType: ResponseType.plain,
        ));
    return response.data;
  } catch (e) {
    print(e);
  }
}

// //删除岗位名称
// void deletePostConfigitem(context,itemDepartment,itemPostConfig) {
//   deletePostConfigName(context, itemDepartment,itemPostConfig).then((val) {
//     var data = json.decode(val.toString());
//     DeleteDepartmentModel departmentlist = DeleteDepartmentModel.fromJson(data);
//     Provide.value<UserDepartmentModelProvide>(context)
//         .deletedepartmentname(itemPostConfig);
//     list =
//         Provide.value<UserDepartmentModelProvide>(context).departmentnameList;
//     print('删除......');
//     print(departmentlist.toJson());
//     print(list);
//   });
// }
class AddPeopleConfig extends StatefulWidget {
  AddPeopleConfig({Key key}) : super(key: key);

  _AddPeopleConfigState createState() => _AddPeopleConfigState();
}

class _AddPeopleConfigState extends State<AddPeopleConfig> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新增人员配置'),
      ),
      body: Container(
        child: _addPeopleConfig(context),
      ),
    );
  }

  Widget _addPeopleConfig(context) {
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
                      child: Text("员工姓名：",
                          style: TextStyle(fontSize: ScreenUtil().setSp(30.0))),
                    ),
                    Container(
                      width: ScreenUtil().setWidth(500),
                      child: TextFormField(
                        decoration: new InputDecoration(
                          labelText: '请输入员工姓名',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      width: ScreenUtil().setWidth(160),
                      child: Text("性别：",
                          style: TextStyle(fontSize: ScreenUtil().setSp(30.0))),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.black26, width: 1.0),
                        ),
                      ),
                      width: ScreenUtil().setWidth(500),
                      child: _myPeopleDropdownButton(),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      width: ScreenUtil().setWidth(160),
                      child: Text("电子邮箱：",
                          style: TextStyle(fontSize: ScreenUtil().setSp(30.0))),
                    ),
                    Container(
                      width: ScreenUtil().setWidth(500),
                      child: TextFormField(
                        decoration: new InputDecoration(
                          labelText: '请输入电子邮箱',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      width: ScreenUtil().setWidth(160),
                      child: Text("电话",
                          style: TextStyle(fontSize: ScreenUtil().setSp(30.0))),
                    ),
                    Container(
                      width: ScreenUtil().setWidth(500),
                      child: TextFormField(
                        decoration: new InputDecoration(
                          labelText: '请输入电话',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      width: ScreenUtil().setWidth(160),
                      child: Text("所属部门：",
                          style: TextStyle(fontSize: ScreenUtil().setSp(30.0))),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.black26, width: 1.0),
                        ),
                      ),
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
                      child: Text("岗位名称",
                          style: TextStyle(fontSize: ScreenUtil().setSp(30.0))),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.black26, width: 1.0),
                        ),
                      ),
                      width: ScreenUtil().setWidth(500),
                      child: _myPostCongfigtDropdownButton(),
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
                    Navigator.pop(context);
                  },
                  child: Text('新建'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//选择性别
  var _pickingChoice1 = 0;
  Widget _myPeopleDropdownButton() {
    return Container(
      width: ScreenUtil().setWidth(500),
      alignment: Alignment.centerLeft,
      child: DropdownButton(
        value: _pickingChoice1,
        items: <DropdownMenuItem>[
          DropdownMenuItem(
            child: Text('男'),
            value: 0,
          ),
          DropdownMenuItem(
            child: Text('女'),
            value: 1,
          ),
        ],
        onChanged: (value) => setState(() {
          _pickingChoice1 = value;
        }),
      ),
    );
  }

//选择所属部门
  List<DropdownMenuItem> getdepartmentListData() {
    //读取岗位配置里的数据并做好下标传给items，弄成下拉菜单;
    List<DropdownMenuItem> items = List<DropdownMenuItem>.generate(
        list_postDepartmentname.length,
        (index) => new DropdownMenuItem(
            child: new Text(list_postDepartmentname[index]), value: index));
    return items;
  }

  var _pickingChoice2 = 0;
  Widget _myDepartmentDropdownButton() {
    //读取部门配置里的数据;
    list_postDepartmentname = Provide.value<UserDepartmentModelProvide>(context)
        .departmentnameList
        .departmentList;
    return Container(
      width: ScreenUtil().setWidth(500),
      alignment: Alignment.centerLeft,
      child: DropdownButton(
        value: _pickingChoice2,
        items: getdepartmentListData(),
        onChanged: (value) => setState(() {
            departmentname = '无';
            _pickingChoice2 = value;
            departmentname = list_postDepartmentname[_pickingChoice2];       
          print(departmentname);
        }),
      ),
    );
  }

  //选择岗位名称
  List<DropdownMenuItem> getdpostConfigListData(listposetConfiglist) {
    //读取岗位名称里的数据并做好下标传给items，弄成下拉菜单;
    List<DropdownMenuItem> items = List<DropdownMenuItem>.generate(
        listposetConfiglist.length,
        (index) => new DropdownMenuItem(
            child: new Text(listposetConfiglist[index]), value: index));
    return items;
  }

  var _pickingChoice3 = 0;
  Widget _myPostCongfigtDropdownButton() {
    //读取岗位配置里的数据;
    List<String> list_postConfigname =
        Provide.value<PostConfigModelProvide>(context)
            .postConfigList
            .positionList;
    print('-------------------1');
    print(list_postConfigname);
    Provide.value<PostConfigModelProvide>(context).selectPostConfignameList(
        list_postConfigname, departmentname); //筛选当前部门下的所有岗位数据;
    //将所有满足选择部门下的岗位筛选出来
    List<String> listposetConfiglist =
        Provide.value<PostConfigModelProvide>(context).tempPostConfiglist1;
    return Container(
      width: ScreenUtil().setWidth(500),
      alignment: Alignment.centerLeft,
      child: DropdownButton(
        value: _pickingChoice3,
        items: getdpostConfigListData(listposetConfiglist),
        onChanged: (value) => setState(() {
          _pickingChoice3 = value;
        }),
      ),
    );
  }
}
