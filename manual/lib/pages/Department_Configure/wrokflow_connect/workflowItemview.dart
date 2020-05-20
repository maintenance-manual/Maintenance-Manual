import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:manual/pages/Department_Configure/wrokflow_connect/wrokflowmodify.dart';

/**
 * 展开查看流程工作
 */
String department; //所属部门
String maunalname; //手册名称
String sequencename; //程序名称
String revision; //修订标识
String sequenceprocess; //流程步骤
String workname; //工作名称
String regulation; //工作规范

class WrokFlowItemView extends StatefulWidget {
  WrokFlowItemView(
      department1, maunalname1, sequenceprocess1, workname1, regulation1) {
    department = department1;
    maunalname = maunalname1;
    sequenceprocess = sequenceprocess1;
    workname = workname1;
    regulation = regulation1;
  }

  @override
  _WrokFlowItemViewState createState() => _WrokFlowItemViewState();
}

class _WrokFlowItemViewState extends State<WrokFlowItemView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('当前流程工作查看')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.centerLeft,
              width: ScreenUtil().setWidth(776),
              height: ScreenUtil().setHeight(120),
              decoration:
                  BoxDecoration(border: Border(bottom: BorderSide(width: 2.0))),
              child: Text('所属部门：' + department,
                  style: TextStyle(fontSize: ScreenUtil().setSp(30.0))),
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: ScreenUtil().setWidth(776),
              height: ScreenUtil().setHeight(120),
              decoration:
                  BoxDecoration(border: Border(bottom: BorderSide(width: 2.0))),
              child: Text('手册名称：' + maunalname,
                  style: TextStyle(fontSize: ScreenUtil().setSp(30.0))),
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: ScreenUtil().setWidth(776),
              height: ScreenUtil().setHeight(200),
              decoration:
                  BoxDecoration(border: Border(bottom: BorderSide(width: 2.0))),
              child: Text('流程名称：' + sequenceprocess,
                  style: TextStyle(fontSize: ScreenUtil().setSp(30.0))),
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: ScreenUtil().setWidth(776),
              height: ScreenUtil().setHeight(150),
              decoration:
                  BoxDecoration(border: Border(bottom: BorderSide(width: 2.0))),
              child: Text('工作名称：' + workname,
                  style: TextStyle(fontSize: ScreenUtil().setSp(30.0))),
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: ScreenUtil().setWidth(776),
              height: ScreenUtil().setHeight(150),
              decoration:
                  BoxDecoration(border: Border(bottom: BorderSide(width: 2.0))),
              child: Text('工作规范：' + regulation,
                  style: TextStyle(fontSize: ScreenUtil().setSp(30.0))),
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: ScreenUtil().setWidth(776),
              height: ScreenUtil().setHeight(120),
              decoration:
                  BoxDecoration(border: Border(bottom: BorderSide(width: 2.0))),
              child: Text('创建时间：',
                  style: TextStyle(fontSize: ScreenUtil().setSp(30.0))),
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: ScreenUtil().setWidth(776),
              height: ScreenUtil().setHeight(120),
              decoration:
                  BoxDecoration(border: Border(bottom: BorderSide(width: 2.0))),
              child: Text('修改时间：',
                  style: TextStyle(fontSize: ScreenUtil().setSp(30.0))),
            ),
            // RaisedButton(
            //     onPressed: () {
            //       Navigator.of(context).push(MaterialPageRoute(
            //           builder: (context) => WrokFlowModify(department,
            //               maunalname, sequencename, workname, regulation)));
            //     },
            //     child: Text('修改')),
          ],
        ),
      ),
    );
  }
}
