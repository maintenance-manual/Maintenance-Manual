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
//修改流程工作对接
Future _modifywrokflow(String modifyregulation) async {
  try {
    Dio dio = Dio();
    Response response = await dio.get(
        'http://47.93.54.102:5000/departmentConfigurations/process_work/modify?username=王哲&&manualName=$maunalname&&procedureNumber=02-11-002&&processNumber=04&&regulation=$modifyregulation',
        options: Options(responseType: ResponseType.plain));
    print('流程工作对接查看数据：' + response.data);
    return response.data;
  } catch (e) {}
}

//修改本部门流程工作文件
String url =
    'http://47.93.54.102:5000/departmentConfigurations/process_work/modify1';
Future _modifywrokflowfile(file) async {
  try {
    var data = {"manualFile": file};
    Response response = await Dio().post(url, data: data);
    print('流程工作文件上传：' + response.data);
    return response.data;
  } catch (e) {}
}

String department; //所属部门
String maunalname; //手册名称
String sequencename; //程序名称
String revision; //修订标识
String sequenceprocess; //流程步骤
String workname; //工作名称
String regulation; //工作规范

class WrokFlowModify extends StatefulWidget {
  WrokFlowModify(department1, maunalname1, sequencename1, revision1,
      sequenceprocess1, workname1, regulation1) {
    department = department1;
    maunalname = maunalname1;
    sequencename = sequencename1;
    revision = revision1;
    sequenceprocess = sequenceprocess1;
    workname = workname1;
    regulation = regulation1;

    print(sequencename + "  " + revision + "   " + regulation);
  }

  @override
  _WrokFlowModifyState createState() => _WrokFlowModifyState();
}

class _WrokFlowModifyState extends State<WrokFlowModify> {
  GlobalKey<FormState> searchKey = GlobalKey<FormState>();
  String modifyregulation = '';
  String workingProticol = '';
  FileType _pickingType = FileType.any;
  File file;
  String _fileName;
  String _path;
  void search() {
    var searchForm = searchKey.currentState;
    if (searchForm.validate()) {
      searchForm.save();
      modifyregulationmethod();
      if (_fileName != null) {
        modifywrokflowfile(_fileName); //选择文件上传;
      }
    }
  }

  void modifyregulationmethod() {
    _modifywrokflow(modifyregulation).then((val) {
      var data = jsonDecode(val.toString());
      ModifyWrokFlowModel modifyWrokFlowModel =
          ModifyWrokFlowModel.fromJson(data);
      String needmodifywrokflow = department +
          '--' +
          maunalname +
          '--' +
          sequencename +
          '--' +
          revision +
          '--' +
          sequenceprocess +
          '--' +
          workname +
          '--' +
          regulation;
      if (modifyWrokFlowModel.isModifyProcess.contains("true")) {
        String modifywrokflow = department +
            '--' +
            maunalname +
            '--' +
            sequencename +
            '--' +
            revision +
            '--' +
            sequenceprocess +
            '--' +
            workname +
            '--' +
            modifyregulation;
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('修改成功'),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Provide.value<WorkFlowModelProvide>(context)
                        .modifywrokflow(needmodifywrokflow, modifywrokflow);
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
              title: Text('未修改成功'),
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

  //添加上传文件方法
  void modifywrokflowfile(filename) {
    _modifywrokflowfile(filename).then((val) {
      var data = jsonDecode(val.toString());
      ModifyWrokFlowModel modifyWrokFlowModel1 =
          ModifyWrokFlowModel.fromJson(data);
      if (modifyWrokFlowModel1.isModifyProcess.contains("true")) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('文件修改成功'),
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
      } else {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('该文件修改失败'),
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

  void _openFile() async {
    try {
      _path = await FilePicker.getFilePath(type: _pickingType);
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }
    if (!mounted) {
      return;
    }
    setState(() {
      _fileName = _path.split('/').last;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('当前流程工作修改')),
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
              height: ScreenUtil().setHeight(170),
              child: Form(
                key: searchKey,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '工作规范：',
                        style: TextStyle(fontSize: ScreenUtil().setSp(30)),
                      ),
                    ),
                    Container(
                      height: ScreenUtil().setHeight(100),
                      width: ScreenUtil().setWidth(460),
                      alignment: Alignment.centerLeft,
                      child: TextFormField(
                        autofocus: false,
                        style: TextStyle(color: Colors.black54, fontSize: 18.0),
                        decoration: InputDecoration(hintText: '输入修改工作规范'),
                        obscureText: false,
                        onSaved: (value) {
                          modifyregulation = value;
                        },
                        validator: (value) {
                          return null;
                          /** continue...*/
                        },
                        onFieldSubmitted: (value) {},
                        /** continue...*/
                      ),
                    ),
                  ],
                ),
              ),
            ),
            _myFilePicker(),
            RaisedButton(
                onPressed: () {
                  search();
                },
                child: Text('修改')),
          ],
        ),
      ),
    );
  }

  Widget _myFilePicker() {
    return Container(
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: RaisedButton(
              onPressed: () {
                _openFile();
              },
              child: Text('选择文件'),
            ),
          ),
          Builder(
              builder: (BuildContext context) => _path != null
                  ? Container(
                      width: ScreenUtil().setWidth(350),
                      height: ScreenUtil().setHeight(80),
                      child: Scrollbar(
                        child: ListView.builder(
                          itemCount: 1,
                          itemBuilder: (BuildContext context, index) {
                            final String name = 'File : ' + _fileName;

                            return ListTile(
                              title: Text(
                                name,
                                overflow: TextOverflow.ellipsis,
                                style:
                                    TextStyle(fontSize: ScreenUtil().setSp(21)),
                              ),
                            );
                          },
                        ),
                      ),
                    )
                  : Container()),
        ],
      ),
    );
  }
}
