import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manual/model/peopleConfig_model.dart';
import 'package:manual/provide/departmentname_config_provide.dart';
import 'package:manual/provide/postConfigModelProvide.dart';
import 'package:provide/provide.dart';

String temppeopleConfigname1;
String sex;
String email;
String phone;
String departmentname = '无';
String postConfigname = '无';
ChangePeopleConfigModel humanList1;
PeopleConfigViewModel temppeopleConfigViewmodel; //当前页面用来存放查询到的员工信息模型;

//引入人员修改数据接口
Future changePeopleConfig(
    context, name, sex, email, phone, department, posioton) async {
  try {
    Dio dio = Dio();
    // dio.options.contentType =
    //     ContentType.parse("application/x-www-form-urlencoded");
    Response response = await dio.get(
        "http://47.93.54.102:5000/basicConfigurations/human/modify?name=$name&sex=$sex&email=$email&phone=$phone&department=$department&position=$posioton",
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

class PeopleConfigChange extends StatefulWidget {
  final String name;
  PeopleConfigChange(this.name) {
    temppeopleConfigname1 = name;
  }

  _PeopleConfigChangeState createState() => _PeopleConfigChangeState();
}

class _PeopleConfigChangeState extends State<PeopleConfigChange> {
  GlobalKey<FormState> changepeopleConfigKey = GlobalKey<FormState>();
  String isModifyHuman;

//添加修改人员配置业务逻辑
  void changepeopleConfig() {
    var addpeopleConfigKey1 = changepeopleConfigKey.currentState;
    if (addpeopleConfigKey1.validate()) {
      addpeopleConfigKey1.save();
      changePeopleConfig(context, temppeopleConfigname1, sex, email, phone,
              departmentname, postConfigname)
          .then((val) {
        var data = json.decode(val.toString());
        ChangePeopleConfigModel peopleConfignamelist =
            ChangePeopleConfigModel.fromJson(data);
        setState(() {
          isModifyHuman = peopleConfignamelist.isModifyHuman;
        });
        if (isModifyHuman.contains('true')) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                    '修改信息成功!请返回其他页面刷新',
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
                    '修改信息失败，可能当前修改无改动',
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
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('人员修改'),
        ),
        body: Scaffold(
          body: Container(
            width: ScreenUtil().setWidth(740),
            height: ScreenUtil().setHeight(1100),
            padding: EdgeInsets.all(10.0),
            margin: EdgeInsets.only(top: 1.0),
            color: Colors.white,
            child: SingleChildScrollView(
              child: Form(
                key: changepeopleConfigKey,
                child: Column(
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 2.0, color: Colors.black26),
                        ),
                      ),
                      child: Text('员工姓名： $temppeopleConfigname1',
                          style: TextStyle(fontSize: ScreenUtil().setSp(36.0))),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: ScreenUtil().setWidth(160),
                            child: Text("性别：",
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(36.0))),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    color: Colors.black26, width: 1.0),
                              ),
                            ),
                            width: ScreenUtil().setWidth(450),
                            child: _myPeopleDropdownButton(),
                          ),
                        ],
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: '请输入电子邮箱:'),
                      onSaved: (value1) {
                        email = value1;
                      },
                      validator: (value1) {
                        if (value1.length == 0) return '创建电子邮箱不允许为空';
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: '请输入电话:'),
                      onSaved: (value2) {
                        phone = value2;
                      },
                      validator: (value2) {
                        if (value2.length == 0) return '创建电话不允许为空';
                        return null;
                      },
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: ScreenUtil().setWidth(160),
                            child: Text("所属部门：",
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(30.0))),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    color: Colors.black26, width: 1.0),
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
                                style: TextStyle(
                                    fontSize: ScreenUtil().setSp(30.0))),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                    color: Colors.black26, width: 1.0),
                              ),
                            ),
                            width: ScreenUtil().setWidth(500),
                            child: _myPostCongfigtDropdownButton(),
                          ),
                        ],
                      ),
                    ),
                    new Divider(),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          new SizedBox(
                            width: ScreenUtil().setWidth(300),
                            height: ScreenUtil().setHeight(100),
                            child: RaisedButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text(
                                          '你确定要修改此员工信息吗？',
                                          style: TextStyle(
                                              fontSize:
                                                  ScreenUtil().setSp(36.0)),
                                        ),
                                        actions: <Widget>[
                                          FlatButton(
                                            onPressed: () {
                                              changepeopleConfig();
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              '确定',
                                              style: TextStyle(
                                                  fontSize:
                                                      ScreenUtil().setSp(25.0)),
                                            ),
                                          ),
                                          FlatButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text(
                                              '取消',
                                              style: TextStyle(
                                                  fontSize:
                                                      ScreenUtil().setSp(25.0)),
                                            ),
                                          ),
                                        ],
                                      );
                                    });
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
          ),
        ),
      ),
    );
  }

//选择性别
  var _pickingChoice1 = 0;
  Widget _myPeopleDropdownButton() {
    List sexlist = ['男', '女'];
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
          sex = sexlist[_pickingChoice1];
          print(sex);
        }),
      ),
    );
  }

//选择所属部门
  List<DropdownMenuItem> getdepartmentListData(list_postDepartmentname) {
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
    List<String> list_postDepartmentname =
        Provide.value<UserDepartmentModelProvide>(context)
            .departmentnameList
            .departmentList;
    return Container(
      width: ScreenUtil().setWidth(500),
      alignment: Alignment.centerLeft,
      child: DropdownButton(
        value: _pickingChoice2,
        items: getdepartmentListData(list_postDepartmentname),
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
          postConfigname = listposetConfiglist[
              _pickingChoice3]; //将根据部门传递过来的值选择对应的岗位，并赋值给postConfigname用来进行增加;
        }),
      ),
    );
  }
}
