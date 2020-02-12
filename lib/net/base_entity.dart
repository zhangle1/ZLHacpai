



import 'package:zhacpai/common/common.dart';
import 'package:zhacpai/entity_factory.dart';

class BaseEntity<T>{

  int sc;
  String msg;
  String userName;
  String token;
  T data;
  List<T> listData = [];

  BaseEntity(this.sc, this.msg, this.userName,this.token,this.data);

  BaseEntity.fromJson(Map<String, dynamic> json) {
    sc = json[Constant.sc];
    msg = json[Constant.msg];
    if (json.containsKey(Constant.data)) {
      if (json[Constant.data] is List) {
        (json[Constant.data] as List).forEach((item) {
          listData.add(_generateOBJ<T>(item));
        });
      } else {
        data = _generateOBJ(json[Constant.data]);
      }
    }
  }

  S _generateOBJ<S>(json) {
    if (S.toString() == 'String') {
      return json.toString() as S;
    } else if (T.toString() == 'Map<dynamic, dynamic>') {
      return json as S;
    } else {
      return EntityFactory.generateOBJ(json);
    }
  }
}