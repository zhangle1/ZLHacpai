import 'dart:convert';

import 'package:flustars/flustars.dart';
import 'package:zhacpai/common/common.dart';
import 'package:zhacpai/my/model/my_detail_info_entity.dart';
import 'package:zhacpai/my/model/my_unread_notify_entity.dart';
import 'package:zhacpai/net/dio_utils.dart';
import 'package:zhacpai/net/http_api.dart';

class MyModel {
  Future getMyDetailInfoAsync() async {
    var userName = SpUtil.getString(Constant.userName, defValue: '');

    var response = await DioUtils.instance.getDio().get(
          HttpApi.myDetailInfo + '/' + userName,
        );
    if (response.statusCode == 200) {
      MyDetailInfoEntity entity =
          MyDetailInfoEntity.fromJson(json.decode(response.data.toString()));
      return Future.value(entity);
    } else {
      return Future.error("其他错误");
    }
  }


  Future getMyUnreadNotifyAsync() async{

    var response = await DioUtils.instance.getDio().get(
      HttpApi.myUnread,
    );
    if (response.statusCode == 200) {
      MyUnreadNotifyEntity entity =
      MyUnreadNotifyEntity.fromJson(json.decode(response.data.toString()));
      return Future.value(entity);
    } else {
      return Future.error("其他错误");
    }

  }
}
