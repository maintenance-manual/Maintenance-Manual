import 'package:flutter/material.dart';
import 'package:manual/page1.dart';

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
              ExpansionTile(
                title: Text('item'),
                trailing: Icon(Icons.arrow_drop_down),
                children: <Widget>[
                  ListTile(
                    title: Text('data'),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => PageMore()));
                    },
                  ),
                  ListTile(
                    title: Text('data'),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => PageMore()));
                    },
                  ),
                  ListTile(
                    title: Text('data'),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => PageMore()));
                    },
                  ),
                ],
              ),
              ListTile(
                title: Text('data'),
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => PageMore()));
                },
              ),
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
}
