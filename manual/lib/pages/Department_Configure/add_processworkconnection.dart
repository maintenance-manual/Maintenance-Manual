import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNewProcessConnect extends StatefulWidget {
  @override
  _AddNewProcessConnectState createState() => _AddNewProcessConnectState();
}

class _AddNewProcessConnectState extends State<AddNewProcessConnect> {
  GlobalKey<FormState> newProcessConnectKey = GlobalKey<FormState>();
  var _pickingChoice = 0;
  String workingProticol = '';
  FileType _pickingType = FileType.any;
  String _fileName;
  String _path;
  void createNew() {
    var createNewForm = newProcessConnectKey.currentState;
    if (createNewForm.validate()) {
      createNewForm.save();
      print(workingProticol);
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
              _myDropdownButton(),
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
              _myDropdownButton(),
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

  Widget _myDropdownButton() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 10),
      child: DropdownButton(
        value: _pickingChoice,
        items: <DropdownMenuItem>[
          DropdownMenuItem(
            child: Text('                                              '),
            value: 0,
          ),
          /** continue...*/
        ],
        onChanged: (value) => setState(() {
          _pickingChoice = value;
        }),
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
}
