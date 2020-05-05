/**
 * 手册基本信息查看
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class BookBasicMessageView extends StatefulWidget {
  BookBasicMessageView({Key key}) : super(key: key);

  @override
  _BookBasicMessageViewState createState() => _BookBasicMessageViewState();
}

class _BookBasicMessageViewState extends State<BookBasicMessageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('手册基本信息查看')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(''),
            Text('  程序编号： ',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(30.0),
                )),
            Divider(
              thickness: 2.0,
              color: Colors.black12,
            ),
            Text('  程序名称： ',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(30.0),
                )),
            Divider(
              thickness: 2.0,
              color: Colors.black12,
            ),
            Text('  手册文件： ',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(30.0),
                )),
            Divider(
              thickness: 2.0,
              color: Colors.black12,
            ),
            ListTile(
              title: Text('1. 目的： ',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(25.0),
                  )),
            ),
            Divider(
              thickness: 2.0,
              color: Colors.black12,
            ),
            ListTile(
              title: Text('2. 适用范围： ',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(25.0),
                  )),
              subtitle: Text('data'),
            ),
            Divider(
              thickness: 2.0,
              color: Colors.black12,
            ),
            ListTile(
              title: Text('3. 名词术语： ',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(25.0),
                  )),
            ),
            ExpansionTile(
              title: Text('依据'),
              children: <Widget>[
                Text('data'),
              ],
            ),
            ExpansionTile(
              title: Text('表格附件'),
              children: <Widget>[
                Text('data'),
              ],
            ),
            ExpansionTile(
              title: Text('流程图'),
              children: <Widget>[
                Text('data'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
