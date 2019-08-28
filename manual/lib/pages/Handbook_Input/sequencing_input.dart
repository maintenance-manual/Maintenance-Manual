import 'package:flutter/material.dart';
import 'package:manual/pages/Handbook_Input/add_sequence.dart';
import 'package:manual/service/service_method.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';

class SequencingInput extends StatefulWidget {
  @override
  _SequencingInputState createState() => _SequencingInputState();
}

class _SequencingInputState extends State<SequencingInput> {
  GlobalKey<FormState> searchKey = GlobalKey<FormState>();
  String searchText = '';
  void search() {
    var searchForm = searchKey.currentState;
    if (searchForm.validate()) {
      searchForm.save();
      print(searchText);
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
                      color: Colors.blueGrey, fontSize: ScreenUtil().setSp(25)),
                ),
              ),
            ),
            _searchBar(),
            _listTitle(),
          ],
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
                width: ScreenUtil().setWidth(500),
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
                    return null;
                    /** continue...*/
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
              '程序',
              style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(28),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(180),
            height: ScreenUtil().setHeight(120),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10),
            child: Text(
              '文件链接',
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
