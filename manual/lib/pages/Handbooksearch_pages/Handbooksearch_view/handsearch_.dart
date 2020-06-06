import 'dart:convert';

import 'package:dio/dio.dart';
/**
 * 手册基本信息查看
 */
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

String procedureNum = "";
String procedureName = "";
String purpose = "";
String application = "";
String terms = "";
String according = "";
String formAndAttachment = "";

Future getDetailInfo(procedureNum) async {
  try {
    Dio dio = Dio();
    Response response = await dio.get(
      "http://47.93.54.102:5000/findHandbook/procedureDetails?manualName=维修管理手册工作程序&procedureNumber=$procedureNum",
      options: Options(responseType: ResponseType.plain),
    );
    return response.data;
  } catch (e) {}
}

class BookBasicMessageView extends StatefulWidget {
  BookBasicMessageView(procedurenum) {
    procedureNum = procedurenum;
  }

  @override
  _BookBasicMessageViewState createState() => _BookBasicMessageViewState();
}

class _BookBasicMessageViewState extends State<BookBasicMessageView> {
  getInfo() {
    getDetailInfo(procedureNum).then((value) {
      var data = json.decode(value.toString());
      print(data.toString());
      int point1 = data.toString().indexOf(procedureNum);
      int point2 = data.toString().indexOf(".pdf");
      procedureName = data.toString().substring(point1 + 9, point2);
      int point3 = data.toString().indexOf("purpose:");
      int point4 = data.toString().indexOf(", revision");
      purpose = data.toString().substring(point3 + 9, point4);
      int point5 = data.toString().indexOf("application:");
      int point6 = data.toString().indexOf(", createTime");
      application = data.toString().substring(point5 + 13, point6);
      int point7 = data.toString().indexOf("terms:");
      int point8 = data.toString().indexOf(", updateTime:");
      terms = data.toString().substring(point7 + 6, point8);
      int point9 = data.toString().indexOf("according:");
      according = data.toString().substring(point9+10,point5-2);
      int point10 = data.toString().indexOf("formAndAttachment:");
      int point11 = data.toString().indexOf(", manualName");
      formAndAttachment = data.toString().substring(point10+17,point11);
    });
  }

  @override
  Widget build(BuildContext context) {
    getInfo();

    return Scaffold(
      appBar: AppBar(title: Text('手册基本信息查看')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20.0),
              width: ScreenUtil.screenWidth,
              child: Text(
                '  程序编号： $procedureNum',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(30.0),
                ),
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black12,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              width: ScreenUtil.screenWidth,
              child: Text(
                '  程序名称： $procedureName',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(30.0),
                ),
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black12,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              width: ScreenUtil.screenWidth,
              child: Text(
                '  手册名称： 维修管理手册工作程序',
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(30.0),
                ),
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black12,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              width: ScreenUtil.screenWidth,
              child: ListTile(
                title: Text(
                  '1. 目的： ',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(30.0),
                  ),
                ),
                subtitle: Text(purpose),
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black12,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              width: ScreenUtil.screenWidth,
              child: ListTile(
                title: Text(
                  '2. 适用范围： ',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(30.0),
                  ),
                ),
                subtitle: Text(application),
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black12,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              width: ScreenUtil.screenWidth,
              child: ListTile(
                title: Text(
                  '2. 名词术语： ',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(30.0),
                  ),
                ),
                subtitle: Text(terms),
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black12,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              width: ScreenUtil.screenWidth,
              child: ListTile(
                title: Text(
                  '3. 依据： ',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(30.0),
                  ),
                ),
                subtitle: Text(according),
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black12,
                  ),
                ),
              ),
            ),
            // ExpansionTile(
            //   title: Text('依据'),
            //   children: <Widget>[
            //     Text('data'),
            //   ],
            // ),
            ExpansionTile(
              title: Text('表格附件'),
              children: <Widget>[
                Text(formAndAttachment),
              ],
            ),
            Container(
              padding: EdgeInsets.all(15.0),
              width: ScreenUtil.screenWidth,
              child: Row(
                children: <Widget>[
                  Text(
                    ' 流程图： ',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(30.0),
                    ),
                  ),
                  InkWell(
                    child: Text(
                      "下载流程图",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15.0),
              width: ScreenUtil.screenWidth,
              child: Row(
                children: <Widget>[
                  Text(
                    ' 程序文件： ',
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(30.0),
                    ),
                  ),
                  InkWell(
                    child: Text(
                      "下载程序文件",
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
