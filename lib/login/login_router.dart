

import 'package:fluro/fluro.dart';
import 'package:zhacpai/login/page/login_page.dart';
import 'package:zhacpai/routers/router_init.dart';

class LoginRouter implements IRouterProvider{

  static String loginPage = '/login';

  @override
  void initRouter(Router router) {
    router.define(loginPage, handler: Handler(handlerFunc: (_, params) => LoginPage()));

  }





}