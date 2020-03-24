import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manual/model/handbookSearch_model.dart';

String keyWord;
String department;
String responsable;
String job;
String position;
String fixingMark;
String name;
String number;

//关键字搜索手册
Future getList() async {
  try {
    Dio dio = Dio();
    // dio.options.contentType =
    //     ContentType.parse("application/x-www-form-urlencoded");
    if (number != '') {
      Response response = await dio.get(
          "http://47.93.54.102:5000/findHandbook/find_by_procedureNumber?keyWord=$number",
          options: Options(
            responseType: ResponseType.plain,
          ));
      return response.data;
    }
    if (name != '') {
      Response response = await dio.get(
          "http://47.93.54.102:5000/findHandbook/find_by_procedureName?keyWord=$name",
          options: Options(
            responseType: ResponseType.plain,
          ));
      return response.data;
    }
    if (fixingMark != '') {
      Response response = await dio.get(
          "http://47.93.54.102:5000/findHandbook/find_by_revision_mark?keyWord=$fixingMark",
          options: Options(
            responseType: ResponseType.plain,
          ));
      return response.data;
    }
    if (department != '') {
      Response response = await dio.get(
          "http://47.93.54.102:5000/findHandbook/find_by_department?keyWord=$department",
          options: Options(
            responseType: ResponseType.plain,
          ));
      return response.data;
    }
    if (position != '') {
      /**continue */
    }
    if (job != '') {
      /**continue */
    }
    if (responsable != '') {
      /**continue */
    }
    if (keyWord != '') {
      Response response = await dio.get(
          "http://47.93.54.102:5000/findHandbook/find_by_all?keyWord=$keyWord",
          options: Options(
            responseType: ResponseType.plain,
          ));
      return response.data;
    }
  } catch (e) {
    print(e);
  }
}

//显示目录，利用瓦片布局来显示；
class HandbookShowList extends StatefulWidget {
  HandbookShowList(
    String searchByNum,
    String searchByName,
    String searchByFixingMark,
    String searchByDepartment,
    String searchByPosition,
    String searchByJob,
    String searchByResponsable,
    String searchByKeyWord,
  ) {
    keyWord = searchByKeyWord;
    responsable = searchByResponsable;
    job = searchByJob;
    position = searchByPosition;
    department = searchByDepartment;
    fixingMark = searchByFixingMark;
    name = searchByName;
    number = searchByNum;
  }
  @override
  _HandbookShowListState createState() => _HandbookShowListState();
}

class _HandbookShowListState extends State<HandbookShowList> {
  List searchKeyWordList = [];

  @override
  void initState() {
    // TODO: implement initState
    getList().then((val) {
      var data = json.decode(val.toString());
      HandbookSearchModel handbookSearchModel =
          HandbookSearchModel.fromJson(data);
      setState(() {
        searchKeyWordList = handbookSearchModel.procedureList;
      });
      print(searchKeyWordList);
      print(searchKeyWordList.length);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('搜索记录结果'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              height: ScreenUtil().setHeight(100),
              width: ScreenUtil().setWidth(750),
              //color: Colors.pink,
              child: Text(
                '查询条件：', //状态管理显示;
                style: TextStyle(fontSize: ScreenUtil().setSp(36.0)),
              ),
            ),
            Container(
              margin: EdgeInsets.all(3.0),
              height: ScreenUtil().setHeight(50),
              width: ScreenUtil().setWidth(750),
              child: Text(
                '搜索到${searchKeyWordList.length}条符合条件的记录！', //状态管理显示;
                style: TextStyle(fontSize: ScreenUtil().setSp(30.0)),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            Container(
              height: ScreenUtil().setHeight(80),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 6.0, right: 6.0, bottom: 5.0),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1.0, color: Colors.black54))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 10.0),
                    alignment: Alignment.centerLeft,
                    width: ScreenUtil().setWidth(220),
                    //color: Colors.pink,
                    child: Text(
                      '程序编号',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(35.0)),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    width: ScreenUtil().setWidth(250),
                    //color: Colors.blue,
                    child: Text(
                      '程序名称',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(35.0)),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    width: ScreenUtil().setWidth(190),
                    //color: Colors.orange,
                    margin: EdgeInsets.only(left: 9.0),
                    child: Text(
                      '修订标识',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: ScreenUtil().setSp(35.0)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: ScreenUtil().setHeight(900),
              child: ListView.builder(
                itemCount: searchKeyWordList.length,
                itemBuilder: (context, index) {
                  print("**********************");
                  print(searchKeyWordList.length);
                  return _handbookviewshowcardItem(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _handbookviewshowcardItem(index) {
    String string = searchKeyWordList[index];
    int pointIndex1 = string.indexOf("--");
    String pointString1 = string.substring(pointIndex1 + 2);

    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(190),
            height: ScreenUtil().setHeight(80),
            //color: Colors.pink,
            padding: EdgeInsets.all(3.0),
            child: InkWell(
              onTap: () {},
              child: Text(
                  string.substring(
                      string.indexOf("_") + 1, string.indexOf("_") + 9),
                  style: TextStyle(color: Colors.blueAccent)), //状态管理显示;
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(320),
            height: ScreenUtil().setHeight(80),
            //color: Colors.blue,
            padding: EdgeInsets.all(3.0),
            child: Text(
              string.substring(string.indexOf("_") + 10, string.indexOf(".")),
              style: TextStyle(color: Colors.blueAccent),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ), //状态管理显示;
          ),
          Container(
            alignment: Alignment.center,
            width: ScreenUtil().setWidth(150),
            height: ScreenUtil().setHeight(80),
            //color: Colors.orange,
            padding: EdgeInsets.all(3.0),
            child: Text(
                pointString1.substring(pointString1.indexOf("--") + 2,
                    pointString1.indexOf("--") + 4),
                style: TextStyle(color: Colors.blueAccent)), //状态管理显示;
          ),
        ],
      ),
    );
  }
}
