import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

/**
 * 存档信息查看
 */
class FilingWatch extends StatefulWidget {
  FilingWatch({Key key}) : super(key: key);

  _FilingWatchState createState() => _FilingWatchState();
}

class _FilingWatchState extends State<FilingWatch> {
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
              margin: EdgeInsets.only(left: 15, right: 15, top: 15),
              child: Text(
                '存档信息管理',
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
              margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
              child: InkWell(
                onTap: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //     builder: (context) => AddNewWorkbook()));
                },
                child: Text(
                  '新建存档',
                  style: TextStyle(
                      color: Colors.blueGrey, fontSize: ScreenUtil().setSp(25)),
                ),
              ),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: Colors.black12))),
            ),
            _listTitle(),
            ProcessWatchExcel()
          ],
        ),
      ),
    ));
  }

  Widget _listTitle() {
    return Container(
      width: ScreenUtil().setWidth(750),
      padding: EdgeInsets.fromLTRB(10.0, 1.0, 10.0, 10.0),
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          border: Border(
        bottom: BorderSide(width: 1, color: Colors.black12),
      )),
      child: Text(
        '修订标识   存档编号   存档内容   责任部门          操作',
        style: TextStyle(
          color: Colors.black,
          fontSize: ScreenUtil().setSp(28),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class ProcessWatchExcel extends StatelessWidget {
  const ProcessWatchExcel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(990),
      width: ScreenUtil().setWidth(750),
      child: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return _listTitleWidget();
        },
      ),
    );
  }

  Widget _listTitleWidget() {
    return Container(
      height: ScreenUtil().setHeight(80),
      padding: EdgeInsets.only(left: 2.0),
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(135),
            height: ScreenUtil().setHeight(80),
            padding: EdgeInsets.only(left: 10.0),
            alignment: Alignment.centerLeft,
            child: Text('33'),
          ),
          Container(
            width: ScreenUtil().setWidth(135),
            height: ScreenUtil().setHeight(80),
            padding: EdgeInsets.only(left: 5.0),
            alignment: Alignment.center,
            child: Text('22'),
          ),
          Container(
            width: ScreenUtil().setWidth(135),
            height: ScreenUtil().setHeight(80),
            padding: EdgeInsets.only(left: 5.0),
            alignment: Alignment.center,
            child: Text('11'),
          ),
          Container(
            width: ScreenUtil().setWidth(170),
            height: ScreenUtil().setHeight(80),
            padding: EdgeInsets.only(left: 3.0),
            alignment: Alignment.center,
            child: Text('00'),
          ),
          InkWell(
            onTap: () {},
            child: Text(
              '修改 ',
              style: TextStyle(color: Colors.blueAccent),
            ),
          ),
          InkWell(
            onTap: () {},
            child: Text(
              '删除',
              style: TextStyle(color: Colors.blueAccent),
            ),
          ),
        ],
      ),
    );
  }
}
