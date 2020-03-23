import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manual/pages/change_pwd.dart';
import 'package:manual/login_page.dart';
import 'package:manual/pages/handbook_view.dart'; //手册浏览界面;
import 'package:manual/pages/handbook_search.dart'; //手册查询界面；
import 'package:manual/pages/usercompetence_configure.dart';
import 'package:manual/pages/Basic_Configure/index_page1.dart';
import 'package:manual/pages/Basic_Configure/index_page11.dart';
import 'package:manual/pages/Basic_Configure/index_page12.dart';
import 'package:manual/pages/Department_Configure/index_page2.dart';
import 'package:manual/pages/Department_Configure/index_page22.dart';
import 'package:manual/pages/Department_Configure/index_page21.dart';
import 'package:manual/pages/HandBook_Input/index_page3.dart';
import 'package:manual/pages/HandBook_Input/index_page31.dart';
import 'package:manual/login_page.dart';
import 'package:manual/provide/peopleConfigModelProvide.dart';
import 'package:provide/provide.dart';
import 'model/peopleConfig_model.dart';

PeoleConfigModel humanList;
List list = [];
String tempHumanItem;
int i;

class MainPage extends StatefulWidget {
  MainPage(
      userName, userListRight1, userListRight2, userListRight3, userListRight4);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {



  @override
  Widget build(BuildContext context) {
    list = Provide.value<PeopleConfigModelProvide>(context)
        .peopleConfignameList
        .humanList;
    // print('-------------------');
    // print(list);
    // print(userName);
    // print(list.length);
    for (int i = 0; i < list.length; i++) {
      if (list[i].contains(userName)) {
        tempHumanItem = list[i];
        //print(tempHumanItem);
        break;
      }
    }
    tempHumanItem.toString().split('--');
    // print(tempHumanItem.toString().split('--'));
    List temp12 = tempHumanItem.toString().split('--');
    //print(temp12[2]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MainPage',
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('手册程序电子化管理系统'),
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              Container(
                height: ScreenUtil().setHeight(1181),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      UserAccountsDrawerHeader(
                        accountEmail: SizedBox(
                          height: ScreenUtil().setHeight(40),
                          child: Text(temp12[2]),
                        ),
                        accountName: SizedBox(
                          height: ScreenUtil().setHeight(34),
                          child: Text(
                            '$userName',
                          ),
                        ),
                        currentAccountPicture: ClipOval(
                          child: Image.asset(
                            'assets/account2.jpg',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      _myDrawer(
                          '$userListRight1',
                          '$userListRight2',
                          '$userListRight3',
                          '$userListRight4'), //这里是drawer的列表容器;
                    ],
                  ),
                ),
              ),
              Container(
                height: ScreenUtil().setHeight(150),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    InkWell(
                      onTap: (/**continue... */) {
                        /**continue... */
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ChangePsw()));
                      },
                      child: Container(
                        width: ScreenUtil().setWidth(220),
                        height: ScreenUtil().setHeight(80),
                        alignment: Alignment.center,
                        //margin: EdgeInsets.only(left: 25.0),
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          color: Colors.grey,
                        ),
                        child: Text('修改密码'),
                      ),
                    ),
                    InkWell(
                      onTap: (/**continue... */) {
                        /**continue... */
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                            (route) => route == null);
                      },
                      child: Container(
                        width: ScreenUtil().setWidth(220),
                        height: ScreenUtil().setHeight(80),
                        alignment: Alignment.center,
                        //margin: EdgeInsets.only(left: 25.0),
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          color: Colors.grey,
                        ),
                        child: Text('退出登录'),
                      ),
                    ),
                  ],
                ),
              ), //这里是底部修改退出登录容器;
            ],
          ),
        ),
        body: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  child: Text(
                    '欢迎使用手册程序电子化管理系统 ',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0),
                  ),
                  padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 20.0),
                ),
                Container(
                  child: Image.asset(
                    'assets/login3.jpg',
                    scale: 2.0,
                    fit: BoxFit.cover,
                    width: 270.0,
                  ),
                  padding: EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 20.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _myDrawer(String userListRight1, String userListRight2,
      String userListRight3, String userListRight4) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text('手册浏览'),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HandBookView()));
          },
        ),
        if (userListRight3.contains("true")) //判断用户是否具有基本配置的权限
          ExpansionTile(
            title: Text('基本配置'),
            children: <Widget>[
              ListTile(
                title: Text('部门配置'),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => IndexPage1()));
                },
              ),
              ListTile(
                title: Text('岗位配置'),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => IndexPage11()));
                },
              ),
              ListTile(
                title: Text('人员配置'),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => IndexPage12()));
                },
              ),
            ],
          ),
        if (userListRight2.contains("true")) //判断用户是否具有手册录入权限;
          ExpansionTile(
            title: Text('手册录入'),
            children: <Widget>[
              ListTile(
                title: Text('手册录入'),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => IndexPage3()));
                },
              ),
              ListTile(
                title: Text('程序录入'),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => IndexPage31()));
                },
              ),
            ],
          ),
        if (userListRight4.contains("true")) //判断用户是否用部门配置权限;
          ExpansionTile(
            title: Text('部门配置'),
            children: <Widget>[
              ListTile(
                title: Text('工作名称配置'),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => IndexPage2()));
                },
              ),
              ListTile(
                title: Text('人员工作对接'),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => IndexPage21()));
                },
              ),
              ListTile(
                title: Text('流程工作对接'),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => IndexPage22()));
                },
              ),
            ],
          ),
        if (userListRight1.contains("true")) //判断用户是否有管理员权限
          ListTile(
            title: Text('用户权限配置'),
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => UserCompetence()));
            },
          ),
        ListTile(
          title: Text('手册查询'),
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => HandBookSearch()));
          },
        ),
      ],
    );
  }
}
