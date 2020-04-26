import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:manual/model/processInputModel/addprocess_model.dart.dart';
import 'package:manual/pages/Handbook_Input/SequencingInput/Handbooksearch_view/modifyprocess.dart';
import 'package:manual/provide/processModelProvide/processmodelProvide.dart';
import 'package:provide/provide.dart';

import 'addprocess.dart';

/**
 * 程序流程查看
 * 该页面手册名称无法确定，暂时以维修管理手册工作程序为值进行操作
 */
//查询特定手册文件的程序流程
Future _getprocess() async {
  try {
    Dio dio = Dio();
    Response response = await dio.get(
        'http://47.93.54.102:5000/handbookInput/procedure/steps?manualName=维修管理手册工作程序&procedureNumber=02-11-002',
        options: Options(responseType: ResponseType.plain));
    return response.data;
  } catch (e) {}
}

//引入删除程序流程步骤数据接口
Future _deleteprocess(stepNumber) async {
  try {
    Dio dio = Dio();
    Response response = await dio.get(
        'http://47.93.54.102:5000/handbookInput/procedure/steps/delete?manualName=维修管理手册工作程序&procedureNumber=$procedureNumber&stepNumber=$stepNumber',
        options: Options(responseType: ResponseType.plain));
    return response.data;
  } catch (e) {}
}

String handbookname; //手册名称
String procedureNumber; //程序编号

class ProcessWatch extends StatefulWidget {
  ProcessWatch(handbook_name, procedure_Number) {
    handbookname = handbook_name;
    procedureNumber = procedure_Number;
  }

  _ProcessWatchState createState() => _ProcessWatchState();
}

class _ProcessWatchState extends State<ProcessWatch> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getprocess().then((val) {
      var data = json.decode(val.toString());
      ProcessWatchModel processWatchModel = ProcessWatchModel.fromJson(data);
      Provide.value<ProcessWatchModelProvider>(context)
          .getprocessList(processWatchModel);
    });
  }

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
                '程序流程管理',
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
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          AddProcessStep(handbookname, procedureNumber)));
                },
                child: Text(
                  '新建程序流程步骤',
                  style: TextStyle(
                      color: Colors.blueGrey, fontSize: ScreenUtil().setSp(25)),
                ),
              ),
              decoration: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 1, color: Colors.black12))),
            ),
            _listTitle(),
            ProcessWatchExcel(context)
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
        '修订标识   步骤编号   程序流程   责任部门             操作',
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
  const ProcessWatchExcel(context);

  void deleteProcess(context, stepNumber) {
    _deleteprocess(stepNumber).then((val) {
      var data = json.decode(val.toString());
      DeleteProcessModel processWatchModel = DeleteProcessModel.fromJson(data);
      if (processWatchModel.isDeleteStep.contains("true")) {
        String steplistitem = processWatchModel.stepNumber +
            '--' +
            processWatchModel.step +
            '--' +
            processWatchModel.department +
            '--' +
            processWatchModel.revision;
        Provide.value<ProcessWatchModelProvider>(context)
            .deleteProcess(steplistitem);
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('删除成功'),
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
    return Container(
      height: ScreenUtil().setHeight(990),
      width: ScreenUtil().setWidth(750),
      child: Provide<ProcessWatchModelProvider>(
        builder: (context, child, processWatchModelProvider) {
          return ListView.builder(
            itemCount:
                processWatchModelProvider.processWatchModel.stepList.length,
            itemBuilder: (context, index) {
              print(
                  processWatchModelProvider.processWatchModel.stepList[index]);
              return _listTitleWidget(context,
                  processWatchModelProvider.processWatchModel.stepList[index]);
            },
          );
        },
      ),
    );
  }

  Widget _listTitleWidget(context, steplist) {
    List<String> listItem = steplist.toString().split('--');
    print(listItem);
    return Container(
      height: ScreenUtil().setHeight(80),
      padding: EdgeInsets.only(left: 2.0),
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(100),
            height: ScreenUtil().setHeight(80),
            padding: EdgeInsets.only(left: 10.0),
            alignment: Alignment.centerLeft,
            child: Text(listItem[3]),
          ),
          Container(
            width: ScreenUtil().setWidth(135),
            height: ScreenUtil().setHeight(80),
            padding: EdgeInsets.only(left: 5.0),
            alignment: Alignment.center,
            child: Text(listItem[0]),
          ),
          Container(
            width: ScreenUtil().setWidth(150),
            height: ScreenUtil().setHeight(80),
            padding: EdgeInsets.only(left: 5.0),
            alignment: Alignment.center,
            child: Text(listItem[1]),
          ),
          Container(
            width: ScreenUtil().setWidth(210),
            height: ScreenUtil().setHeight(80),
            padding: EdgeInsets.only(left: 3.0),
            alignment: Alignment.center,
            child: Text(listItem[2]),
          ),
          InkWell(
            onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          ModifyProcess(handbookname, procedureNumber,steplist)));
            },
            child: Text(
              '修改 ',
              style: TextStyle(color: Colors.blueAccent),
            ),
          ),
          InkWell(
            onTap: () {
              /**
              * listItem[0]:步骤编号；
              * procedureNumber程序编号;
              * handbookname:手册名称(暂时选择固定值)
              */
              deleteProcess(context, listItem[0]);
            },
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
