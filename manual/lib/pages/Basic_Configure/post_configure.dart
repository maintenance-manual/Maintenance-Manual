import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './addPostConfig.dart'; //引入新增岗位页面;

class PostConfigure extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
            appBar: AppBar(
              title: Text('岗位配置'),
            ),
            body: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(width: 1.0, color: Colors.black54))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                       Text(
                '所属部门',
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.black,fontSize: ScreenUtil().setSp(35.0)),
                ),
                Container(
                  width: ScreenUtil().setWidth(180),
                ),
                 Text(
                '岗位名称',
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.black,fontSize: ScreenUtil().setSp(35.0)),
                ),
                    ],
                  ),
                ),
                PostConfigShow(),
              ],
            ),
            floatingActionButton: new Builder(builder: (BuildContext context) {
              //悬浮按钮用来新建;
              return FloatingActionButton(
                child: Icon(Icons.add),
                backgroundColor: Colors.grey,
                foregroundColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AddPostConfig()));
                },
                mini: false,
                shape: CircleBorder(),
                isExtended: false,
              );
            }),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endDocked));
  }
}
//岗位配置显示目录；
class PostConfigShow extends StatelessWidget {

  List<String> departmentConfigName = [
  '质量检测部门',
  '航空情报部门',
  '空中管制部门',
  '地勤打扫部门',
];

  @override
  Widget build(BuildContext context) {
    return Column(
     children: <Widget>[
       Container(
        height: ScreenUtil().setHeight(940),
        padding: EdgeInsets.all(1.0),
        child: ListView.builder(
          itemCount: departmentConfigName.length,
          itemBuilder: (context, index) {
            return _cardList(index);
          },
        ),
      ),
     ],
    );
  }

  //部门名称目录;
  Widget _cardList(index)  {
     return Container(
      margin: EdgeInsets.only(top: 1.0),
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1.0, color: Colors.black38))),
      child: ListTile(
        contentPadding: EdgeInsets.only(left:6.0),
        title:Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
          '${departmentConfigName[index]}',
          style: TextStyle(
            fontSize: 15.0,
          ),
        ),
        Container(
          width: ScreenUtil().setWidth(140),
        ),
        Text(
          '${departmentConfigName[index]}',
          style: TextStyle(
            fontSize: 15.0,
          ),
        ),
          ],
        ), 
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.delete),
          iconSize: 25.0,
        ),
      ),
    );
  }
}

