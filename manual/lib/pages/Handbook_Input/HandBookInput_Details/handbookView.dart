import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

String handbookname;
String handbookfile;
String createtime_1 = '1';
String updatetime_2 = '1';

class HandBookInputViewItem extends StatefulWidget {
  HandBookInputViewItem(handbookname1, createtime1, updatetime1) {
    handbookname = handbookname1;
    createtime_1 = createtime1;
    updatetime_2 = updatetime1;
  }

  @override
  _HandBookInputViewItemState createState() => _HandBookInputViewItemState();
}

class _HandBookInputViewItemState extends State<HandBookInputViewItem> {
  List<String> textlist = [
    '手册名称: ' + handbookname,
    '手册文件：--',
    '创建时间：' + createtime_1,
    '更新时间：' + updatetime_2,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('手册查看')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: ScreenUtil().setHeight(600),
              child: ListView.builder(
                itemCount: textlist.length,
                itemBuilder: (context, index) {
                  return _handbookInputItem(textlist[index]);
                },
              ),
            ),
            Container(
              margin: EdgeInsets.all(1.0),
              child: SizedBox(
                width: ScreenUtil().setWidth(300),
                height: ScreenUtil().setHeight(100),
                child: RaisedButton(
                  onPressed: () {
                    const url =
                        'http://47.93.54.102:5000/handbookInput/handbook/modify';
                    launch(url);
                  },
                  child: Text('修改'),
                ),
              ),
            ),
          ],
        ));
  }

  Widget _handbookInputItem(String textitem) {
    return Container(
      color: Colors.grey[300],
      padding: EdgeInsets.only(left: 15.0),
      width: ScreenUtil().setWidth(1050),
      height: ScreenUtil().setHeight(150),
      child: Row(
        children: <Widget>[
          Text(
            textitem,
            style: TextStyle(fontSize: ScreenUtil().setSp(37.0)),
          ),
        ],
      ),
    );
  }
}
