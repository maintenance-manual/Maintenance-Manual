import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; //cupertino风格组件;
import 'package:manual/pages/Basic_Configure/department_configure.dart'; //基本配置部门配置界面;
import 'package:manual/pages/Basic_Configure/people_configure.dart'; //基本配置人员配置界面;
import 'package:manual/pages/Basic_Configure/post_configure.dart'; //基本配置岗位配置界面;

class IndexPage1 extends StatefulWidget {
  //动态组件;
  _IndexPage1State createState() => _IndexPage1State();
}

class _IndexPage1State extends State<IndexPage1> {
  final List<BottomNavigationBarItem> bottomTabs = [
    //定义BottomNavigationBarItem底部导航条组件(图片，文字)
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search), title: Text('部门配置')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart), title: Text('人员配置')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.circle), title: Text('岗位配置')),
  ];

  final List tabBodies = [
    //数组选择需要进入的页面，按照0，1，2，3顺序
    DepartmentConfigure(),
    PeopleConfigure(),
    PostConfigure(),
  ];

  int currentIndex = 0; //索引
  var currentPage; //显示页面(动态)

  @override
  void initState() {
    //路由
    currentPage = tabBodies[currentIndex]; //默认homepage页面打开
    super.initState(); //选择其他页面
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 245, 244, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, //用于显示bottom的类型;
        currentIndex: currentIndex, //当前索引，用来切换按钮控制;
        items: bottomTabs, //对应List<BottomNavigationBarItem>上文，包含图片，文字信息;
        onTap: (index) {
          setState(() {
            currentIndex = index;
            currentPage = tabBodies[currentIndex];
          }); //翻牌子
        },
      ),
      body: currentPage,
    );
  }
}
