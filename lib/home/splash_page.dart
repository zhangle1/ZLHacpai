

import 'dart:async';

import 'package:flustars/flustars.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:zhacpai/common/common.dart';
import 'package:zhacpai/login/login_router.dart';
import 'package:zhacpai/provider/app_data_provider.dart';
import 'package:zhacpai/res/styles.dart';
import 'package:zhacpai/routers/fluro_navigator.dart';
import 'package:zhacpai/util/image_utils.dart';
import 'package:zhacpai/util/theme_utils.dart';
import 'package:zhacpai/widgets/load_image.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}




class _SplashPageState extends State<SplashPage> {

  int _status = 0;
  List<String> _guideList = ['app_start_1', 'app_start_2', 'app_start_3'];
  StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await SpUtil.getInstance();
      // 由于SpUtil未初始化，所以MaterialApp获取的为默认主题配置，这里同步一下。
      Provider.of<AppDataProvider>(context, listen: false).syncAppData();
      if (SpUtil.getBool(Constant.keyGuide, defValue: true)) {
        /// 预先缓存图片，避免直接使用时因为首次加载造成闪动
        _guideList.forEach((image) {
          precacheImage(ImageUtils.getAssetImage(image), context);
        });
      }
      _initSplash();
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  void _initGuide() {
    setState(() {
      _status = 1;
    });
  }

  void _initSplash() {
    _subscription = Observable.just(1).delay(Duration(milliseconds: 1500)).listen((_) {
      if (SpUtil.getBool(Constant.keyGuide, defValue: true)) {
        SpUtil.putBool(Constant.keyGuide, false);
        _initGuide();
      } else {
        _goLogin();
      }
    });
  }

  _goLogin() {
    NavigatorUtils.push(context, LoginRouter.loginPage, replace: true);
  }
//
  @override
  Widget build(BuildContext context) {
    return Material(
        color: ThemeUtils.getBackgroundColor(context),
        child:  FractionallyAlignedSizedBox(
            heightFactor: 0.3,
            widthFactor: 0.33,
            leftFactor: 0.33,
            bottomFactor: 0,
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  LoadSVGAssetImage('logo',width: 80,height: 80)
                  ,
                  const Text(
                    '黑客派',
                    style: TextStyles.textBold26,
                  )
                  ]
            )



        )
    );
  }
}