import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:manual/model/userconpentence_configModel.dart';
import 'package:manual/pages/userConpentenceConfig/resetpassword.dart';
import 'package:manual/pages/userConpentenceConfig/userConpentenceItem.dart';
import 'package:manual/pages/userConpentenceConfig/userConpentenceSearch.dart';
import 'package:manual/provide/userconpentenceModelProvide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:provide/provide.dart';

UserconpentenceModel list;
String searchText;
//增加查询所有员工权限数据接口;
Future userConpentence() async {
  try {
    Dio dio = Dio();
    dio.options.contentType =
        ContentType.parse("application/x-www-form-urlencoded");
    Response response =
        await dio.get("http://47.93.54.102:5000/rightConfiguration/",
            options: Options(
              responseType: ResponseType.plain,
            ));
    return response.data;
  } catch (e) {
    print(e);
  }
}

//关键字查询用户权限接口
Future keywordSearch(searchText) async {
  try {
    Dio dio = Dio();
    dio.options.contentType =
        ContentType.parse("application/x-www-form-urlencoded");
    Response response = await dio.get(
        "http://47.93.54.102:5000/rightConfiguration/find?keyWord=$searchText",
        options: Options(
          responseType: ResponseType.plain,
        ));
    print(response.data);
    return response.data;
  } catch (e) {
    print(e);
  }
}

class UserCompetence extends StatefulWidget {
  @override
  _UserCompetenceState createState() => _UserCompetenceState();
}

class _UserCompetenceState extends State<UserCompetence> {
  GlobalKey<FormState> searchKey = GlobalKey<FormState>();
  GlobalKey<RefreshFooterState> _footerkey = GlobalKey<RefreshFooterState>();
  @override
  bool get wantKeepAlive => true;

  List keyWordlist = [];
  void search(context) {
    var searchForm = searchKey.currentState;
    if (searchForm.validate()) {
      searchForm.save();
      keywordSearch(searchText).then((val) {
        var data = json.decode(val.toString());
        KeyWordSearchModel keyWordSearchlist =
            KeyWordSearchModel.fromJson(data);
        keyWordlist = keyWordSearchlist.userList;
        print(keyWordlist);
        print(keyWordlist.length);
        if (keyWordlist.length == 0) {
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
          print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
          print(keyWordlist);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => UserConpentenceSearch(keyWordlist)));
        }
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    userConpentence().then((val) {
      var data = json.decode(val.toString());
      UserconpentenceModel userConpentencelist =
          UserconpentenceModel.fromJson(data);
      setState(() {
        list = userConpentencelist;
      });
      print('开始获取所有员工权限数据......');
      print(list.toJson());
      Provide.value<UserConpentenceConfigModelProvide>(context)
          .getuserConpentenceConfigList(list); //将获取的员工权限数据存放在List中;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      builder: (context, snapshot) {
        if (true /**continue... */) {
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
                                  if (value.length == 0) {
                                    return "不允许为空";
                                  } else {
                                    return null;
                                  }
                                },
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
                          onPressed: () {
                            search(context);
                            print("***********************");
                          },
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: ScreenUtil().setHeight(80),
                    width: ScreenUtil().setWidth(1081),
                    padding: EdgeInsets.only(left: 10.0),
                    child: Text(
                      '用户列表',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  _listTitle(),
                  Container(
                    height: ScreenUtil().setHeight(950),
                    child: Provide<UserConpentenceConfigModelProvide>(
                      builder:
                          (context, child, userConpentenceConfigModelProvide) {
                        list = Provide.value<UserConpentenceConfigModelProvide>(
                                context)
                            .userConpentencelist;
                        return Container(
                          child: ListView.builder(
                            itemCount: list.userList.length,
                            itemBuilder: (context, index) {
                              return CardUserConpentenceItem(
                                  //传递单个数据给标签，进行经一部筛选
                                  context,
                                  list.userList[index]);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
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

  Widget _listTitle() {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(120),
      decoration: BoxDecoration(
          border: Border(
        top: BorderSide(width: 1, color: Colors.black12),
        bottom: BorderSide(width: 1, color: Colors.black12),
      )),
      margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
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
