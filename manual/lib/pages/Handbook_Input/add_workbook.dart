import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';

class AddNewWorkbook extends StatefulWidget {
  @override
  _AddNewWorkbookState createState() => _AddNewWorkbookState();
}

class _AddNewWorkbookState extends State<AddNewWorkbook> {
  GlobalKey<FormState> handbookNameKey = GlobalKey<FormState>();
  String inputBookNameText = '';
  FileType _pickingType = FileType.ANY;
  String _fileName;
  String _path;
  void input() {
    var inputForm = handbookNameKey.currentState;
    if (inputForm.validate()) {
      inputForm.save();
      print(inputBookNameText);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('手册程序电子化管理系统'),
      ),
      body: Container(
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
                onPressed: (/** continue...*/) {
                  input();
                  /** continue...*/
                },
              ),
            ),
            /** continue...*/
          ],
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
                      width: ScreenUtil().setWidth(350),
                      height: ScreenUtil().setHeight(80),
                      child: Scrollbar(
                        child: ListView.builder(
                          itemCount: 1,
                          itemBuilder: (BuildContext context, index) {
                            final String name = 'File : ' + _fileName;
                            final path = _path;
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
}
