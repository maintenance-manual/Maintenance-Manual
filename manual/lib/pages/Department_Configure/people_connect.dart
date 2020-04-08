import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:manual/login_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:manual/model/peopleConnectionModel.dart';
import 'package:manual/pages/Department_Configure/people_connect_pages/peopleConnectionsearch.dart';
import 'package:manual/provide/peopleConnectModelProvide.dart';
import 'package:provide/provide.dart';
import 'people_connect_pages/people_connect_delete.dart'; //引入人员工作对接删除页面;
import 'people_connect_pages/people_connect_createnew.dart'; //引入人员工作对接新建页面;

String departmentname;
PeopleConnectionModel peopleConnectionModel; //引入人员工作对接配置接口;
PeopleConnectionModel searchpeopleConnectionModel; //引入查询人员工作对接配置接口;
//引入修改人员工作对接后台数据接口
Future modifyDepartmentConfiguration() async {
  try {
    Response response = await Dio().get(
        "http://47.93.54.102:5000/departmentConfigurations/personnel_work?username=$userName&&keyword=",
        options: Options(
          responseType: ResponseType.plain,
        ));
    return response.data;
  } catch (e) {
    print(e);
  }
}

//引入查询人员工作对接后台数据接口
Future searchDepartmentConfiguration(keyword) async {
  try {
    Response response = await Dio().get(
        "http://47.93.54.102:5000/departmentConfigurations/personnel_work?username=$userName&&keyword=$keyword",
        options: Options(
          responseType: ResponseType.plain,
        ));
    return response.data;
  } catch (e) {
    print(e);
  }
}

class PeopleConnect extends StatefulWidget {
  PeopleConnect({Key key}) : super(key: key);

  @override
  _PeopleConnectState createState() => _PeopleConnectState();
}

class _PeopleConnectState extends State<PeopleConnect> {
  @override
  void initState() {
    // TODO: implement initState
    modifyDepartmentConfiguration().then((val) {
      var data = jsonDecode(val.toString());
      peopleConnectionModel = PeopleConnectionModel.fromJson(data);
      print(peopleConnectionModel.toJson());
      departmentname = peopleConnectionModel.workList[0].split('--')[0];
      print(departmentname);
      Provide.value<PeopleConnectionModelProvider>(context)
          .getpeopleConnectionlist(peopleConnectionModel);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Text('人员工作对接'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: ScreenUtil().setHeight(110),
              width: ScreenUtil().setWidth(750),
              padding: EdgeInsets.only(top: 20),
              margin: EdgeInsets.only(left: 15, right: 15),
              child: Text(
                '人员工作对接',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: ScreenUtil().setSp(50),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              height: ScreenUtil().setHeight(100),
              margin: EdgeInsets.only(left: 15, right: 15),
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  print('>>>>>>>>>' + departmentname);
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          PeopleConnection_CreateNew(departmentname)));
                },
                child: Text(
                  '新建',
                  style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: ScreenUtil().setSp(28.0)),
                ),
              ),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: Colors.black12))),
            ),
            SearchPage(),
            PeopleConfigShow(),
          ],
        ),
      ),
    ));
  }
}

//search
class SearchPage extends StatelessWidget {
  GlobalKey<FormState> searchKey = GlobalKey<FormState>();
  String searchText = '';

  void _search(context) {
    var searchForm = searchKey.currentState;
    if (searchForm.validate()) {
      searchForm.save();
      print(searchText);
      searchDepartmentConfiguration(searchText).then((val) {
        var data = jsonDecode(val.toString());
        searchpeopleConnectionModel = PeopleConnectionModel.fromJson(data);
        if (searchpeopleConnectionModel.workList.length == 0) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                    '当前没有您要查询的结果',
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
           Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      PeopleConnectionSearch(searchpeopleConnectionModel.workList)));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5.0),
      height: ScreenUtil().setHeight(180),
      width: ScreenUtil().setWidth(1081),
      child: Row(
        children: <Widget>[
          Form(
              key: searchKey,
              child: Container(
                margin: EdgeInsets.all(10.0),
                width: ScreenUtil().setWidth(500),
                child: TextFormField(
                  autofocus: false,
                  style: TextStyle(color: Colors.black38, fontSize: 18.0),
                  decoration: InputDecoration(hintText: '关键字模糊查询'),
                  textAlign: TextAlign.center,
                  obscureText: false,
                  onSaved: (value) {
                    searchText = value;
                  },
                  validator: (value) {
                    if (value.length == 0) {
                      return "不允许为空";
                    } else {
                      return null;
                    }
                  },
                  onFieldSubmitted: (value) {},
                  /** continue...*/
                ),
              )),
          FlatButton(
            color: Colors.grey[500],
            highlightColor: Colors.amberAccent[400],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("查询"),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            onPressed: (/** continue...*/) {
              _search(context);
              /** continue...*/
            },
          ),
        ],
      ),
    );
  }
}

//PeopleConnectShow
class PeopleConfigShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(940),
            padding: EdgeInsets.all(1.0),
            child: Provide<PeopleConnectionModelProvider>(
                builder: (context, child, peopleConnectionModelProvider) {
              return ListView.builder(
                itemCount: peopleConnectionModelProvider
                    .peopleConnectionModel.workList.length,
                itemBuilder: (context, index) {
                  List peopleconnectlist = peopleConnectionModelProvider
                      .peopleConnectionModel.workList[index]
                      .split('--');
                  return _myDrawer(context, peopleconnectlist[0],
                      peopleconnectlist[1], peopleconnectlist[2]);
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}

//部门名称目录;
Widget _myDrawer(context, departmentname, worker, workname) {
  return Column(
    children: <Widget>[
      Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.0)),
          color: Colors.black12,
        ),
        child: Column(
          children: <Widget>[
            ExpansionTile(
              title: Text(
                '所属部门： $departmentname',
                style: TextStyle(fontSize: ScreenUtil().setSp(36.0)),
              ),
              children: <Widget>[
                ListTile(
                  title: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text('工作名称： $workname'),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text('员工姓名： $worker'),
                      ),
                    ],
                  ),
                  trailing: Container(
                    width: ScreenUtil().setWidth(250),
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => People_Connect_Delete(context,departmentname,worker,workname)));
                      },
                      child: Container(
                        width: ScreenUtil().setWidth(70),
                        height: ScreenUtil().setHeight(50),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            color: Colors.orangeAccent),
                        child: Text(
                          '删除',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}
