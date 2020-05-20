import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:manual/model/wrokflowModel/workflowmodel.dart';
import 'package:manual/pages/Department_Configure/wrokflow_connect/wrokflowmodify.dart';
import 'package:manual/pages/Handbook_Input/HandBookInput_Details/add_workbook.dart';
import 'package:manual/pages/Handbook_Input/handbook_input.dart';
import 'package:manual/provide/workflowModelProvide/workflowModelProvide.dart';
import 'package:provide/provide.dart';
import 'workflowItemview.dart';
import 'wrokflowdelete.dart';

/**
 * 流程工作对接手册查看
 */
List wrokflow_list = [];
String inputparameter = '';
BuildContext context1;

class WrokFlowConnectSearch extends StatefulWidget {
  WrokFlowConnectSearch(context, wrokflowlist, inputparameter1) {
    inputparameter = inputparameter1;
    // wrokflow_list =
    //     Provide.value<WorkFlowModelProvide>(context).wrokflowModel.workList;
    print("接收" + wrokflow_list.toString());
  }
  @override
  _WrokFlowConnectSearchState createState() => _WrokFlowConnectSearchState();
}

class _WrokFlowConnectSearchState extends State<WrokFlowConnectSearch> {
  List<TableRow> tablerows;
  @override
  Widget build(BuildContext context) {
    context1 = this.context;
    setState(() {
      wrokflow_list =
          Provide.value<WorkFlowModelProvide>(context).wrokflowModel.workList;
      tablerows = List.generate(wrokflow_list.length, (index) {
        print("构造：" + wrokflow_list[index].toString());
        String department =
            wrokflow_list[index].toString().split('--')[0]; //所属部门
        String maunalname =
            wrokflow_list[index].toString().split('--')[1]; //手册名称
        String sequencename =
            wrokflow_list[index].toString().split('--')[2]; //程序名称
        String revision = wrokflow_list[index].toString().split('--')[3]; //修订标识
        String sequenceprocess =
            wrokflow_list[index].toString().split('--')[4]; //流程步骤
        String workname = wrokflow_list[index].toString().split('--')[5]; //工作名称
        String regulation =
            wrokflow_list[index].toString().split('--')[6]; //工作规范

        return TableRow(
          children: <Widget>[
            Text(department, textAlign: TextAlign.center),
            Text(maunalname, textAlign: TextAlign.center),
            Text(sequencename, textAlign: TextAlign.center),
            Text(revision, textAlign: TextAlign.center),
            Text(sequenceprocess, textAlign: TextAlign.center),
            Text(workname, textAlign: TextAlign.center),
            Text(regulation, textAlign: TextAlign.center),
            Container(
              child: Column(
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.of(context1).push(MaterialPageRoute(
                          builder: (context1) => WrokFlowModify(
                              department,
                              maunalname,
                              sequencename,
                              revision,
                              sequenceprocess,
                              workname,
                              regulation)));
                    },
                    child: Text('修改',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.blue)),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context1).push(MaterialPageRoute(
                          builder: (context1) => WrokFlowItemView(department,
                              maunalname, sequencename, workname, regulation)));
                    },
                    child: Text('查看',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.blue)),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context1).push(MaterialPageRoute(
                          builder: (context1) => WrokFlowDelete(
                              department,
                              maunalname,
                              sequencename,
                              revision,
                              sequenceprocess,
                              workname,
                              regulation,wrokflow_list[index])));
                    },
                    child: Text('删除',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
            ),
          ],
        );
      });
    });
    return Scaffold(
      appBar: AppBar(title: Text('流程工作查看')),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Table(
              textBaseline: TextBaseline.ideographic,
              columnWidths: const <int, TableColumnWidth>{
                0: FixedColumnWidth(40.0),
                1: FixedColumnWidth(80.0),
                2: FixedColumnWidth(150.0),
                3: FixedColumnWidth(40.0),
                4: FixedColumnWidth(150.0),
                5: FixedColumnWidth(50.0),
                6: FixedColumnWidth(120.0),
                7: FixedColumnWidth(40.0),
              },
              border: TableBorder.all(width: 1.0, style: BorderStyle.solid),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: tablerow + tablerows,
            ),
          ),
        ],
      )),
    );
  }

  List<TableRow> tablerow = List.generate(1, (index) {
    if (index == 0) {
      return TableRow(
        children: <Widget>[
          Text('所属\n部门', textAlign: TextAlign.center),
          Text('手册\n名称', textAlign: TextAlign.center),
          Text('程序\n名称', textAlign: TextAlign.center),
          Text('修订\n标识', textAlign: TextAlign.center),
          Text('流程步骤', textAlign: TextAlign.center),
          Text('工作\n名称', textAlign: TextAlign.center),
          Text('工作规范', textAlign: TextAlign.center),
          Text('操作', textAlign: TextAlign.center),
        ],
      );
    }
  });
}
