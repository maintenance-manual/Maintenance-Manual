import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//显示目录，利用瓦片布局来显示；
class HangbookShowList extends StatelessWidget {
  const HangbookShowList({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('搜索记录结果'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                height: ScreenUtil().setHeight(110),
                width: ScreenUtil().setWidth(750),
                //color: Colors.pink,
                child: Text(
                  '查询条件：',  //状态管理显示;
                  style: TextStyle(fontSize: ScreenUtil().setSp(36.0)),
                ),
              ),
              Container(
                margin: EdgeInsets.all(3.0),
                height: ScreenUtil().setHeight(50),
                width: ScreenUtil().setWidth(750),
                child: Text(
                  '搜索到***条符合条件的记录！',   //状态管理显示;
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
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return _handbookviewshowcardItem(index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _handbookviewshowcardItem(index) {
    int i = 0;

    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(220),
            height: ScreenUtil().setHeight(80),
            //color: Colors.pink,
            padding: EdgeInsets.all(3.0),
            child: InkWell(
              onTap: () {},
              child:
                  Text('01-01-001', style: TextStyle(color: Colors.blueAccent)),  //状态管理显示;
            ),
          ),
          Container(
            width: ScreenUtil().setWidth(250),
            height: ScreenUtil().setHeight(80),
            //color: Colors.blue,
            padding: EdgeInsets.all(3.0),
            child:
                Text('01-01-001', style: TextStyle(color: Colors.blueAccent)),   //状态管理显示;
          ),
        ],
      ),
      trailing: Container(
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(190),
        height: ScreenUtil().setHeight(80),
        //color: Colors.orange,
        padding: EdgeInsets.all(3.0),
        child: Text('0${i++}', style: TextStyle(color: Colors.blueAccent)),   //状态管理显示;
      ),
    );
  }
}