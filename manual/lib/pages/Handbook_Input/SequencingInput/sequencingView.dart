import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

String handbookname;
String handbookfile;
String createtime_1 = '1';
String updatetime_2 = '1';
List sequencinglist = List(15);

class SequencingView extends StatefulWidget {
  final String sequencingList;
  SequencingView(this.sequencingList) {
    Pattern pattern = '--';
    List templist = sequencingList.split(pattern);
    sequencinglist[0] = templist[0];
    sequencinglist[1] = templist[1];
    sequencinglist[2] = templist[2];
    sequencinglist[3] = templist[3];
    sequencinglist[4] = templist[4];
    sequencinglist[5] = templist[5];
    sequencinglist[6] = templist[6];
    sequencinglist[7] = templist[7];
    sequencinglist[8] = templist[8];
    sequencinglist[9] = templist[9];
    sequencinglist[10] = templist[10];
    sequencinglist[11] = templist[11];
    sequencinglist[12] = templist[12];
    sequencinglist[13] = templist[13];
    sequencinglist[14] = templist[14];
  }

  @override
  _SequencingViewState createState() => _SequencingViewState();
}

class _SequencingViewState extends State<SequencingView> {
  List<String> textlist = [
    '程序编号: ' + sequencinglist[0],
    '程序名称：' + sequencinglist[1].toString().substring(0, 24),
    '手册文件：' + sequencinglist[2],
    '目的：' + sequencinglist[3],
    '适用范围：' + sequencinglist[4],
    '名词术语：' + sequencinglist[5],
    '依据：' + sequencinglist[6],
    '程序：' + sequencinglist[7],
    '存档：' + sequencinglist[8],
    '表格和附件：' + sequencinglist[9],
    '流程图：' + sequencinglist[10],
    '修订版本：' + sequencinglist[11],
    '创建时间：' + sequencinglist[12],
    '更新时间：' + sequencinglist[13],
    '程序文件：' + sequencinglist[14],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('程序查看')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: ScreenUtil().setHeight(1034),
              child: ListView.builder(
                itemCount: textlist.length,
                itemBuilder: (context, index) {
                  return _sequencingItem(textlist[index]);
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
                    //launch(url);
                  },
                  child: Text('修改'),
                ),
              ),
            ),
          ],
        ));
  }

  Widget _sequencingItem(String textitem) {
    return RaisedButton(
      highlightElevation: 45,
      onPressed: () {},
      child: Row(
        children: <Widget>[
          Text(
            textitem,
            style: TextStyle(fontSize: ScreenUtil().setSp(35)),
          ),
        ],
      ),
    );
  }
}
