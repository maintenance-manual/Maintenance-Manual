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
  GlobalKey<RefreshFooterState> _footerkey =
      new GlobalKey<RefreshFooterState>();

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
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MainPage()));
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
                                    color: Colors.black26, fontSize: 18.0),
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
                    padding: EdgeInsets.fromLTRB(75, 20, 120, 20),
                    height: ScreenUtil().setHeight(200),
                    width: ScreenUtil().setWidth(1081),
                    child: Text(
                      '用户列表',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
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

  Widget _userList() {
    return Container(
      child: Column(
        children: <Widget>[
          /**continue... */
        ],
      ),
    );
  }
}
