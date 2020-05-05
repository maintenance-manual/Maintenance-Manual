import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
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

class HandSearchProcessWatch extends StatefulWidget {
  HandSearchProcessWatch(handbook_name, procedure_Number) {
    handbookname = handbook_name;
    procedureNumber = procedure_Number;
  }

  _HandSearchProcessWatchState createState() => _HandSearchProcessWatchState();
}

class _HandSearchProcessWatchState extends State<HandSearchProcessWatch> {
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
              children: tablerows,
              // TableRow(
              //   children: <Widget>[
              //     Text('航空安全质量分部'),
              //     Text('01-01-001   质量手册的管理程序'),
              //     Text('00'),
              //     Text('5.1.1   按照CCAR145及相关AC和分公司维修管理要求完成本单位《维修管理手册》的编写或修订'),
              //     Text('手册管理'),
              //     Text('01-01-001-QS手册上传工作规范 下载'),
              //     Text('修改 | 查看 | 删除'),
              //   ],
              // ),
              ),
        ],
      )),
    );
  }

  List<TableRow> tablerows = List.generate(20, (index) {
    if (index == 0) {
      return TableRow(
        children: <Widget>[
          Text('修订\n标识',textAlign: TextAlign.center,style:TextStyle(fontWeight:  FontWeight.w600)),
          Text('步骤\n编号',textAlign: TextAlign.center,style:TextStyle(fontWeight:  FontWeight.w600)),
          Text('程序流程',textAlign: TextAlign.center,style:TextStyle(fontWeight:  FontWeight.w600)),
          Text('责任\n部门',textAlign: TextAlign.center,style:TextStyle(fontWeight:  FontWeight.w600)),
          Text('工作\n名称',textAlign: TextAlign.center,style:TextStyle(fontWeight:  FontWeight.w600)),
          Text('岗位\n名称',textAlign: TextAlign.center,style:TextStyle(fontWeight:  FontWeight.w600)),
          Text('工作\n规范',textAlign: TextAlign.center,style:TextStyle(fontWeight:  FontWeight.w600)),
          Text('人员\n姓名',textAlign: TextAlign.center,style:TextStyle(fontWeight:  FontWeight.w600)),
        ],
      );
    } else {
      return TableRow(
        children: <Widget>[
          Text('00',textAlign: TextAlign.start),
          Text('5.1.1',textAlign: TextAlign.start),
          Text('《维修管理手册》编写或修订稿报本单位责任经理审批后，以表格《维修管理手册(xx)版审批单》Form No.:QM-088的形式将《维修管理手册》编写或修订稿报航空安全与质量管理部审批。',textAlign: TextAlign.center),
          Text('航空安全质量分部',textAlign: TextAlign.center),
          Text('手册管理',textAlign: TextAlign.center),
          Text('安全管理高级工程师,质量监督工程师',textAlign: TextAlign.start),
          Text('01-01-001-QS手册上传工作规范下载',textAlign: TextAlign.start),
          Text('武丽敏,张海凤',textAlign: TextAlign.center),
        ],
      );
    }
  });
}


