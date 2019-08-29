import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PeopleConfigChange extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('人员修改'),
        ),
        body: Container(
          child: _changePeopleConfig(context),
        ),
      ),
    );
  }

  Widget _changePeopleConfig(context) {
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
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 2.0, color: Colors.black26),
                  ),
                ),
                child: Text('员工姓名：',
                    style: TextStyle(fontSize: ScreenUtil().setSp(36.0))),
              ),
              new TextFormField(
                decoration: new InputDecoration(
                  labelText: '选择性别',
                ),
              ),
              new TextFormField(
                decoration: new InputDecoration(
                  labelText: '请输入电子邮箱',
                ),
              ),
              new TextFormField(
                decoration: new InputDecoration(
                  labelText: '请输入电话',
                ),
              ),
              new TextFormField(
                decoration: new InputDecoration(
                  labelText: '请选择所属部门',
                ),
              ),
              new TextFormField(
                decoration: new InputDecoration(
                  labelText: '请选择岗位名称',
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
                                        fontSize: ScreenUtil().setSp(36.0)),
                                  ),
                                  actions: <Widget>[
                                    FlatButton(
                                      onPressed: () {},
                                      child: Text(
                                        '确定',
                                        style: TextStyle(
                                            fontSize: ScreenUtil().setSp(25.0)),
                                      ),
                                    ),
                                    FlatButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        '取消',
                                        style: TextStyle(
                                            fontSize: ScreenUtil().setSp(25.0)),
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
    );
  }
}
