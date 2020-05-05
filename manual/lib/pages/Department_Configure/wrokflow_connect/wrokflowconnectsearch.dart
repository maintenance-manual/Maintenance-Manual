import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/**
 * 流程工作对接手册查看
 */
class WrokFlowConnectSearch extends StatefulWidget {
  @override
  _WrokFlowConnectSearchState createState() => _WrokFlowConnectSearchState();
}

class _WrokFlowConnectSearchState extends State<WrokFlowConnectSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('流程工作查看')),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Table(
              columnWidths: const <int, TableColumnWidth>{
                0: FixedColumnWidth(40.0),
                1: FixedColumnWidth(50.0),
                2: FixedColumnWidth(55.0),
                3: FixedColumnWidth(125.0),
                4: FixedColumnWidth(50.0),
                5: FixedColumnWidth(50.0),
                6: FixedColumnWidth(50.0),
              },
              border: TableBorder.all(width: 1.0, style: BorderStyle.solid),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: tablerows
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
          Text('所属\n部门',textAlign: TextAlign.center,),
          Text('程序\n名称',textAlign: TextAlign.center),
          Text('修订\n标识',textAlign: TextAlign.center),
          Text('流程步骤',textAlign: TextAlign.center),
          Text('工作\n名称',textAlign: TextAlign.center),
          Text('工作规范',textAlign: TextAlign.center),
          Text('操作',textAlign: TextAlign.center),
        ],
      );
    } else {
      return TableRow(
        children: <Widget>[
          Text('航空安全质量分部',textAlign: TextAlign.start),
          Text('01-01-001   质量手册的管理程序',textAlign: TextAlign.start),
          Text('00',textAlign: TextAlign.center),
          Text('5.1.1   按照CCAR145及相关AC和分公司维修管理要求完成本单位《维修管理手册》的编写或修订',textAlign: TextAlign.center),
          Text('手册管理',textAlign: TextAlign.start),
          Text('01-01-001-QS手册上传工作规范 下载',textAlign: TextAlign.start),
          Text('修改 | 查看 | 删除',textAlign: TextAlign.start),
        ],
      );
    }
  });
}
