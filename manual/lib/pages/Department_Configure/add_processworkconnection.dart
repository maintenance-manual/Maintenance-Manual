import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manual/login_page.dart';
import 'package:manual/model/wrokflowModel/workflowmodel.dart';
import 'package:manual/pages/Handbook_Input/sequencing_input.dart';

/**
 * 添加流程工作对接
 */
//添加本部门流程工作(除文件)
Future _addwrokflow(String addprocess, String addprocessNumber, String workname,
    String regulation) async {
  try {
    Dio dio = Dio();
    Response response = await dio.get(
        'http://47.93.54.102:5000/departmentConfigurations/process_work/add?username=$userName&&manualName=维修管理手册工作程序&&procedureNumber=02-11-002&&processNumber=$addprocessNumber&&work=$addprocess&&regulation=$regulation',
        options: Options(responseType: ResponseType.plain));
    print('流程工作对接修改数据：' + response.data);
    return response.data;
  } catch (e) {}
}

//查看流程工作对接编号接口
Future _searchwrokflownumber() async {
  try {
    Dio dio = Dio();
    Response response = await dio.get(
        'http://47.93.54.102:5000/handbookInput/procedure/steps?manualName=维修管理手册工作程序&procedureNumber=02-11-002',
        options: Options(responseType: ResponseType.plain));
    print('流程工作对接流程编号查看数据：' + response.data);
    return response.data;
  } catch (e) {}
}

//添加本部门流程工作文件
String url =
    'http://47.93.54.102:5000/departmentConfigurations/process_work/add1';
Future _addwrokflowfile(file) async {
  try {
    var data = {"manualFile": file};
    Response response = await Dio().post(url, data: data);
    print('流程工作文件上传：' + response.data);
    return response.data;
  } catch (e) {}
}

WrokFlowModel allwrokflowmodel; //初始化查到所有流程工作模型；
WatchWrokFlowNumberModel watchWrokFlowNumberModel; //用来查看新建里流程编号的数据模型；

class AddNewProcessConnect extends StatefulWidget {
  AddNewProcessConnect(allwrokflowmodel1) {
    allwrokflowmodel = allwrokflowmodel1;
  }

  @override
  _AddNewProcessConnectState createState() => _AddNewProcessConnectState();
}

class _AddNewProcessConnectState extends State<AddNewProcessConnect> {
  GlobalKey<FormState> newProcessConnectKey = GlobalKey<FormState>();
  var _pickingChoice = 0;
  var _pickingChoice1 = 0;
  var _pickingChoice2 = 0;
  /**
   * 将要添加的元素
   */
  String addprocess = ''; //程序流程
  String addprocessNumber = ''; //程序编号
  String addworkname = ''; //工作名称
  String addregulation = ''; //工作规范

