import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:manual/model/procedureList_model.dart';
import 'package:manual/model/processInputModel/addprocess_model.dart.dart';
import 'package:manual/pages/Handbook_Input/SequencingInput/Handbooksearch_view/modifyprocess.dart';
import 'package:manual/provide/processModelProvide/processmodelProvide.dart';
import 'package:provide/provide.dart';

/**
 * 程序流程查看
 * 该页面手册名称无法确定，暂时以维修管理手册工作程序为值进行操作
 */

String handbookname; //手册名称
String procedureNumber; //程序编号
int count = 0;
List<String> revision = [];
List<String> stepNumber = [];
List<String> step = [];
List<String> department = [];
List<String> work = [];
List<String> position = [];
List<String> regulation = [];
List<String> people = [];

Future getProcedure(handbookName, procedureNum) async {
  try {
    Dio dio = Dio();
    Response response = await dio.get(
      "http://47.93.54.102:5000/findHandbook/procedureDetails/5.procedures?manualName=$handbookName&procedureNumber=$procedureNum",
      options: Options(responseType: ResponseType.plain),
    );
    return response.data;
  } catch (e) {}
}

class HandSearchProcessWatch extends StatefulWidget {
  HandSearchProcessWatch(handbook_name, procedure_Number) {
    handbookname = handbook_name;
    procedureNumber = procedure_Number;
  }

  _HandSearchProcessWatchState createState() => _HandSearchProcessWatchState();
}

class _HandSearchProcessWatchState extends State<HandSearchProcessWatch> {
  getInfo() {
    getProcedure(handbookname, procedureNumber).then((value) {
      var data = json.decode(value.toString());
      ProcedureListModel procedureListModel = ProcedureListModel.fromJson(data);
      count = procedureListModel.procedureList.length;
      for (var i = 0; i < count; i++) {
        List<String> tmp = procedureListModel.procedureList[i].split("--");
        revision.add(tmp[0]);
        stepNumber.add(tmp[1]);
        step.add(tmp[2]);
        department.add(tmp[3]);
        work.add(tmp[4]);
        position.add(tmp[5]);
        regulation.add(tmp[6]);
        people.add(tmp[7]);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    count = 0;
    revision = [];
    stepNumber = [];
    step = [];
    department = [];
    work = [];
    position = [];
    regulation = [];
    people = [];
    getInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('程序流程查看')),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Table(
            columnWidths: const <int, TableColumnWidth>{
              0: FixedColumnWidth(20.0),
              1: FixedColumnWidth(35.0),
              2: FixedColumnWidth(160.0),
              3: FixedColumnWidth(40.0),
              4: FixedColumnWidth(25.0),
              5: FixedColumnWidth(40.0),
              6: FixedColumnWidth(55.0),
              7: FixedColumnWidth(40.0),
            },
            border: TableBorder.all(width: 1.0, style: BorderStyle.solid),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: tablerow + tablerows,
          ),
        ],
      )),
    );
  }

  List<TableRow> tablerow = List.generate(1, (index) {
    return TableRow(
      children: <Widget>[
        Text('修订\n标识',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w600)),
        Text('步骤\n编号',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w600)),
        Text('程序流程',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w600)),
        Text('责任\n部门',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w600)),
        Text('工作\n名称',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w600)),
        Text('岗位\n名称',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w600)),
        Text('工作\n规范',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w600)),
        Text('人员\n姓名',
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w600)),
      ],
    );
  });
  List<TableRow> tablerows = List.generate(count, (index) {
    return TableRow(
      children: <Widget>[
        Text(revision[index], textAlign: TextAlign.start),
        Text(stepNumber[index], textAlign: TextAlign.start),
        Text(step[index], textAlign: TextAlign.center),
        Text(department[index], textAlign: TextAlign.center),
        Text(work[index], textAlign: TextAlign.center),
        Text(position[index], textAlign: TextAlign.start),
        Text(regulation[index], textAlign: TextAlign.start),
        Text(people[index], textAlign: TextAlign.center),
      ],
    );
  });
}
