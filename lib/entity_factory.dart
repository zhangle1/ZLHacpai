

//else if (T.toString() == 'SearchEntity') {
//return SearchEntity.fromJson(json) as T;
//} else if (T.toString() == 'UserEntity') {
//return UserEntity.fromJson(json) as T;
//}
import 'first/models/article_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else  if(T.toString()=='ArticleEntity'){
      return ArticleEntity.fromJson(json) as T;
    }else{
      return null;
    }
  }
}