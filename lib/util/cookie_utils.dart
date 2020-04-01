
import 'package:flustars/flustars.dart';
import 'package:zhacpai/common/common.dart';

import 'log_utils.dart';

Map<String, String> getCookieMap() {
  var token=SpUtil.getString(Constant.accessToken);
  Map<String, String> headersMap = {
    'Cookie' : 'symphony='+token+';',
    'Referer':'localhost'
  };
  Log.e(headersMap.toString(),tag: 'token:');

  return headersMap;
}