import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  var _pickingChoice2 = 0;
  Widget _myDepartmentDropdownButton() {
    return Container(
      width: ScreenUtil().setWidth(500),
      alignment: Alignment.centerLeft,
      child: DropdownButton(
        value: _pickingChoice2,
        items: <DropdownMenuItem>[
          DropdownMenuItem(
            child: Text('航空安全质量部门'),
            value: 0,
          ),
          DropdownMenuItem(
            child: Text('定检中队'),
            value: 1,
          ),
          DropdownMenuItem(
            child: Text('采购部门'),
            value: 2,
          ),
          DropdownMenuItem(
            child: Text('维修与管理部门'),
            value: 3,
          ),
        ],
        onChanged: (value) => setState(() {
          _pickingChoice2 = value;
        }),
      ),
    );
  }

  //选择岗位名称
  var _pickingChoice3 = 0;
  Widget _myPostCongfigtDropdownButton() {
    return Container(
      width: ScreenUtil().setWidth(500),
      alignment: Alignment.centerLeft,
      child: DropdownButton(
        value: _pickingChoice3,
        items: <DropdownMenuItem>[
          DropdownMenuItem(
            child: Text('航空安全质量部门'),
            value: 0,
          ),
          DropdownMenuItem(
            child: Text('定检中队'),
            value: 1,
          ),
          DropdownMenuItem(
            child: Text('采购部门'),
            value: 2,
          ),
          DropdownMenuItem(
            child: Text('维修与管理部门'),
            value: 3,
          ),
        ],
        onChanged: (value) => setState(() {
          _pickingChoice3 = value;
        }),
      ),
    );
  }
}
