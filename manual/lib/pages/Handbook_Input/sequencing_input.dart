import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:manual/model/sequencingInputModel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manual/pages/Handbook_Input/SequencingInput/search_sequencyresult.dart';
import 'package:manual/provide/sequencingInputModelProvide.dart';
import 'package:provide/provide.dart';

import 'SequencingInput/add_sequence.dart';
import 'SequencingInput/sequencingInputItem.dart';

SequencingInputModel list;
String handbookName = '1';
String sequencingName = '2';
String fileName = '3';
String url_1 = 'http://47.93.54.102:5000/handbookInput/procedure'; //引入手册查看程序URL
String url_2 =
    'http://47.93.54.102:5000/handbookInput/procedure/find?keyWord'; //引入查看程序接口
//引入查看程序后台接口
Future getsequencingInputlist() async {
  try {
    Dio dio = Dio();
    Response response = await dio.get(url_1,
        options: Options(responseType: ResponseType.plain));
    return response.data;
  } catch (e) {
    print(e);
  }
}

//引入查找程序接口
Future searchsequencingInputlist(String searchText) async {
  try {
    Dio dio = Dio();
    Response response = await dio.get(
        "http://47.93.54.102:5000/handbookInput/procedure/find?keyWord=$searchText",
        options: Options(responseType: ResponseType.plain));
    return response.data;
  } catch (e) {
    print(e);
  }
}

class SequencingInput extends StatefulWidget {
  @override
  _SequencingInputState createState() => _SequencingInputState();
}

class _SequencingInputState extends State<SequencingInput> {
  GlobalKey<FormState> searchKey = GlobalKey<FormState>();
  SequencingInputModel list1;
  String searchText = '';
  void search() {
    var searchForm = searchKey.currentState;
    if (searchForm.validate()) {
      searchForm.save();
      print(searchText);
      searchsequencingInputlist(searchText).then((val) {
        var data = json.decode(val.toString());
        SequencingInputModel sequencinginputlist =
            SequencingInputModel.fromJson(data);
        setState(() {
          list1 = sequencinginputlist;
        });
        if (list1.procedureList.length == 0) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                    '当前没有您要查询的结果',
                    style: TextStyle(fontSize: ScreenUtil().setSp(36.0)),
                  ),
                  actions: <Widget>[
                    FlatButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        '确定',
                        style: TextStyle(fontSize: ScreenUtil().setSp(25.0)),
                      ),
                    ),
                  ],
                );
              });
        } else {
         for(int i=0;i<list1.procedureList.length;i++){
           print('>>>>>>>'+list1.procedureList[i]);
         }
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      SequencyingSearch(list1.procedureList)));
        }
      });
    }
  }

  @override
  void initState() {
    getsequencingInputlist().then((val) {
      var data = json.decode(val.toString());
      SequencingInputModel sequencinginputlist =
          SequencingInputModel.fromJson(data);
      setState(() {
        list = sequencinginputlist;
      });
      Provide.value<SequencingInputModelProvide>(context)
          .getSequencingInputList(sequencinginputlist);
    });
    print('引入查询到的程序内容' + list.procedureList.length.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('手册程序电子化管理系统'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
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
              Container(
                height: ScreenUtil().setHeight(100),
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AddNewSequence()));
                  },
                  child: Text(
                    '新建',
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: ScreenUtil().setSp(25)),
                  ),
                ),
              ),
              _searchBar(),
              _listTitle(),
              SequencingInputShow(list),
            ],
          ),
        ),
      ),
    );
  }

  Widget _searchBar() {
    return Container(
      alignment: Alignment.center,
      height: ScreenUtil().setHeight(100),
      width: ScreenUtil().setWidth(750),
      child: Row(
        children: <Widget>[
          Form(
              key: searchKey,
              child: Container(
                margin: EdgeInsets.only(right: 15.0),
                width: ScreenUtil().setWidth(400),
                child: TextFormField(
                  autofocus: false,
                  style: TextStyle(color: Colors.black38, fontSize: 18.0),
                  decoration: InputDecoration(hintText: '模糊搜索'),
                  textAlign: TextAlign.center,
                  obscureText: false,
                  onSaved: (value) {
                    searchText = value;
                  },
                  validator: (value) {
                   if (value.length == 0) {
                      return "不允许为空";
                    } else {
                      return null;
                    }
                  },
                  onFieldSubmitted: (value) {},
                  /** continue...*/
                ),
              )),
          FlatButton(
            color: Colors.blueGrey,
            highlightColor: Colors.blueGrey[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("搜索"),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            onPressed: (/** continue...*/) {
              search();
              /** continue...*/
            },
          ),
        ],
      ),
    );
  }

  Widget _listTitle() {
    return Container(
      margin: EdgeInsets.only(top: 5),
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(120),
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(width: 1, color: Colors.black12),
      )),
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(250),
            height: ScreenUtil().setHeight(120),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(3),
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
            width: ScreenUtil().setWidth(150),
            height: ScreenUtil().setHeight(120),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(3),
            child: Text(
              '程序',
              style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(28),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(130),
            height: ScreenUtil().setHeight(120),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(3),
            child: Text(
              '文件操作',
              style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(28),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//程序显示目录
class SequencingInputShow extends StatelessWidget {
  SequencingInputShow(list);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            height: ScreenUtil().setHeight(900),
            padding: EdgeInsets.all(1.0),
            child: Container(
              child: ListView.builder(
                itemCount: list.procedureList.length,
                itemBuilder: (context, index) {
                  print(list.procedureList[index]);
                  return SequencingInputItem(
                      context, list.procedureList[index]);
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