  String workingProticol = '';
  FileType _pickingType = FileType.any;
  String _fileName;
  String _path;
  void createNew() {
    var createNewForm = newProcessConnectKey.currentState;
    if (createNewForm.validate()) {
      createNewForm.save();
      addmodifyrugulation(
          addprocess, addprocessNumber, addworkname, addregulation);
    }
  }

//添加get方法上传修改信息（除文件）
  void addmodifyrugulation(
      addprocess, addprocessNumber, addworkname, addregulation) {
    _addwrokflow(addprocess, addprocessNumber, addworkname, addregulation)
        .then((val) {
      var data = jsonDecode(val.toString());
      AddWrokFlowModel addWrokFlowModel = AddWrokFlowModel.fromJson(data);
      if (addWrokFlowModel.isAddProcess.contains("true")) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('添加成功'),
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
              title: Text('该流程可能已存在'),
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
  void addwrokflowfile(filename) {
    _addwrokflowfile(filename).then((val) {
      var data = jsonDecode(val.toString());
      //此处未建立文件上传数据模型，暂以流程文件添加数据模型代替
      AddWrokFlowModel addWrokFlowModel = AddWrokFlowModel.fromJson(data);
      if (addWrokFlowModel.isAddProcess.contains("true")) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('文件添加成功'),
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
              title: Text('该文件可能已存在'),
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

  void getallwrokflownumber() {
    _searchwrokflownumber().then((val) {
      var data = jsonDecode(val.toString());
      watchWrokFlowNumberModel = WatchWrokFlowNumberModel.fromJson(data);
      print(watchWrokFlowNumberModel.toJson());
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getallwrokflownumber();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('手册程序电子化管理系统'),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: ScreenUtil().setHeight(150),
                width: ScreenUtil().setWidth(750),
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  '新建流程工作对接',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: ScreenUtil().setSp(50),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 1, color: Colors.black12))),
              ),
              Container(
                margin: EdgeInsets.only(right: 5.0, top: 30),
                width: ScreenUtil().setWidth(130),
                child: Text(
                  '程序流程',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: ScreenUtil().setSp(28),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              _myDropdownButton(),
              Container(
                margin: EdgeInsets.only(right: 5.0, top: 20),
                width: ScreenUtil().setWidth(130),
                child: Text(
                  '流程编号',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: ScreenUtil().setSp(28),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              _myDropdownButton1(),
              Container(
                margin: EdgeInsets.only(right: 5.0, top: 20),
                width: ScreenUtil().setWidth(130),
                child: Text(
                  '工作名称',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: ScreenUtil().setSp(30),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              _myDropdownButton2(),
              Container(
                margin: EdgeInsets.only(right: 5.0, top: 20),
                width: ScreenUtil().setWidth(130),
                child: Text(
                  '工作规范',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: ScreenUtil().setSp(30),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              _proticolTextField(),
              _myFilePicker(),
              Container(
                margin: EdgeInsets.all(40),
                alignment: Alignment.center,
                child: FlatButton(
                  color: Colors.blueGrey,
                  highlightColor: Colors.blueGrey[700],
                  colorBrightness: Brightness.dark,
                  splashColor: Colors.grey,
                  child: Text("新建"),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  onPressed: (/** continue...*/) {
                    createNew();
                    /** continue...*/
                  },
                ),
              ),
            ],
          ),
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
                            addwrokflowfile(_fileName); //选择文件上传;
                            return ListTile(
                              title: Text(
                                name,
                                overflow: TextOverflow.ellipsis,
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

  Widget _proticolTextField() {
    return Form(
      key: newProcessConnectKey,
      child: Container(
        height: ScreenUtil().setHeight(100),
        width: ScreenUtil().setWidth(460),
        alignment: Alignment.centerLeft,
        child: TextFormField(
          autofocus: false,
          style: TextStyle(color: Colors.black54, fontSize: 18.0),
          decoration: InputDecoration(),
          obscureText: false,
          onSaved: (value) {
            workingProticol = value;
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
    );
  }

  // var _pickingChoice = 0;
  //程序流程下拉菜单
  Widget _myDropdownButton() {
    List listprocessdata = ["请选择"]; //下拉菜单里内容通用数据类型；
    for (var i = 0; i < allwrokflowmodel.workList.length; i++) {
      listprocessdata
          .add(allwrokflowmodel.workList[i].split('--')[2]); //暂且当做程序流程
    }
    return Container(
      width: ScreenUtil().setWidth(250),
      alignment: Alignment.centerLeft,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DropdownButton(
          value: _pickingChoice,
          items: getListData(listprocessdata),
          onChanged: (value) => setState(() {
            _pickingChoice = value;
            addprocess = listprocessdata[_pickingChoice];
          }),
        ),
      ),
    );
  }

  //流程编号下拉菜单
  Widget _myDropdownButton1() {
    List listprocessdata = ["请选择"]; //下拉菜单里内容通用数据类型；
    for (var i = 0; i < allwrokflowmodel.workList.length; i++) {
      listprocessdata
          .add(watchWrokFlowNumberModel.stepList[i].split('--')[0]); //暂且当做流程编号
      // allwrokflowmodel.workList[i].split('--')[5]; //工作名称
    }
    return Container(
      width: ScreenUtil().setWidth(500),
      alignment: Alignment.centerLeft,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DropdownButton(
          value: _pickingChoice1,
          items: getListData(listprocessdata),
          onChanged: (value) => setState(() {
            _pickingChoice1 = value;
            addprocessNumber = listprocessdata[_pickingChoice1];
          }),
        ),
      ),
    );
  }

  //工作名称下拉菜单
  Widget _myDropdownButton2() {
    List listprocessdata = ["请选择"]; //下拉菜单里内容通用数据类型；
    for (var i = 0; i < allwrokflowmodel.workList.length; i++) {
      listprocessdata.add(allwrokflowmodel.workList[i].split('--')[5]); //工作名称
    }
    return Container(
      width: ScreenUtil().setWidth(500),
      alignment: Alignment.centerLeft,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DropdownButton(
          value: _pickingChoice2,
          items: getListData(listprocessdata),
          onChanged: (value) => setState(() {
            _pickingChoice2 = value;
            addprocess = listprocessdata[_pickingChoice2];
          }),
        ),
      ),
    );
  }

  //下拉菜单显示数据通用方法
  List<DropdownMenuItem> getListData(List listprocess) {
    List<DropdownMenuItem> items = List<DropdownMenuItem>.generate(
        listprocess.length,
        (index) => new DropdownMenuItem(
            child: new Text(
              listprocess[index],
              overflow: TextOverflow.ellipsis,
            ),
            value: index));
    return items;
  }
}
