import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manual/pages/Handbook_Input/sequencing_input.dart';
import 'package:manual/provide/handbookInputProvide.dart';
import 'package:provide/provide.dart';
import '../handbook_input.dart';


String url_2 = "http://47.93.54.102:5000/handbookInput/procedure/add1";//post方法上传文件
//引入新增程序各项值接口---get方法
Future addSequencyingmessage(String choosedHandbookname,String procedureNumber,String produreName,String chapter) async {
  try {
    Dio dio = Dio();
    Response response = await dio.get(
        "http://47.93.54.102:5000/handbookInput/procedure/add?manualName=$choosedHandbookname&procedureNumber=$procedureNumber&procedureName=$produreName&chapter=$chapter",
        options: Options(
          responseType: ResponseType.plain,
        ));
    print('上传新增程序各项值数据......');
    print(response.data);
    return response.data;
  } catch (e) {
    print(e);
  }
}

//上传流程图和程序文件接口
Future addpostSequencyingFile(String file) async {
  try {
    Response response;
    var data = {"manualFile": file};
    response = await Dio().post(url_2, data: data);
    print('post方法上传文件...成功');
    return response.data;
  } catch (e) {
    print(e);
  }
}

class AddNewSequence extends StatefulWidget {
  @override
  _AddNewSequenceState createState() => _AddNewSequenceState();
}

class _AddNewSequenceState extends State<AddNewSequence> {
  GlobalKey<FormState> newSequenceKey = GlobalKey<FormState>();
  String choosedHandbookname; //被选择手册文件的名称;
  String sequenceNumber = '';
  String sequenceName = '';
  String purpose = '';
  String sphere = '';
  String terminology = '';
  String dependency = '';
  String version = '';
  FileType _pickingType = FileType.any;
  String _fileName1;
  String _fileName2;
  String _path1;
  String _path2;
  void createNew() {
    var createNewForm = newSequenceKey.currentState;
    if (createNewForm.validate()) {
      createNewForm.save();
      print(choosedHandbookname+sequenceNumber +
          '  ' +
          sequenceName +
          '  ' +
          purpose +
          '  ' +
          sphere +
          '  ' +
          terminology +
          '  ' +
          dependency +
          '      ' +
          version);
    }
  }

  void _openFile1() async {
    try {
      _path1 = await FilePicker.getFilePath(type: _pickingType);
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }
    if (!mounted) {
      return;
    }
    setState(() {
      _fileName1 = _path1.split('/').last;
    });
  }

  void _openFile2() async {
    try {
      _path2 = await FilePicker.getFilePath(type: _pickingType);
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }
    if (!mounted) {
      return;
    }
    setState(() {
      _fileName2 = _path2.split('/').last;
    });
  }

  var _pickingChoice = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('手册程序电子化管理系统'),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Form(
            key: newSequenceKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: ScreenUtil().setHeight(150),
                  width: ScreenUtil().setWidth(750),
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    '新建程序',
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
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 35),
                  child: Text(
                    '手册文件',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: ScreenUtil().setSp(30),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                _myDropdownButton(),
                _newSequenceTextField(),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    '流程图',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: ScreenUtil().setSp(30),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                _myFilePickerUI(_myFilePicker1()),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    '程序文件',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: ScreenUtil().setSp(30),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                _myFilePickerUI(_myFilePicker2()),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    '修订版本',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: ScreenUtil().setSp(30),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Container(
                  height: ScreenUtil().setHeight(120),
                  width: ScreenUtil().setWidth(460),
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: TextFormField(
                      autofocus: false,
                      style: TextStyle(color: Colors.black54, fontSize: 18.0),
                      decoration: InputDecoration(),
                      obscureText: false,
                      onSaved: (value) {
                        version = value;
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
                /** continue...*/
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _myFilePicker2() {
    return Container(
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: RaisedButton(
              onPressed: () {
                _openFile2();
              },
              child: Text('选择文件'),
            ),
          ),
          Builder(
              builder: (BuildContext context) => _path2 != null
                  ? Container(
                      width: ScreenUtil().setWidth(350),
                      height: ScreenUtil().setHeight(80),
                      child: Scrollbar(
                        child: ListView.builder(
                          itemCount: 1,
                          itemBuilder: (BuildContext context, index) {
                            final String name = 'File : ' + _fileName2;
                            final path = _path2;
                            return ListTile(
                              title: Text(name),
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

  Widget _myFilePicker1() {
    return Container(
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: RaisedButton(
              onPressed: () {
                _openFile1();
              },
              child: Text('选择文件'),
            ),
          ),
          Builder(
              builder: (BuildContext context) => _path1 != null
                  ? Container(
                      width: ScreenUtil().setWidth(350),
                      height: ScreenUtil().setHeight(80),
                      child: Scrollbar(
                        child: ListView.builder(
                          itemCount: 1,
                          itemBuilder: (BuildContext context, index) {
                            final String name = 'File : ' + _fileName1;
                            final path = _path1;
                            return ListTile(
                              title: Text(name),
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

  Widget _myFilePickerUI(Widget _widget) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: ScreenUtil().setHeight(100),
      width: ScreenUtil().setWidth(750),
      child: _widget,
    );
  }

  //选择手册名称
  List<DropdownMenuItem> gethandbookListData(list_positionlist) {
    //读取岗位配置里的数据并做好下标传给items，弄成下拉菜单
    List<DropdownMenuItem> items = List<DropdownMenuItem>.generate(
        list_positionlist.length,
        (index) => new DropdownMenuItem(
            child: new Text(list_positionlist[index].toString().split('--')[0]),
            value: index));
    return items;
  }

  var _pickingChoice1 = 0;
  Widget _myDropdownButton() {
    List handbooklist = Provide.value<HandBookInputModelProvide>(context)
        .handbookInputList
        .positionList;
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 10),
      child: DropdownButton(
        value: _pickingChoice1,
        items: gethandbookListData(handbooklist),
        onChanged: (value) => setState(() {
          _pickingChoice1 = value;
          choosedHandbookname =
              handbooklist[_pickingChoice1].toString().split('--')[0];
        }),
      ),
    );
  }

  Widget _newSequenceTextField() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 20),
            child: Text(
              '程序编号',
              style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(30),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
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
                  sequenceNumber = value;
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
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 20),
            child: Text(
              '程序名称',
              style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(30),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
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
                  sequenceName = value;
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
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 20),
            child: Text(
              '目的',
              style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(30),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
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
                  purpose = value;
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
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 20),
            child: Text(
              '适用范围',
              style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(30),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
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
                  sphere = value;
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
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 20),
            child: Text(
              '名词术语',
              style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(30),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
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
                  terminology = value;
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
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(top: 20),
            child: Text(
              '依据',
              style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(30),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
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
                  dependency = value;
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
        ],
      ),
    );
  }
}
