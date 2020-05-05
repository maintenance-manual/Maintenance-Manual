import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:manual/pages/Handbooksearch_pages/Handbooksearch_view/handsearch_.dart';
import 'package:manual/pages/Handbooksearch_pages/Handbooksearch_view/handsearch_filingwatch.dart';
import 'package:manual/pages/Handbooksearch_pages/Handbooksearch_view/handsearch_processwatch.dart';

/**
 * 手册详细信息索引分段页面
 */
class HandBookSearchView extends StatefulWidget {
  HandBookSearchView({Key key}) : super(key: key);

  @override
  _HandBookSearchViewState createState() => _HandBookSearchViewState();
}

class _HandBookSearchViewState extends State<HandBookSearchView> {
  final List<BottomNavigationBarItem> bottomTabs = [
    //定义BottomNavigationBarItem底部导航条组件(图片，文字)
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.search), title: Text('手册基本信息')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.pencil), title: Text('程序流程查看')),
    BottomNavigationBarItem(
        icon: Icon(CupertinoIcons.book), title: Text('存档信息查看')),
  ];

  final List tabBodies = [
    //数组选择需要进入的页面，按照0，1，2，3顺序
    BookBasicMessageView(), //手册基本信息页面
    HandSearchProcessWatch(handbookname,procedureNumber), //程序流程查看页面
    HandSearhFilingWatch(), //存档信息查看
  ];

  @override
  void initState() {
    //路由
    currentPage = tabBodies[0]; //默认homepage页面打开
    super.initState(); //选择其他页面
  }

  int currentIndex = 0; //索引
  var currentPage; //显示页面(动态)
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
