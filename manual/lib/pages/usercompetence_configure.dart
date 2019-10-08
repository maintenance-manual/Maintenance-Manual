import 'package:flutter/material.dart';
import 'package:manual/service/service_method.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:manual/main_page.dart';

class UserCompetence extends StatefulWidget {
  @override
  _UserCompetenceState createState() => _UserCompetenceState();
}

class _UserCompetenceState extends State<UserCompetence> {
  GlobalKey<FormState> searchKey = GlobalKey<FormState>();
  GlobalKey<RefreshFooterState> _footerkey = GlobalKey<RefreshFooterState>();

  @override
  bool get wantKeepAlive => true;

  String searchText = '';
  void search() {
    var searchForm = searchKey.currentState;
    if (searchForm.validate()) {
      searchForm.save();
      print(searchText);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: request(
        'url', /**continue... */
      ),
      builder: (context, snapshot) {
        if (true /**continue... */) {
          /**continue... */

          return Scaffold(
            body: EasyRefresh(
              refreshFooter: ClassicsFooter(
                key: _footerkey,
                bgColor: Colors.white,
                textColor: Colors.blueGrey,
                moreInfoColor: Colors.blueGrey,
                showMore: true,
                noMoreText: '',
                moreInfo: '加载中',
                loadReadyText: '上拉加载...',
              ),
              child: ListView(
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.fromLTRB(20.0, 20.0, 50.0, 20.0),
                    height: ScreenUtil().setHeight(210),
                    width: ScreenUtil().setWidth(1090),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colors.amber[300],
                        Colors.amberAccent,
                        Colors.lime
                      ]),
                      borderRadius:
                          BorderRadius.horizontal(right: Radius.circular(90)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1.0, 1.0),
                            blurRadius: 10.0,
                            spreadRadius: 2.0)
                      ],
                    ),
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          color: Colors.amber,
                          icon: Icon(
                            Icons.arrow_back,
                            size: 50.0,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                        Text(
                          '   用户权限配置',
                          style: TextStyle(color: Colors.black54, fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                  Container(
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
                                style: TextStyle(
                                    color: Colors.black38, fontSize: 18.0),
                                decoration: InputDecoration(hintText: '模糊搜索'),
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
                          child: Text("搜索"),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          onPressed: (/** continue...*/) {
                            search();
                            /** continue...*/
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(75, 20, 120, 0),
                    height: ScreenUtil().setHeight(150),
                    width: ScreenUtil().setWidth(1081),
                    child: Text(
                      '用户列表',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  _listTitle(),
                  _userList(),
                ],
              ),
              loadMore: () async {
                print('开始加载更多');
                /** continue...*/
              },
            ),
          );
        } else {
          return Center(
            child: Text('加载中......'),
          );
        }
      },
    );
  }

//暂用数据，可删
  List<String> departmentConfigName = [
    '质量检测部门',
    '航空情报部门',
    '空中管制部门',
    '地勤打扫部门',
  ];

  Widget _userList() {
    return Container(
      height: ScreenUtil().setHeight(950),
      child: ListView.builder(
        itemCount: departmentConfigName.length,
        itemBuilder: (context, index) {
          return _cardList(index);
        },
      ),
    );
  }

  Widget _cardList(index) {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(90),
      margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1.0, color: Colors.black12))),
      child: ListTile(
        contentPadding: EdgeInsets.only(left: 6.0),
        title: Text(
          '${departmentConfigName[index]}',
          style: TextStyle(
            fontSize: 12.0,
          ),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.delete),
          iconSize: 25.0,
        ),
      ),
    );
  }

  Widget _listTitle() {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(120),
      decoration: BoxDecoration(
          border: Border(
        top: BorderSide(width: 1, color: Colors.black12),
        bottom: BorderSide(width: 1, color: Colors.black12),
      )),
      margin: EdgeInsets.fromLTRB(10, 0, 10, 15),
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(150),
            height: ScreenUtil().setHeight(120),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10),
            child: Text(
              '所属部门',
              style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(28),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(150),
            height: ScreenUtil().setHeight(120),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10),
            child: Text(
              '用户名',
              style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(28),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(150),
            height: ScreenUtil().setHeight(120),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10),
            child: Text(
              '岗位名称',
              style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(28),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(150),
            height: ScreenUtil().setHeight(120),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10),
            child: Text(
              '系统权限',
              style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(28),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(110),
            height: ScreenUtil().setHeight(120),
          ),
        ],
      ),
    );
  }
}
