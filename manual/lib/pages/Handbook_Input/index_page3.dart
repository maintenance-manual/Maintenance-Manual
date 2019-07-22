import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; //cupertino风格组件;
import 'package:manual/pages/HandBook_Input/handbook_input.dart'; //手册录入手册录入界面;
import 'sequencing_input.dart'; //手册录入程序录入界面;

class IndexPage3 extends StatefulWidget {
  //动态组件;
  _IndexPage3State createState() => _IndexPage3State();
}

class _IndexPage3State extends State<IndexPage3> {
  final List<BottomNavigationBarItem> bottomTabs = [
    //定义BottomNavigationBarItem底部导航条组件(图片，文字)
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.shopping_cart), title: Text('手册录入')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.circle), title: Text('程序录入')),
  ];

  final List tabBodies = [
    //数组选择需要进入的页面，按照0，1，2，3顺序
    HandBookInput(),
    SequencingInput(),
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
