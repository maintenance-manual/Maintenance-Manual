import 'package:dio/dio.dart';
import 'dart:async';
import 'dart:io';
import '../config/service_url.dart';

/**
 * 在此添加Future方法
 */

//暂定通用方法
Future request(url,{formData}) async {
  try {
    print('开始获取数据......................');
    Response response;
    Dio dio = Dio();
    dio.options.contentType = ContentType.parse(
        "application/x-www-form-urlencoded") /**表单形式 */; //此处为设置请求的数据类型/////可根据需求更改
    if (formData == null) {
      response = await dio.post(servicePath[url]);
    } else {
      response = await dio.post(servicePath[url], data: formData);
    }
    if (response.statusCode == 200 /**200说明请求成功，可以返回 */) {
      return response.data;
    } else {
      throw Exception('后端接口出现异常');
    }
  } catch (e) {
    return print('ERROR:============>  '+e);
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