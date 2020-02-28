import 'package:zhacpai/first/models/article_entity.dart';
import 'package:zhacpai/first/page/recommend.dart';
import 'package:zhacpai/mvp/base_page_presenter.dart';
import 'package:zhacpai/net/dio_utils.dart';
import 'package:zhacpai/net/http_api.dart';

class RecommendPresenter extends BasePagePresenter<RecommendPageState> {
  Future getLastArticles(ArticleType type, int page, bool isShowDialog) async {

    Map<String, String> params = Map();
    params['p']=page.toString();

    String url=HttpApi.lastArticles;

    switch(type){
      case ArticleType.good:
        url='/good';
        break;
      case ArticleType.perfect:
        url='/perfect';
        break;
      case ArticleType.reply:
        url='/reply';
        break;
      case ArticleType.hot:
        url='/hot';
        break;
      case ArticleType.none:
        break;
    }
    await requestNetwork<ArticleEntity>(Method.get, url: url,
      queryParameters: params,
      isShow: isShowDialog,
      onSuccess: (data){


      },
        onError: (_, __) {
          /// 加载失败

        }
    );


  }
}

enum ArticleType { perfect, reply, good, hot,none }


