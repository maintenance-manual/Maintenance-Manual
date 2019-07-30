import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:manual/service/service_method.dart';

class DepartmentConfigure extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      appBar: AppBar(
        title: Text('部门配置'),
      ),
      body: DepartmentConfigureDemo(),
    ));
  }
}

//部门名称下列表组件
class DepartmentConfigureDemo extends StatefulWidget {
  DepartmentConfigureDemo({Key key}) : super(key: key);

  _DepartmentConfigureDemoState createState() => _DepartmentConfigureDemoState();
}

class _DepartmentConfigureDemoState extends State<DepartmentConfigureDemo> {
  final List<String> items = new List<String>.generate(10, (i) => "Items $i");
 
  @override
  Widget build(BuildContext context) {
    return Container(
       child: Scaffold(
         body: new ListView.builder(
           itemCount: items.length,
           itemBuilder: (context,index){
             return new ListTile(
               leading: new Icon(Icons.account_circle),
               title: new Text('${items[index]}'),
               onTap: (){}
             );
           },
         ),
       ),
    );
  }
}