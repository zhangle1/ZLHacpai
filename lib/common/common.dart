class Constant{

  /// debug开关，上线需要关闭
  /// App运行在Release环境时，inProduction为true；当App运行在Debug和Profile环境时，inProduction为false
  static const bool inProduction  = const bool.fromEnvironment('dart.vm.product');

  static bool isTest  = false;

  static const String accessToken = 'accessToken';




  static const String userName='userName';
  static const String userPassword='userPassword';

  //
  static const String userData="userData";

  static const String data = 'data';
  static const String msg = 'msg';
  static const String sc = 'sc';

  static const String keyGuide = 'keyGuide';
  static const String phone = 'phone';



  static const String theme = 'AppTheme';


}