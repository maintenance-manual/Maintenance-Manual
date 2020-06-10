import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

String handbookname;
String handbookfile;
String createtime_1 = '1';
String updatetime_2 = '1';
List sequencinglist = List(15);
List templist = [];

class SequencingView extends StatefulWidget {
  final String sequencingList;
  SequencingView(this.sequencingList) {
    Pattern pattern = '--';
    templist = sequencingList.split(pattern);
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
  List textlist = [
    '程序编号: ',
    '程序名称：',
    '章节名称：',
    '手册名称：',
    '适用范围：',
    '名词术语：',
    '依据：',
    '程序：',
    '存档：',
    '表格和附件：',
    '流程图：',
    '程序文件：',
    '修订版本：',
    '创建时间：',
    '更新时间：',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('程序查看')),
      body: ListView.builder(
          itemCount: templist.length,
          itemBuilder: (context, index) {
            return _viewSequencyingConfig(context, index);
          }),
    );
  }

  Widget _viewSequencyingConfig(context, index) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.all(5.0),
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 2.0, color: Colors.black26),
        ),
      ),
      child: InkWell(
        onTap: (){
          if (index==14){
            print('程序文件下载');
          }
        },
        child: Text(textlist[index] + " " + templist[index],
            style: TextStyle(fontSize: ScreenUtil().setSp(36.0))),
      ),
    );
  }
}
