import 'package:dio/dio.dart';
import 'dart:async';
import '../config/service_url.dart';

/**
 * 在此添加Future方法
 */
//暂定通用方法
Future request(url,{formData})async{
    try{
      print('开始获取数据...............');
      Response response;
      Dio dio = new Dio();
      if(formData==null){
          response = await dio.get(url);
      }else{
         // response = await dio.post(servicePath[url],data:formData);
      }
      if(response.statusCode==200){
        return response.data;
      }else{
          throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
      }
    }catch(e){
        return print('ERROR:======>$e');
    }
     
}


/**
 * 接口测试方法
 * 
 * getdata为service_url自定义路径名称
 */

  // void _getdata() async{
  //   await request('getdata').then((val){
  //     var data = json.decode(val.toString());
  //     print(data);
  //   });
  // }