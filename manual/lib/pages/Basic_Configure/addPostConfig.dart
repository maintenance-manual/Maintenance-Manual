import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddPostConfig extends StatefulWidget {
  AddPostConfig({Key key}) : super(key: key);

  _AddPostConfigState createState() => _AddPostConfigState();
}

class _AddPostConfigState extends State<AddPostConfig> {
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
                      child: TextFormField(
                        decoration: new InputDecoration(
                          labelText: '请输入岗位名称',
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
                    Navigator.pop(context);
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

  var _pickingChoice = 0;
  Widget _myDepartmentDropdownButton() {
    return Container(
      width: ScreenUtil().setWidth(500),
      alignment: Alignment.centerLeft,
      child: DropdownButton(
        value: _pickingChoice,
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
          _pickingChoice = value;
        }),
      ),
    );
  }
}
