import 'dart:convert';

import 'package:flustars/flustars.dart';
import 'package:zhacpai/common/common.dart';
import 'package:zhacpai/first/models/my_follow_people_entity.dart';
import 'package:zhacpai/first/models/user_article_entity.dart';
import 'package:zhacpai/first/page/follow_page.dart';
import 'package:zhacpai/mvp/base_page_presenter.dart';
import 'package:zhacpai/net/dio_utils.dart';
import 'package:zhacpai/net/http_api.dart';

class FollowPresenter extends BasePagePresenter<FollowPageState> {
  Future getFollowRefdreshData(
      int page, MyFollowItemHandler handler, bool isShowDialog) async {
    var userName = SpUtil.getString(Constant.userName, defValue: '');
    Map<String, String> params = Map();
    params['p'] = '1';

    var myFollowPeopleMyResponse =await DioUtils.instance.getDio().get(
        '${HttpApi.users + userName + HttpApi.suffixMyFollowPeople}',
        queryParameters: params);
    MyFollowPeopleEntity peopleEntity = MyFollowPeopleEntity.fromJson(
        json.decode(myFollowPeopleMyResponse.toString()));

    var header = MyFollowItemModel(MyFollowType.MyFollowHeader,
        myFollowPeopleEntity: peopleEntity);
    var itemList = List<MyFollowItemModel>();
    itemList.add(header);

    handler.setMyFollowPeopleEntity(peopleEntity);

    while(handler.canLoop()){
      MyFollowPeopleRecord randomRecord= handler.loadNameRandom();
      Map<String, String> params1 = Map();
      params1['p'] =randomRecord.currentPage.toString();
      var userArticlesResponse =await DioUtils.instance.getDio().get(
          '${HttpApi.users + randomRecord.userName + HttpApi.suffixUserArticles}',
          queryParameters: params1);
      UserArticlesEntity userArticlesEntity = UserArticlesEntity.fromJson(
          json.decode(userArticlesResponse.toString()));
      if(userArticlesEntity.data.articles.length==0){
        handler.removeName(randomRecord.userName);
      }else{
        handler.addCount(userArticlesEntity.data.articles.length);
        for (var articlesItem in userArticlesEntity.data.articles) {
          itemList.add(MyFollowItemModel(MyFollowType.MyFollowItem,userArticles: articlesItem));
        }
      }
    }
    handler.increaseCurrentPage();

    view.provider.addAll(itemList);
    view.provider.setHasMore(handler.canMore());



  }

   Future getLoadMoreFreshData(int page, MyFollowItemHandler handler, bool isShowDialog) async {

     var itemList = List<MyFollowItemModel>();
     Map<String, String> params = Map();


     while(handler.canLoop()){
       MyFollowPeopleRecord randomRecord= handler.loadNameRandom();
       Map<String, String> params1 = Map();
       params1['p'] =randomRecord.currentPage.toString();
       var userArticlesResponse =await DioUtils.instance.getDio().get(
           '${HttpApi.users + randomRecord.userName + HttpApi.suffixUserArticles}',
           queryParameters: params1);
       UserArticlesEntity userArticlesEntity = UserArticlesEntity.fromJson(
           json.decode(userArticlesResponse.toString()));
       if(userArticlesEntity.data.articles.length==0){
         handler.removeName(randomRecord.userName);
       }else{
         handler.addCount(userArticlesEntity.data.articles.length);
         for (var articlesItem in userArticlesEntity.data.articles) {
           itemList.add(MyFollowItemModel(MyFollowType.MyFollowItem,userArticles: articlesItem));
         }
       }
     }
     handler.increaseCurrentPage();

     view.provider.addAll(itemList);
     view.provider.setHasMore(handler.canMore());
   }
}
