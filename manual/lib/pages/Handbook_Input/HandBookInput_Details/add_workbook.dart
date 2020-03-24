import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:manual/provide/handbookInputProvide.dart';
import 'package:provide/provide.dart';

String manualName;
String url_1 =
    'http://47.93.54.102:5000/handbookInput/handbook/add?manualName'; //新增手册，创建文件名称
String url_2 =
    'http://47.93.54.102:5000/handbookInput/handbook/add1'; //上传文件或参加文件夹

//引入新增手册文件名称接口
Future addHandBookInputName(String manualName) async {
  try {
    Dio dio = Dio();
    Response response = await dio.get(url_1 + '=$manualName',
        options: Options(
          responseType: ResponseType.plain,
        ));
    print('接收手册录入数据接口数据---->');
    print(response.data);
    return response.data;
  } catch (e) {
    print(e);
  }
}

//引入上传手册文件接口
Future addHandbookFile(String file) async {
  try {
    Response response;
    var data = {"manualFile": file};
    response = await Dio().post(url_2, data: data);
    return response.data;
  } catch (e) {
    print(e);
  }
}

class AddNewWorkbook extends StatefulWidget {
  @override
  _AddNewWorkbookState createState() => _AddNewWorkbookState();
}

class _AddNewWorkbookState extends State<AddNewWorkbook> {
  GlobalKey<FormState> handbookNameKey = GlobalKey<FormState>();
  String inputBookNameText = '';
  FileType _pickingType = FileType.any;
  String _fileName;
  String _path;
  void input() {
    var inputForm = handbookNameKey.currentState;
    if (inputForm.validate()) {
      inputForm.save();
      setState(() {
        manualName = inputBookNameText;
      });
    }
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

  void addOption(context, String manualname, String file) {
    addHandbookFile(file).then((value) {
      addHandBookInputName(manualname);
      Provide.value<HandBookInputModelProvide>(context)
          .addhandbookInputfilename(manualname);
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('手册程序电子化管理系统'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            children: <Widget>[
              Container(
                height: ScreenUtil().setHeight(150),
                width: ScreenUtil().setWidth(750),
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  '工作手册新增',
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
              _handbookNameRow(),
              _myFilePickerUI(),
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
                  onPressed: () {
                    input();
                    Pattern pattern = 'r^"Download/"';
                    List string = _fileName.split(pattern);
                    addOption(context, manualName, string[0]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _handbookNameRow() {
    return Container(
      margin: EdgeInsets.only(top: 35),
      height: ScreenUtil().setHeight(100),
      width: ScreenUtil().setWidth(750),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 15.0),
            width: ScreenUtil().setWidth(130),
            child: Text(
              '手册名称',
              style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(30),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Form(
              key: handbookNameKey,
              child: Container(
                width: ScreenUtil().setWidth(500),
                child: TextFormField(
                  autofocus: false,
                  style: TextStyle(color: Colors.black38, fontSize: 18.0),
                  decoration: InputDecoration(),
                  textAlign: TextAlign.center,
                  obscureText: false,
                  onSaved: (value) {
                    inputBookNameText = value;
                  },
                  validator: (value) {
                    return null;
                    /** continue...*/
                  },
                  onFieldSubmitted: (value) {},
                  /** continue...*/
                ),
              )),
        ],
      ),
    );
  }

  Widget _myFilePickerUI() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      height: ScreenUtil().setHeight(100),
      width: ScreenUtil().setWidth(750),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 5.0),
            width: ScreenUtil().setWidth(130),
            child: Text(
              '手册文件',
              style: TextStyle(
                color: Colors.black,
                fontSize: ScreenUtil().setSp(30),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          _myFilePicker(),
        ],
      ),
    );
  }

  Widget _myFilePicker() {
    return Container(
      child: Row(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
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
                      width: ScreenUtil().setWidth(320),
                      height: ScreenUtil().setHeight(80),
                      child: Scrollbar(
                        child: ListView.builder(
                          itemCount: 1,
                          itemBuilder: (BuildContext context, index) {
                            final String name = 'File : ' + _fileName;
                            final path = _path;
                            print(path);
                            return ListTile(
                                title: Text(
                              name,
                              style: TextStyle(
                                fontSize: 10,
                              ),
                            ));
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
