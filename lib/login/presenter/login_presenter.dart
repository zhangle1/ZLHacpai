

import 'package:dio/dio.dart';
import 'package:zhacpai/login/models/LoginEntity.dart';
import 'package:zhacpai/login/page/login_page.dart';
import 'package:zhacpai/mvp/base_page_presenter.dart';
import 'package:zhacpai/net/dio_utils.dart';
import 'package:zhacpai/net/http_api.dart';
import 'package:zhacpai/routers/fluro_navigator.dart';
import 'package:zhacpai/util/encryption_utils.dart';
import 'package:zhacpai/util/log_utils.dart';

class LoginPagePresenter extends BasePagePresenter<LoginPageState>{



  Future login(String userName,String password) async{


    Map<String, String> params = Map();
    params['userName'] = userName;
    params['userPassword'] = EncryptionUtils.generateMd5(password);
    Log.e("LoginPagePresenter password md5:"+params['userPassword']);


    await requestNetwork<String>(Method.post,
        url: HttpApi.login,
        params:  {'userName':userName,'userPassword':EncryptionUtils.generateMd5(password)},
        isShow: true,
        onSuccess: (data) {
          view.goHomePage();
        },
        onError: (_, __) {
        }
    );





  }











}