import 'dart:io';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:zhacpai/provider/app_data_provider.dart';
import 'package:zhacpai/routers/application.dart';
import 'package:zhacpai/routers/routers.dart';
import 'package:zhacpai/util/log_utils.dart';

import 'home/splash_page.dart';

void main() {
  runApp(MyApp());
  // 透明状态栏
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle =
    SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
}
class MyApp extends StatelessWidget {

  final Widget home;

  MyApp({this.home}){
    Log.init();
    final router = Router();
    Routes.configureRoutes(router);
    Application.router = router;
  }

  @override
  Widget build(BuildContext context) {
    return OKToast(
        child: ChangeNotifierProvider<AppDataProvider>(
          create: (_) => AppDataProvider(),
          child: Consumer<AppDataProvider>(
            builder: (_, provider, __) {
              return MaterialApp(
                  title: 'Flutter Deer',
//              showPerformanceOverlay: true, //显示性能标签
//              debugShowCheckedModeBanner: false,
//              checkerboardRasterCacheImages: true,
//              showSemanticsDebugger: true, // 显示语义视图
                  theme: provider.getTheme(),
                  darkTheme: provider.getTheme(),
                  home: home ?? SplashPage(),
                  onGenerateRoute: Application.router.generator,
                  localizationsDelegates: const [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: const [
                    Locale('zh', 'CH'),
                    Locale('en', 'US')
                  ]
              );
            },
          ),
        ),
        /// Toast 配置
        backgroundColor: Colors.black54,
        textPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        radius: 20.0,
        position: ToastPosition.bottom
    );
  }


}
