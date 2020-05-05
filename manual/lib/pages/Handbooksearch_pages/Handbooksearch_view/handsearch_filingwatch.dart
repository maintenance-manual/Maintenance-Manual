import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

/**
 * 存档信息查看
 */
class HandSearhFilingWatch extends StatefulWidget {
  HandSearhFilingWatch({Key key}) : super(key: key);

  _HandSearhFilingWatchState createState() => _HandSearhFilingWatchState();
}

class _HandSearhFilingWatchState extends State<HandSearhFilingWatch> {
  Widget build(BuildContext context) {
   return Scaffold(
      appBar: AppBar(title: Text('存档信息查看')),
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
          Text('《手册/程序意见反馈单》由航空安全质量分部负责至少保存2年。',textAlign: TextAlign.center),
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