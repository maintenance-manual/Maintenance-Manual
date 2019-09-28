<<<<<<< HEAD
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:manual/model/handbookview_model.dart';
import 'package:manual/provide/handbookview_provide.dart';
import 'dart:io';
=======
import 'package:flutter/material.dart';
>>>>>>> parent of a1b31fc... 部分接口调试成功
import 'package:manual/service/service_method.dart';

class HandBookView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
<<<<<<< HEAD
            appBar: AppBar(
              title: Text('手册浏览'),
            ),
            body: ExpansionPanelDemo()));
=======
      appBar: AppBar(
        title: Text('手册浏览'),
      ),
      body: ExpansionPanelDemo()
    ));
>>>>>>> parent of a1b31fc... 部分接口调试成功
  }
}

//手册浏览目录
class ExpansionPanelDemo extends StatefulWidget {
  ExpansionPanelDemo({Key key}) : super(key: key);
<<<<<<< HEAD

  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
//定义数组类型;
  // List<ExpandStateBean> expandStateList;
  // _ExpansionPanelDemoState() {
  //   mList = new List();
  //   expandStateList = new List();
  //   for (int i = 0; i < 20; i++) {
  //     //mList.add(i);
  //     expandStateList.add(ExpandStateBean(i, false));
  //   }
  // }

  // Future getHttp() async {
  //   try {
  //     print('开始获取手册浏览数据.......');
  //     Dio dio = Dio();
  //     dio.options.contentType =
  //         ContentType.parse("application/x-www-form-urlencoded");
  //     Response response =
  //         await dio.get("http://47.93.54.102:5000/read/readHandbook");
  //     return response.data;
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  void _getHandbookView()async{
    await request('handbookview').then((val){
          var data = json.decode(val.toString());
          print(data);
    });
  }


  @override
  void initState() {
    // getHttp().then((val) {
    //     var data = json.decode(val.toString());
    //     HandbookViewModel list = HandbookViewModel.formJson(data['manualList']); 
    //     list.manualList.forEach((item)=>print(item));
    //   print(val);
    // });
    super.initState();
=======

  _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
}

class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
//定义数组类型;
  List<int> mList;
  List<ExpandStateBean> expandStateList;
  _ExpansionPanelDemoState(){
    mList = new List();
    expandStateList = new List();
    for(int i=0;i<20;i++){
      mList.add(i);
      expandStateList.add(ExpandStateBean(i,false));
    }
  }

  //申明内部方法;
  _setCurrentIndex(int index,isExpand){
    setState(() {
     expandStateList.forEach((item){
       if(item.index==index){
         item.isOpen=!isExpand;
       }
     }); 
    });
>>>>>>> parent of a1b31fc... 部分接口调试成功
  }

  //申明内部方法;
  // _setCurrentIndex(int index, isExpand) {
  //   setState(() {
  //     expandStateList.forEach((item) {
  //       if (item.index == index) {
  //         item.isOpen = !isExpand;
  //       }
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
<<<<<<< HEAD
      child: Text('sssss'),
=======
      child: SingleChildScrollView(
         child: ExpansionPanelList(
           expansionCallback: (index,bol){
             _setCurrentIndex(index,bol);
           },
           children: mList.map((index){
              return ExpansionPanel(
                headerBuilder: (context,isExpandded){
                  return ListTile(
                    title: Text('输入手册大目录:$index'),
                  );
                },
                body: ListTile(
                  title: Text('传递手册名称文件$index'),
                  onTap: (){},
                ),
                isExpanded: expandStateList[index].isOpen
              );
           }).toList(),
         )
      ),
>>>>>>> parent of a1b31fc... 部分接口调试成功
    );
  }
}

<<<<<<< HEAD
// class ExpandStateBean {
//   var isOpen;
//   var index;
//   ExpandStateBean(this.index, this.isOpen);
// }
=======
class ExpandStateBean{
  var isOpen;
  var index;
    ExpandStateBean(this.index,this.isOpen);
}
>>>>>>> parent of a1b31fc... 部分接口调试成功
