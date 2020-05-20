import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:manual/model/wrokflowModel/workflowmodel.dart';
import 'package:manual/pages/Handbook_Input/HandBookInput_Details/add_workbook.dart';
import 'package:manual/provide/workflowModelProvide/workflowModelProvide.dart';
import 'package:flutter/services.dart';
import 'package:provide/provide.dart';

/**
 * 流程工作修改
 */
//删除本部门特定工作流程
Future _deletewrokflow(String maunalname, String deleteprocedureNumber,
    String deleteprocessNumber) async {
  try {
    Dio dio = Dio();
    Response response = await dio.get(
        'http://47.93.54.102:5000/departmentConfigurations/process_work/delete?manualName=$maunalname&&procedureNumber=$deleteprocedureNumber&&processNumber=$deleteprocessNumber',
        options: Options(responseType: ResponseType.plain));
    print('流程工作对接删除数据：' + response.data);
    return response.data;
  } catch (e) {}
}

String deleteprocedureNumber =
    '02-11-002'; //删除参数之后有后端返回的procedureNumber和processNumber决定，目前后端尚未返回，等待数据修改;
String deleteprocessNumber = '04';
String deletewrokflow = ''; //传递整条被删除目录;

String department; //所属部门
String maunalname; //手册名称
String sequencename; //程序名称
String revision; //修订标识
String sequenceprocess; //流程步骤
String workname; //工作名称
String regulation; //工作规范

class WrokFlowDelete extends StatefulWidget {
  WrokFlowDelete(department1, maunalname1, sequencename1, revision1,
      sequenceprocess1, workname1, regulation1, deletewrokflow1) {
    department = department1;
    maunalname = maunalname1;
    sequencename = sequencename1;
    revision = revision1;
    sequenceprocess = sequenceprocess1;
    workname = workname1;
    regulation = regulation1;
    deletewrokflow = deletewrokflow1;
  }

  @override
  _WrokFlowDeleteState createState() => _WrokFlowDeleteState();
}

class _WrokFlowDeleteState extends State<WrokFlowDelete> {
  GlobalKey<FormState> searchKey = GlobalKey<FormState>();

  //添加删除逻辑
  void deleteWrokFlow(String maunalname, String deletewrokflow) {
    _deletewrokflow(maunalname, deleteprocedureNumber, deleteprocessNumber)
        .then((val) {
      var data = jsonDecode(val.toString());
      DeleteWrokFlowModel deleteWrokFlowModel =
          DeleteWrokFlowModel.fromJson(data);
      // print("数据模型" + deleteWrokFlowModel.toJson().toString());
      if (deleteWrokFlowModel.isDeletProcess.contains("true")) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('删除成功'),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    print("删除的条目" + deletewrokflow);
                    Provide.value<WorkFlowModelProvide>(context)
                        .deletewrokflowlist(deletewrokflow);
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
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('删除失败'),
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
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('删除流程工作')),
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
            RaisedButton(
                onPressed: () {
                  deleteWrokFlow(maunalname, deletewrokflow);
                },
                child: Text('删除')),
          ],
        ),
      ),
    );
  }
}
