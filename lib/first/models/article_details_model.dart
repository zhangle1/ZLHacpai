

import 'dart:convert';

import 'package:zhacpai/first/models/article_details_entity.dart';
import 'package:zhacpai/net/dio_utils.dart';
import 'package:zhacpai/net/http_api.dart';

class ArticleDetailsModel{



Future  getArticleDetailsData(String articleId) async{

  Map<String, String> params = Map();
  params['p'] = '1';
  var response=await DioUtils.instance.getDio().get(
      HttpApi.articleDetails+articleId,
      queryParameters: params);
  if(response.statusCode==200) {
    ArticleDetailsEntity entity = ArticleDetailsEntity.fromJson(json.decode(response.data.toString()));
    return Future.value(entity);
  }else{
    return   Future.error("其他错误");
  }



  }

}