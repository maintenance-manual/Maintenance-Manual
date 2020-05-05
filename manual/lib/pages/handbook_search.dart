import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:manual/model/handbookSearch_model.dart';
import './Handbooksearch_pages/allprocess_view.dart';
import 'package:manual/pages/handbook_view.dart';
import 'package:manual/service/service_method.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './Handbooksearch_pages/handbook_show.dart'; //引入显示搜索结果界面;

/**
 * 手册查询
 */
//查询特定手册文件的程序流程
Future _getHandBookbykeyword(findtype, keyword) async {
  try {
    Dio dio = Dio();
    Response response = await dio.get(
        'http://47.93.54.102:5000/findHandbook/$findtype?keyWord=$keyword',
        options: Options(responseType: ResponseType.plain));
    print('关键字查询手册：' + response.data);
    return response.data;
  } catch (e) {}
}

class HandBookSearch extends StatefulWidget {
  @override
  _HandBookSearchState createState() => _HandBookSearchState();
}

class _HandBookSearchState extends State<HandBookSearch> {
  GlobalKey<FormState> searchKey = GlobalKey<FormState>();
  List procedurelist = [];
  int count = 0;
  String searchtype = '';
  String searchByNum = '';
  String searchByName = '';
  String searchByFixingMark = '';
  String searchByDepartment = '';
  String searchByPosition = '';
  String searchByJob = '';
  String searchByResponsable = '';
  String searchByKeyWord = '';

  String findtype = ' '; //定义查找类型
  String find_by_procedureNumber = '';
  String find_by_procedureName = '';
  String find_by_work_name = '';
  String find_by_revision_mark = '';
  String find_by_department = '';
  String find_by_position = '';
  String find_by_person = '';
  String find_by_all = '';
  void search() {
    var searchForm = searchKey.currentState;
    if (searchForm.validate()) {
      searchForm.save();
      count = 0;
      setState(() {
        if (searchByNum != '') {
          searchtype = searchByNum;
          findtype = find_by_procedureNumber;
          count++;
        }
        if (searchByName != '') {
          searchtype = searchByName;
          findtype = find_by_procedureName;
          count++;
        }
        if (searchByFixingMark != '') {
          searchtype = searchByFixingMark;
          findtype = find_by_revision_mark;
          count++;
        }
        if (searchByDepartment != '') {
          searchtype = searchByDepartment;
          findtype = find_by_department;
          count++;
        }
        if (searchByPosition != '') {
          searchtype = searchByPosition;
          findtype = find_by_position;
          count++;
        }
        if (searchByJob != '') {
          searchtype = searchByJob;
          findtype = find_by_work_name;
          count++;
        }
        if (searchByResponsable != '') {
          searchtype = searchByResponsable;
          findtype = find_by_person;
          count++;
        }
        if (searchByKeyWord != '') {
          searchtype = searchByKeyWord;
          findtype = find_by_all;
          count++;
        }
      });
      if (count == 1) {
        print(findtype + searchtype);
        searchbykeyword_method(findtype, searchtype);
      } else {
        Fluttertoast.showToast(
          msg: "请输入单一查询条件",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
        );
      }
    }
  }

