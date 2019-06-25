import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MainPage',
      theme: ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('手册程序电子化管理系统'),
        ),
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              GroupItem('item1', A()),
              GroupItem('item2', A()),
              GroupItem('item3', A()),
              GroupItem('item4', A()),
              GroupItem('item5', A()),
              GroupItem('item6', A()),
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
                  child: Text('欢迎使用手册程序电子化管理系统'),
                  padding: EdgeInsets.fromLTRB(30.0, 50.0, 30.0, 20.0),
                ),
                Container(
                  child: Image.asset(
                    'assets/login3.jpg',
                    scale: 2.0,
                    fit: BoxFit.cover,
                  ),
                  padding: EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 20.0),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget A() {}
}

// class GroupData {
//   String groupName;
//   List<GroupItem> group;

//   GroupData(String groupName, List<GroupItem> group) {
//     this.group = group;
//     this.groupName = groupName;
//   }
// }

class GroupItem extends StatelessWidget {
  String name;
  Widget widget;

  GroupItem(String name, Widget widget) {
    this.name = name;
    this.widget = widget;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white10,
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Color(0xFFd9d9d9),
          ),
        ),
      ),
      height: 52.0,
      child: FlatButton(
        onPressed: () {},
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(name),
          ],
        ),
      ),
    );
  }
}
