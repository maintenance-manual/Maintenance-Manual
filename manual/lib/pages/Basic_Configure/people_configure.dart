import 'package:flutter/material.dart';
import 'package:manual/pages/Basic_Configure/people_config_details.dart/people_config_view.dart';
import 'package:manual/service/service_method.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Basic_Configure/addPeopleConfig.dart'; //引入人员新建页面;
import 'people_config_details.dart/people_config_change.dart'; //引入人员修改界面;
import 'people_config_details.dart/people_config_delete.dart'; //引入人员删除界面;

class PeopleConfigure extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            appBar: AppBar(
              title: Text('人员配置'),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SearchPage(),
                  // Container(
                  //   alignment: Alignment.centerLeft,
                  //   padding: EdgeInsets.all(6.0),
                  //   decoration: BoxDecoration(
                  //       border: Border(
                  //           bottom:
                  //               BorderSide(width: 1.0, color: Colors.black54))),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: <Widget>[
                  //       Text(
                  //         '所属部门',
                  //         textAlign: TextAlign.left,
                  //         style: TextStyle(
                  //             color: Colors.black,
                  //             fontSize: ScreenUtil().setSp(35.0)),
                  //       ),
                  //       Container(
                  //         width: ScreenUtil().setWidth(180),
                  //       ),
                  //       Text(
                  //         '岗位名称',
                  //         textAlign: TextAlign.left,
                  //         style: TextStyle(
                  //             color: Colors.black,
                  //             fontSize: ScreenUtil().setSp(35.0)),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Container(
                    height: ScreenUtil().setHeight(800),
                    child: SingleChildScrollView(
                      child: PeopleConfigShow(),
                    ),
                  ),
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
                      builder: (context) => AddPeopleConfig()));
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

//search
class SearchPage extends StatelessWidget {
  GlobalKey<FormState> searchKey = GlobalKey<FormState>();
  GlobalKey<RefreshFooterState> _footerkey = GlobalKey<RefreshFooterState>();

  String searchText = '';

  void _search() {
    var searchForm = searchKey.currentState;
    if (searchForm.validate()) {
      searchForm.save();
      print(searchText);
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
                    return null;
                    /** continue...*/
                  },
                  onFieldSubmitted: (value) {},
                  /** continue...*/
                ),
              )),
          FlatButton(
            color: Colors.amber[300],
            highlightColor: Colors.amberAccent[400],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("查询"),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            onPressed: (/** continue...*/) {
              _search();
              /** continue...*/
            },
          ),
        ],
      ),
    );
  }
}

//PeopleConfigShow
class PeopleConfigShow extends StatelessWidget {
  List<String> departmentConfigName = [
    '质量检测部门',
    '航空情报部门',
    '空中管制部门',
    '地勤打扫部门',
  ];
  List<String> departmentConfigPeopleName = [
    '张三',
    '李四',
    '王五',
    '张三',
    '李四',
    '王五',
    '张三',
    '李四',
    '王五',
    '张三',
    '李四',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: ScreenUtil().setHeight(940),
          padding: EdgeInsets.all(1.0),
          child: ListView.builder(
            itemCount: departmentConfigName.length,
            itemBuilder: (context, index) {
              return _myDrawer(context, index);
            },
          ),
        ),
      ],
    );
  }

  //部门名称目录;
  Widget _myDrawer(context, index) {
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
                  '所属部门：${departmentConfigName[index]}',
                  style: TextStyle(fontSize: ScreenUtil().setSp(36.0)),
                ),
                children: <Widget>[
                  ListTile(
                    title: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          alignment: Alignment.centerLeft,
                          child:
                              Text('员工姓名：${departmentConfigPeopleName[index]}'),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text('岗位名称：${departmentConfigName[index]}'),
                        ),
                      ],
                    ),
                    trailing: Container(
                      width: ScreenUtil().setWidth(250),
                      alignment: Alignment.centerRight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          PeopleConfigChange()));
                            },
                            child: Container(
                              width: ScreenUtil().setWidth(70),
                              height: ScreenUtil().setHeight(60),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  color: Colors.orangeAccent),
                              child: Text(
                                '修改',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => PeopleConfigView()));
                            },
                            child: Container(
                              width: ScreenUtil().setWidth(70),
                              height: ScreenUtil().setHeight(60),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  color: Colors.orangeAccent),
                              child: Text(
                                '查看',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      PeopleConfigViDelete()));
                            },
                            child: Container(
                              width: ScreenUtil().setWidth(70),
                              height: ScreenUtil().setHeight(60),
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
                        ],
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
}