  //关键字查询
  Future searchbykeyword_method(findtype, searchbyKeyword) {
    _getHandBookbykeyword(findtype, searchbyKeyword).then((val) {
      var data = jsonDecode(val.toString());
      HandbookSearchModel handbookSearchModel_temp =
          HandbookSearchModel.fromJson(data);
      // print(handbookSearchModel_temp.toJson());
      setState(() {
        procedurelist = handbookSearchModel_temp.procedureList;
        print(procedurelist);
      });

      if (procedurelist.length == 0) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('没有记录！'),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    '确定',
                    style: TextStyle(fontSize: ScreenUtil().setSp(28.0)),
                  ),
                ),
              ],
            );
          },
        );
      } else {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => HandbookShowList(procedurelist)));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('手册程序电子化管理系统'),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: ScreenUtil().setHeight(110),
                width: ScreenUtil().setWidth(750),
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  '工作程序',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: ScreenUtil().setSp(50),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              _searchBoxs(),
              Container(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(left: 75, top: 20),
                      alignment: Alignment.center,
                      child: FlatButton(
                        color: Colors.blueGrey,
                        highlightColor: Colors.blueGrey[700],
                        colorBrightness: Brightness.dark,
                        splashColor: Colors.grey,
                        child: Text("搜索"),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        onPressed: (/** continue...*/) {
                          search();
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 45, top: 20),
                      alignment: Alignment.center,
                      child: FlatButton(
                        color: Colors.blueGrey,
                        highlightColor: Colors.blueGrey[700],
                        colorBrightness: Brightness.dark,
                        splashColor: Colors.grey,
                        child: Text("重置"),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        onPressed: (/** continue...*/) {
                          Navigator.pop(context);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HandBookSearch()));
                          /** continue...*/
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(left: 30),
                          alignment: Alignment.center,
                          child: FlatButton(
                            color: Colors.blueGrey,
                            highlightColor: Colors.blueAccent[400],
                            colorBrightness: Brightness.dark,
                            splashColor: Colors.grey,
                            child: Text("查看所有程序的流程步骤"),
                            onPressed: (/** continue...*/) {
                              /** continue...*/
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => AllProcessView()));
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          alignment: Alignment.center,
                          child: FlatButton(
                            color: Colors.blueGrey,
                            highlightColor: Colors.blueAccent[400],
                            colorBrightness: Brightness.dark,
                            splashColor: Colors.grey,
                            child: Text("导出EXCEL"),
                            onPressed: (/** continue...*/) {
                              /** continue...*/
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchBoxs() {
    return Container(
      child: Form(
        key: searchKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 35),
              child: Text(
                '按程序编号查询：',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: ScreenUtil().setSp(30),
                ),
              ),
            ),
            Container(
              height: ScreenUtil().setHeight(95),
              width: ScreenUtil().setWidth(460),
              child: TextFormField(
                autofocus: false,
                style: TextStyle(color: Colors.black54, fontSize: 16.0),
                decoration: InputDecoration(),
                obscureText: false,
                onSaved: (value) {
                  searchByNum = value;
                  find_by_procedureNumber = 'find_by_procedureNumber';
                },
                validator: (value) {
                  return null;
                },
                onFieldSubmitted: (value) {},
                /** continue...*/
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 15),
              child: Text(
                '按程序名称查询：',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: ScreenUtil().setSp(30),
                ),
              ),
            ),
            Container(
              height: ScreenUtil().setHeight(95),
              width: ScreenUtil().setWidth(460),
              child: TextFormField(
                autofocus: false,
                style: TextStyle(color: Colors.black54, fontSize: 16.0),
                decoration: InputDecoration(),
                obscureText: false,
                onSaved: (value) {
                  searchByName = value;
                  find_by_procedureName = 'find_by_procedureName';
                },
                validator: (value) {
                  return null;
                  /** continue...*/
                },
                onFieldSubmitted: (value) {},
                /** continue...*/
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 15),
              child: Text(
                '按修订标识查询：',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: ScreenUtil().setSp(30),
                ),
              ),
            ),
            Container(
              height: ScreenUtil().setHeight(95),
              width: ScreenUtil().setWidth(460),
              child: TextFormField(
                autofocus: false,
                style: TextStyle(color: Colors.black54, fontSize: 16.0),
                decoration: InputDecoration(),
                obscureText: false,
                onSaved: (value) {
                  searchByFixingMark = value;
                  find_by_revision_mark = 'find_by_revision_mark';
                },
                validator: (value) {
                  return null;
                  /** continue...*/
                },
                onFieldSubmitted: (value) {},
                /** continue...*/
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 15),
              child: Text(
                '按责任部门查询：',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: ScreenUtil().setSp(30),
                ),
              ),
            ),
            Container(
              height: ScreenUtil().setHeight(95),
              width: ScreenUtil().setWidth(460),
              child: TextFormField(
                autofocus: false,
                style: TextStyle(color: Colors.black54, fontSize: 16.0),
                decoration: InputDecoration(),
                obscureText: false,
                onSaved: (value) {
                  searchByDepartment = value;
                  find_by_department = 'find_by_department';
                },
                validator: (value) {
                  return null;
                  /** continue...*/
                },
                onFieldSubmitted: (value) {},
                /** continue...*/
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 15),
              child: Text(
                '按责任岗位查询：',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: ScreenUtil().setSp(30),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 5),
              child: Text(
                '(多个查询可用“-”间隔)',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: ScreenUtil().setSp(30),
                ),
              ),
            ),
            Container(
              height: ScreenUtil().setHeight(95),
              width: ScreenUtil().setWidth(460),
              child: TextFormField(
                autofocus: false,
                style: TextStyle(color: Colors.black54, fontSize: 16.0),
                decoration: InputDecoration(),
                obscureText: false,
                onSaved: (value) {
                  searchByPosition = value;
                  find_by_position = 'find_by_position';
                },
                validator: (value) {
                  return null;
                  /** continue...*/
                },
                onFieldSubmitted: (value) {},
                /** continue...*/
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 15),
              child: Text(
                '按工作名称查询：',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: ScreenUtil().setSp(30),
                ),
              ),
            ),
            Container(
              height: ScreenUtil().setHeight(95),
              width: ScreenUtil().setWidth(460),
              child: TextFormField(
                autofocus: false,
                style: TextStyle(color: Colors.black54, fontSize: 16.0),
                decoration: InputDecoration(),
                obscureText: false,
                onSaved: (value) {
                  searchByJob = value;
                  find_by_work_name = 'find_by_work_name';
                },
                validator: (value) {
                  return null;
                  /** continue...*/
                },
                onFieldSubmitted: (value) {},
                /** continue...*/
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 15),
              child: Text(
                '按责任人查询：',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: ScreenUtil().setSp(30),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 5),
              child: Text(
                '(全部相关程序查询需输入“人名-部门名称”)',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: ScreenUtil().setSp(30),
                ),
              ),
            ),
            Container(
              height: ScreenUtil().setHeight(95),
              width: ScreenUtil().setWidth(460),
              child: TextFormField(
                autofocus: false,
                style: TextStyle(color: Colors.black54, fontSize: 16.0),
                decoration: InputDecoration(),
                obscureText: false,
                onSaved: (value) {
                  searchByResponsable = value;
                  find_by_person = 'find_by_person';
                },
                validator: (value) {
                  return null;
                  /** continue...*/
                },
                onFieldSubmitted: (value) {},
                /** continue...*/
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 15),
              child: Text(
                '按任意关键词查询：',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: ScreenUtil().setSp(30),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 5),
              child: Text(
                '(多个查询可用“-”间隔)',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: ScreenUtil().setSp(30),
                ),
              ),
            ),
            Container(
              height: ScreenUtil().setHeight(95),
              width: ScreenUtil().setWidth(460),
              child: TextFormField(
                autofocus: false,
                style: TextStyle(color: Colors.black54, fontSize: 16.0),
                decoration: InputDecoration(),
                obscureText: false,
                onSaved: (value) {
                  searchByKeyWord = value;
                  find_by_all = 'find_by_all';
                },
                validator: (value) {
                  return null;
                  /** continue...*/
                },
                onFieldSubmitted: (value) {},
                /** continue...*/
              ),
            ),
          ],
        ),
      ),
    );
  }
}
