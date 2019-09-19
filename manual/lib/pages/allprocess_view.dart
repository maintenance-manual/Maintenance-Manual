import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class AllProcessView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('手册程序电子化管理系统'),
      ),
      body: Container(
        child: Center(
          child: FlatButton(
            color: Colors.blueGrey,
            highlightColor: Colors.blueGrey[700],
            colorBrightness: Brightness.dark,
            splashColor: Colors.grey,
            child: Text("下载"),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            onPressed: (/** continue...*/) async {
              _checkPermission(context);
              final savedDir = Directory('/storage/Download');
              bool hasExisted = await savedDir.exists();
// 不存在就新建路径
              if (!hasExisted) {
                savedDir.create();
              }
              /** continue...*/
              _downloadFile(
                  'http://a2.att.hudong.com/10/96/300000931099127952960461732.jpg',
                  savedDir);
            },
          ),
        ),
      ),
    );
  }

  Future<bool> _checkPermission(context) async {
  // 先对所在平台进行判断
  if (Theme.of(context).platform == TargetPlatform.android) {
    PermissionStatus permission = await PermissionHandler()
        .checkPermissionStatus(PermissionGroup.storage);
    if (permission != PermissionStatus.granted) {
      Map<PermissionGroup, PermissionStatus> permissions =
          await PermissionHandler()
              .requestPermissions([PermissionGroup.storage]);
      if (permissions[PermissionGroup.storage] == PermissionStatus.granted) {
        return true;
      }
    } else {
      return true;
    }
  } else {
    return true;
  }
  return false;
}

  _downloadFile(downloadUrl, savePath) async {
    await FlutterDownloader.enqueue(
      url: downloadUrl,
      savedDir: savePath,
      showNotification: true,
      openFileFromNotification: true,
    );
  }
}
