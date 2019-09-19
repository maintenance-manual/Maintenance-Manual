import 'package:manual/service/service_method.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'people_connect_pages/people_connect_delete.dart';//引入人员工作对接删除页面;
import 'people_connect_pages/people_connect_createnew.dart';//引入人员工作对接新建页面;

class PeopleConnect extends StatelessWidget {
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
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.all(2.0),
              decoration: BoxDecoration(),
              child: Text(
                '人员工作对接',
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.black, fontSize: ScreenUtil().setSp(35.0)),
              ),
            ),
            Container(
              height: ScreenUtil().setHeight(50),
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 3.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          DepartmentName_Configure_CreateNew()));
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
                      bottom: BorderSide(width: 1, color: Colors.black))),
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
            color: Colors.grey[500],
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

//PeopleConnectShow
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
                              Text('工作名称：${departmentConfigPeopleName[index]}'),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text('员工姓名：${departmentConfigName[index]}'),
                        ),
                      ],
                    ),
                    trailing: Container(
                      width: ScreenUtil().setWidth(250),
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  People_Connect_Delete()));
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
