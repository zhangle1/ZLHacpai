import 'dart:convert';

import 'package:zhacpai/channel/model/domain_list_entity.dart';
import 'package:zhacpai/channel/model/tags_list_entity.dart';
import 'package:zhacpai/net/dio_utils.dart';
import 'package:zhacpai/net/http_api.dart';

class ChannelModel {
  Future getDomainModelAsync() async {
    Map<String, String> params = Map();
    params['p'] = '1';
   var response=await DioUtils.instance.getDio().get(
        HttpApi.doMainList,
        queryParameters: params);
        if(response.statusCode==200) {
          DoMainListEntity entity = DoMainListEntity.fromJson(json.decode(response.data.toString()));
         return Future.value(entity);
        }else{
          return   Future.error("其他错误");
        }
  }


  Future  getTagsModelAsync(String page) async{
    Map<String, String> params = Map();
    params['p'] = page;
    var response =await DioUtils.instance.getDio().get(
      HttpApi.tagsList,
      queryParameters: params
    );
    if(response.statusCode==200) {
      TagsListEntity entity = TagsListEntity.fromJson(json.decode(response.data.toString()));
      return  Future.value(entity);
    }else{
      return  Future.error("其他错误");
    }

  }

}
