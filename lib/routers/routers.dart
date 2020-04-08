import 'package:common_utils/common_utils.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:zhacpai/channel/page/domain_page.dart';
import 'package:zhacpai/first/page/article_details_page.dart';
import 'package:zhacpai/home/home_page.dart';
import 'package:zhacpai/login/login_router.dart';
import 'package:zhacpai/routers/router_init.dart';

import '404.dart';

class Routes {

  static String home = '/home';
  static String webViewPage = '/webview';


  static String articleDetails='/articleDetails';


  static String domainArticles='/domainArticles';

  static List<IRouterProvider> _listRouter = [];


  static void configureRoutes(Router router){
    /// 指定路由跳转错误返回页
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
          debugPrint('未找到目标页');
          return WidgetNotFound();
        });

    router.define(home, handler: Handler(
        handlerFunc: (BuildContext context, Map<String, List<String>> params) => Home()));
    router.define(articleDetails, handler: Handler(handlerFunc: (_,params){
      String articleId=  params['articleId'].first.toString();
      String nickName=params['nickName'].first.toString()??'';
      String image=Uri.decodeComponent((params['image'].toString().replaceAll('[', '').replaceAll(']', '')??''));

      return ArticleDetailsPage(articleId: articleId,  nickName:nickName,image: image,);
    }));


    router.define(domainArticles, handler: Handler(handlerFunc:(_,params){
      String domainLabel=params['domainLabel'].first.toString();

      return DoMainPage(domainLabel:domainLabel);
    } ));


//    router.define(webViewPage, handler: Handler(handlerFunc: (_, params) {
//      String title = params['title']?.first;
//      String url = params['url']?.first;
//      return WebViewPage(title: title, url: url);
//    }));

    _listRouter.clear();

    _listRouter.add(LoginRouter());

    /// 初始化路由
    _listRouter.forEach((routerProvider) {
      routerProvider.initRouter(router);
    });


  }


}
