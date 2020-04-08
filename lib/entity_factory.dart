

//else if (T.toString() == 'SearchEntity') {
//return SearchEntity.fromJson(json) as T;
//} else if (T.toString() == 'UserEntity') {
//return UserEntity.fromJson(json) as T;
//}
import 'package:zhacpai/channel/model/domain_articles_entity.dart';
import 'package:zhacpai/channel/model/tag_articles_entity.dart';

import 'first/models/article_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else  if(T.toString()=='ArticleEntity'){
      return ArticleEntity.fromJson(json) as T;
    }else if(T.toString()=='DomainArticlesEntity'){
      return DomainArticlesEntity.fromJson(json) as T;
    }else if(T.toString()=='TagArticlesEntity'){
      return TagArticlesEntity.fromJson(json) as T;
    }else{
      return null;
    }
  }
}