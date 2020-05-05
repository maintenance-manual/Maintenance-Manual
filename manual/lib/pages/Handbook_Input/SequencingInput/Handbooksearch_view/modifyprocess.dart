import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:manual/model/departmentvView_model.dart';
import 'package:manual/model/processInputModel/addprocess_model.dart.dart';
import 'package:manual/pages/Basic_Configure/department_configure.dart';
import 'package:manual/provide/departmentname_config_provide.dart';
import 'package:manual/provide/processModelProvide/processmodelProvide.dart';
import 'package:provide/provide.dart';

/**
 * 修改流程步骤
 */
DepartmentViewModel departmentlist;
Map<String, bool> isChecklist = {};

//修改流程步骤数据接口
Future _modifyProcessStep(stepNumber, step, department, revision) async {
  try {
    Dio dio = Dio();
    Response response = await dio.get(
        'http://47.93.54.102:5000/handbookInput/procedure/steps/modify?manualName=维修管理手册工作程序&procedureNumber=$procedureNumber&stepNumber=$processCode&step=$step&department=$department&revision=$revision',
        options: Options(responseType: ResponseType.plain));
    return response.data;
  } catch (e) {}
}

String handbookname; //手册名称
String procedureNumber; //程序编号
String processCode; //流程代码
String needModifiedStep;
String department = '';

class ModifyProcess extends StatefulWidget {
  ModifyProcess(
      handbook_name, procedure_Number, needModified_Step, process_Code) {
    handbookname = handbook_name;
    procedureNumber = procedure_Number;
    needModifiedStep = needModified_Step;
    processCode = process_Code;
    print(handbookname + '  ' + procedureNumber + '' + needModifiedStep);
  }
  @override
  _ModifyProcessState createState() => _ModifyProcessState();
}

class _ModifyProcessState extends State<ModifyProcess> {
  GlobalKey<FormState> newSequenceKey_2 = GlobalKey<FormState>();
  GlobalKey<FormState> newSequenceKey_3 = GlobalKey<FormState>();
  String choosedHandbookname; //被选择手册文件的名称;
  String sequenceNumber = '';
  String sequenceStep = '';
  String revision = '';

  void input() {
    var inputForm_2 = newSequenceKey_2.currentState;
    var inputForm_3 = newSequenceKey_3.currentState;
    if (inputForm_2.validate() && inputForm_3.validate()) {
      inputForm_2.save();
      inputForm_3.save();
      print(sequenceNumber +
          ' ' +
          sequenceStep +
          ' ' +
          revision +
          ' ' +
          department);
      modifyProcessStep();
    }
  }

  void modifyProcessStep() {
    //不是可选，结果为空
    _modifyProcessStep(sequenceNumber, sequenceStep, department, revision)
        .then((val) {
      var data = json.decode(val.toString());
      ModifyProcessModel modifyProcessModel = ModifyProcessModel.fromJson(data);
      if (modifyProcessModel.isModifyStep.contains("true")) {
        String modifyStep = processCode +
            '--' +
            sequenceStep +
            '--' +
            department +
            '--' +
            revision;
        Provide.value<ProcessWatchModelProvider>(context)
            .modifyProcess(needModifiedStep, modifyStep);
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('修改成功'),
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
  void initState() {
    //封装部门数据以及初始化
    getDepartment().then((val) {
      var data = json.decode(val.toString());
      departmentlist = DepartmentViewModel.fromJson(data);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('修改流程步骤')),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _newSequenceTextField(),
              Container(
                alignment: Alignment.centerLeft,
                height: ScreenUtil().setHeight(40),
                child: Text(
                  '责任部门  ',
                  style: TextStyle(
                    fontSize: ScreenUtil().setSp(30),
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              ShowCHeckBoxandDepartment(),
              InkWell(
                onTap: () {
                  input();
                },
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.black26,
                  width: ScreenUtil().setWidth(750),
                  height: ScreenUtil().setHeight(120),
                  child: Text('修改'),
                ),
              ),
            ],
          ),
        ));
  }

  Widget _newSequenceTextField() {
    return Container(
      height: ScreenUtil().setHeight(400),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  '流程代码    $processCode',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: ScreenUtil().setSp(30),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  '程序流程    ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: ScreenUtil().setSp(30),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Form(
                key: newSequenceKey_2,
                child: Container(
                  height: ScreenUtil().setHeight(120),
                  width: ScreenUtil().setWidth(460),
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: TextFormField(
                      autofocus: false,
                      style: TextStyle(color: Colors.black54, fontSize: 18.0),
                      decoration: InputDecoration(),
                      obscureText: false,
                      onSaved: (value) {
                        sequenceStep = value;
                      },
                      validator: (value) {
                        if (value.length == 0) {
                          return "此处不能为空";
                        } else {
                          return null;
                        }
                        /** continue...*/
                      },
                      onFieldSubmitted: (value) {},
                      /** continue...*/
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  '修订标识    ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: ScreenUtil().setSp(30),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Form(
                key: newSequenceKey_3,
                child: Container(
                  height: ScreenUtil().setHeight(120),
                  width: ScreenUtil().setWidth(460),
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: TextFormField(
                      autofocus: false,
                      style: TextStyle(color: Colors.black54, fontSize: 18.0),
                      decoration: InputDecoration(),
                      obscureText: false,
                      onSaved: (value) {
                        revision = value;
                      },
                      validator: (value) {
                        if (value.length == 0) {
                          return "此处不能为空";
                        } else {
                          return null;
                        }
                        /** continue...*/
                      },
                      onFieldSubmitted: (value) {},
                      /** continue...*/
                    ),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

//选择按钮组件，为各部门配置流程步骤
class ShowCHeckBoxandDepartment extends StatefulWidget {
  ShowCHeckBoxandDepartment({Key key}) : super(key: key);

  @override
  _ShowCHeckBoxandDepartmentState createState() =>
      _ShowCHeckBoxandDepartmentState();
}

class _ShowCHeckBoxandDepartmentState extends State<ShowCHeckBoxandDepartment> {
  List<Widget> _buttonWidget = [];
  List<bool> choicelist = new List<bool>();

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i < departmentlist.departmentList.length; i++) {
      choicelist.add(false);
    }
    return Container(
      alignment: Alignment.center,
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(620),
      child: ListView.builder(
          itemCount: departmentlist.departmentList.length,
          itemBuilder: (context, index) {
            return _buttonItem(
                departmentlist.departmentList[index], index, choicelist[index]);
          }),
    );
  }

  Widget _buttonItem(departmentname, index, choice) {
    return Container(
      height: ScreenUtil().setHeight(120),
      width: ScreenUtil().setWidth(750),
      child: Row(
        children: <Widget>[
          Container(
            width: ScreenUtil().setWidth(120),
          ),
          Checkbox(
            value: choicelist[index],
            activeColor: Colors.blueGrey,
            onChanged: (bool val) {
              setState(() {
                choicelist[index] = val;
                department = departmentname;
                print(departmentname);
              });
            },
          ),
          Text(departmentname),
        ],
      ),
    );
  }
}
