import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MainPage',
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('手册程序电子化管理系统'),
        ),
        drawer: Drawer(
          child: SingleChildScrollView(
            child: Stack(
              children: <Widget>[
                _myDrawer(),
                Positioned(
                  bottom: 0,
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: ScreenUtil().setWidth(220),
                        margin: EdgeInsets.only(left: 25.0),
                        padding: EdgeInsets.all(30),
                        child: InkWell(
                          onTap: (/**continue... */) {
                            /**continue... */
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()),
                                (route) => route == null);
                          },
                          child: Text('退出登录'),
                        ),
                      ),
                      Container(
                        width: ScreenUtil().setWidth(220),
                        margin: EdgeInsets.only(left: 10.0),
                        padding: EdgeInsets.all(30),
                        child: InkWell(
                          onTap: (/**continue... */) {/**continue... */},
                          child: Text('修改密码'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
                    '欢迎使用手册程序电子化管理系统',
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

  Widget _myDrawer() {
    return Column(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountEmail: Text('septemberman@outlook.com'),
          accountName: Text('sylar'),
          currentAccountPicture: ClipOval(
            child: Image.asset('assets/account1.jpg'),
          ),
        ),
        ListTile(
          title: Text('手册浏览'),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => HandBookView()));
          },
        ),
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
        Text(''),
        Text(''),
        Text(''),
        Text(''),
      ],
    );
  }
}
