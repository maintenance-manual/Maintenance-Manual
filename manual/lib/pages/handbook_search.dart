import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:manual/service/service_method.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HandBookSearch extends StatefulWidget {
  @override
  _HandBookSearchState createState() => _HandBookSearchState();
}

class _HandBookSearchState extends State<HandBookSearch> {
  GlobalKey<FormState> searchKey = GlobalKey<FormState>();
  String searchByNum = '';
  String searchByName = '';
  String searchByFixingMark = '';
  String searchByDepartment = '';
  String searchByPosition = '';
  String searchByJob = '';
  String searchByResponsable = '';
  String searchByKeyWord = '';
  void search() {
    var searchForm = searchKey.currentState;
    if (searchForm.validate()) {
      searchForm.save();
      print(searchByNum +
          '  ' +
          searchByName +
          '  ' +
          searchByFixingMark +
          '  ' +
          searchByDepartment +
          '  ' +
          searchByPosition +
          '  ' +
          searchByJob +
          '  ' +
          searchByResponsable +
          '  ' +
          searchByKeyWord);
    }
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
                      margin: EdgeInsets.all(40),
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
                          /** continue...*/
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(40),
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
                },
                validator: (value) {
                  if (value.length == 0) {
                    return "此处不能为空";
                  } else {
                    return null;
                  }
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
                },
                validator: (value) {
                  if (value.length == 0) {
                    return "此处不能为空";
                  } else {
                    return null;
                  }
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
                },
                validator: (value) {
                  if (value.length == 0) {
                    return "此处不能为空";
                  } else {
                    return null;
                  }
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
                },
                validator: (value) {
                  if (value.length == 0) {
                    return "此处不能为空";
                  } else {
                    return null;
                  }
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
                },
                validator: (value) {
                  if (value.length == 0) {
                    return "此处不能为空";
                  } else {
                    return null;
                  }
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
                },
                validator: (value) {
                  if (value.length == 0) {
                    return "此处不能为空";
                  } else {
                    return null;
                  }
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
                },
                validator: (value) {
                  if (value.length == 0) {
                    return "此处不能为空";
                  } else {
                    return null;
                  }
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
                },
                validator: (value) {
                  if (value.length == 0) {
                    return "此处不能为空";
                  } else {
                    return null;
                  }
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
