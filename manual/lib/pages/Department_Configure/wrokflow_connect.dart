import 'package:manual/pages/Department_Configure/add_processworkconnection.dart';
import 'package:manual/pages/Department_Configure/wrokflow_connect/wrokflowconnectsearch.dart';
import 'package:manual/service/service_method.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WrokflowConfigure extends StatefulWidget {
  @override
  _WrokflowConfigureState createState() => _WrokflowConfigureState();
}

class _WrokflowConfigureState extends State<WrokflowConfigure> {
  GlobalKey<FormState> searchKey = GlobalKey<FormState>();
  String belongDepartment = '';
  String sequenceNumber = '';
  String fixingMark = '';
  String keyWord = '';
  void search() {
    var searchForm = searchKey.currentState;
    if (searchForm.validate()) {
      searchForm.save();
      print(belongDepartment +
          '   ' +
          sequenceNumber +
          '   ' +
          fixingMark +
          '   ' +
          keyWord);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('手册程序电子化管理系统'),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: ScreenUtil().setHeight(110),
                width: ScreenUtil().setWidth(750),
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  '流程工作对接',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: ScreenUtil().setSp(50),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                height: ScreenUtil().setHeight(100),
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AddNewProcessConnect()));
                  },
                  child: Text(
                    '新建',
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: ScreenUtil().setSp(25)),
                  ),
                ),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1, color: Colors.black12))),
              ),
              _searchList(),
              Container(
              margin: EdgeInsets.all(30),
              alignment: Alignment.centerLeft,
              child: FlatButton(
                color: Colors.blueGrey,
                highlightColor: Colors.blueGrey[700],
                colorBrightness: Brightness.dark,
                splashColor: Colors.grey,
                child: Text("查找"),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                onPressed: (/** continue...*/) {
                  search();
                  Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => WrokFlowConnectSearch()));
                },
              ),
            ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }

  Widget _searchList() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Form(
        key: searchKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Text(
                '所属部门：',
                style: TextStyle(fontSize: ScreenUtil().setSp(30)),
              ),
            ),
            Container(
              height: ScreenUtil().setHeight(100),
              width: ScreenUtil().setWidth(460),
              alignment: Alignment.centerLeft,
              child: TextFormField(
                autofocus: false,
                style: TextStyle(color: Colors.black54, fontSize: 18.0),
                decoration: InputDecoration(hintText: '输入所属部门查询'),
                obscureText: false,
                onSaved: (value) {
                  belongDepartment = value;
                },
                validator: (value) {
                  if (value.length == 0) {
                    return "此处不能为空";
                  } else {
                    return null;
                  }
                  /** continue...*/
                },
                onFieldSubmitted: (value) {},
                /** continue...*/
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                '程序编号：',
                style: TextStyle(fontSize: ScreenUtil().setSp(30)),
              ),
            ),
            Container(
              height: ScreenUtil().setHeight(100),
              width: ScreenUtil().setWidth(460),
              alignment: Alignment.centerLeft,
              child: TextFormField(
                autofocus: false,
                style: TextStyle(color: Colors.black54, fontSize: 18.0),
                decoration: InputDecoration(hintText: '输入程序编号查询'),
                obscureText: false,
                onSaved: (value) {
                  sequenceNumber = value;
                },
                validator: (value) {
                  if (value.length == 0) {
                    return "此处不能为空";
                  } else {
                    return null;
                  }
                  /** continue...*/
                },
                onFieldSubmitted: (value) {},
                /** continue...*/
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                '修订标记：',
                style: TextStyle(fontSize: ScreenUtil().setSp(30)),
              ),
            ),
            Container(
              height: ScreenUtil().setHeight(100),
              width: ScreenUtil().setWidth(460),
              alignment: Alignment.centerLeft,
              child: TextFormField(
                autofocus: false,
                style: TextStyle(color: Colors.black54, fontSize: 18.0),
                decoration: InputDecoration(hintText: '输入修订标识查询'),
                obscureText: false,
                onSaved: (value) {
                  fixingMark = value;
                },
                validator: (value) {
                  if (value.length == 0) {
                    return "此处不能为空";
                  } else {
                    return null;
                  }
                  /** continue...*/
                },
                onFieldSubmitted: (value) {},
                /** continue...*/
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                '关键字查找：',
                style: TextStyle(fontSize: ScreenUtil().setSp(30)),
              ),
            ),
            Container(
              height: ScreenUtil().setHeight(100),
              width: ScreenUtil().setWidth(460),
              alignment: Alignment.centerLeft,
              child: TextFormField(
                autofocus: false,
                style: TextStyle(color: Colors.black54, fontSize: 18.0),
                decoration: InputDecoration(hintText: '输入关键字模糊查询'),
                obscureText: false,
                onSaved: (value) {
                  keyWord = value;
                },
                validator: (value) {
                  if (value.length == 0) {
                    return "此处不能为空";
                  } else {
                    return null;
                  }
                  /** continue...*/
                },
                onFieldSubmitted: (value) {},
                /** continue...*/
              ),
            ),
          ],
        ),
      ),
    );
  }
}
