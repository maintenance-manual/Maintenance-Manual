import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:manual/model/handbookview_model.dart';
import 'package:manual/provide/handbook_view_list.dart';
import 'package:manual/service/service_method.dart';
import 'package:provide/provide.dart';

class HandBookView extends StatefulWidget {
  @override
  _HandBookViewState createState() => _HandBookViewState();
}

class _HandBookViewState extends State<HandBookView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('手册浏览'),
      ),
      body: Container(
        child: Row(
          children: <Widget>[
            HandBookList(),
          ],
        ),
      ),
    );
  }
}

class HandBookList extends StatefulWidget {
  @override
  _HandBookListState createState() => _HandBookListState();
}

class _HandBookListState extends State<HandBookList> {
  List list = [];
  var listIndex = 0;

  Future getList() async {
  try {
    Dio dio = Dio();
    dio.options.contentType = ContentType.parse(
        "application/x-www-form-urlencoded");
    Response response = await dio.get("http://47.93.54.102:5000/read/readHandbook",options:Options(responseType: ResponseType.plain,));
    return response.data;
  } catch (e) {
    print(e);
  }
}

  @override
  void initState() {
    getList().then((val){
      var data = json.decode(val.toString());
      HandbookViewModel handbookView = HandbookViewModel.fromJson(data);
      setState(() {
       list = handbookView.manualList; 
      });
      Provide.value<HandbookViewListProvide>(context).getHandbookList(list);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(750),
      decoration: BoxDecoration(
        border: Border(right: BorderSide(width: 1, color: Colors.black12)),
      ),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return _listInkWell(index);
        },
      ),
    );
  }

    Widget _listInkWell(int index) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: ScreenUtil().setHeight(180),
        padding: EdgeInsets.only(left: 10, top: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            bottom: BorderSide(width: 1, color: Colors.black12),
          ),
        ),
        child: Text(
          list[index],
          style: TextStyle(fontSize: ScreenUtil().setSp(28)),
        ),
      ),
    );
  }
}

// class HandBookView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         child: Scaffold(
//       appBar: AppBar(
//         title: Text('手册浏览'),
//       ),
//       body: ExpansionPanelDemo()
//     ));
//   }
// }

// //手册浏览目录
// class ExpansionPanelDemo extends StatefulWidget {
//   ExpansionPanelDemo({Key key}) : super(key: key);

//   _ExpansionPanelDemoState createState() => _ExpansionPanelDemoState();
// }

// class _ExpansionPanelDemoState extends State<ExpansionPanelDemo> {
// //定义数组类型;
//   List<int> mList;
//   List<ExpandStateBean> expandStateList;
//   _ExpansionPanelDemoState(){
//     mList = new List();
//     expandStateList = new List();
//     for(int i=0;i<20;i++){
//       mList.add(i);
//       expandStateList.add(ExpandStateBean(i,false));
//     }
//   }

//   //申明内部方法;
//   _setCurrentIndex(int index,isExpand){
//     setState(() {
//      expandStateList.forEach((item){
//        if(item.index==index){
//          item.isOpen=!isExpand;
//        }
//      }); 
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: SingleChildScrollView(
//          child: ExpansionPanelList(
//            expansionCallback: (index,bol){
//              _setCurrentIndex(index,bol);
//            },
//            children: mList.map((index){
//               return ExpansionPanel(
//                 headerBuilder: (context,isExpandded){
//                   return ListTile(
//                     title: Text('输入手册大目录:$index'),
//                   );
//                 },
//                 body: ListTile(
//                   title: Text('传递手册名称文件$index'),
//                   onTap: (){},
//                 ),
//                 isExpanded: expandStateList[index].isOpen
//               );
//            }).toList(),
//          )
//       ),
//     );
//   }
// }

// class ExpandStateBean{
//   var isOpen;
//   var index;
//     ExpandStateBean(this.index,this.isOpen);
// }