import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manual/model/handbookInput_model.dart';
import 'package:manual/pages/Handbook_Input/HandBookInput_Details/handbookInputItem.dart';
import 'package:manual/provide/handbookInputProvide.dart';
import 'package:provide/provide.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'dart:convert';
import 'HandBookInput_Details/add_workbook.dart';

HandBookInputModel list; //手册录入查看手册数据模型
//引入读取部门配置后台数据接口
Future getHandBookInput() async {
  try {
    Dio dio = Dio();
    Response response =
        await dio.get("http://47.93.54.102:5000/handbookInput/handbook",
            options: Options(
              responseType: ResponseType.plain,
            ));
    return response.data;
  } catch (e) {
    print(e);
  }
}

class HandBookInput extends StatefulWidget {
  HandBookInput({Key key}) : super(key: key);

  _HandBookInputState createState() => _HandBookInputState();
}

class _HandBookInputState extends State<HandBookInput> {
  @override
  void initState() {
    getHandBookInput().then((val) {
      var data = json.decode(val.toString());
      HandBookInputModel handbookinputlist = HandBookInputModel.fromJson(data);
      setState(() {
        list = handbookinputlist;
      });
      Provide.value<HandBookInputModelProvide>(context)
          .getHandbookList(handbookinputlist);
      print('开始获取手册录入数据......');
      print(list.positionList);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Text('手册程序电子化管理系统'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: ScreenUtil().setHeight(110),
              width: ScreenUtil().setWidth(750),
              padding: EdgeInsets.only(top: 20),
              child: Text(
                '手册录入管理',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: ScreenUtil().setSp(50),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              height: ScreenUtil().setHeight(100),
              alignment: Alignment.centerLeft,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddNewWorkbook()));
                },
                child: Text(
                  '新建',
                  style: TextStyle(
                      color: Colors.blueGrey, fontSize: ScreenUtil().setSp(25)),
                ),
              ),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: Colors.black12))),
            ),
            _listTitle(),
            HandbookInputShow(list),
          ],
        ),
      ),
    ));
  }

  Widget _listTitle() {
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(120),
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(width: 1, color: Colors.black12),
      )),
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(300),
            height: ScreenUtil().setHeight(120),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10),
            child: Text(
              '手册名称',
              style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(28),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(250),
            height: ScreenUtil().setHeight(120),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10),
            child: Text(
              '手册文件',
              style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(25),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//部门显示目录
class HandbookInputShow extends StatelessWidget {
  HandbookInputShow(list);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: ScreenUtil().setHeight(1200),
          padding: EdgeInsets.all(1.0),
          child: Provide<HandBookInputModelProvide>(
            builder: (context, child, handbookInputModelProvide) {
              list = Provide.value<HandBookInputModelProvide>(context)
                  .handbookInputList;
              print('list:>>>>>>:   ' + list.toJson().toString());
              return Container(
                child: ListView.builder(
                  itemCount: list.positionList.length,
                  itemBuilder: (context, index) {
                    String temphandbookitemlist =
                        list.positionList[index].split('--')[0];
                    return HandBookInputItem(
                        context, list.positionList[0], temphandbookitemlist);
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
