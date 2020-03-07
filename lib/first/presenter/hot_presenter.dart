

import 'package:zhacpai/first/models/article_entity.dart';
import 'package:zhacpai/first/page/hot_page.dart';
import 'package:zhacpai/first/presenter/recommend_presenter.dart';
import 'package:zhacpai/mvp/base_page_presenter.dart';
import 'package:zhacpai/net/dio_utils.dart';
import 'package:zhacpai/net/http_api.dart';
import 'package:zhacpai/widgets/state_layout.dart';

class HotPresenter  extends BasePagePresenter<HotPageState>{

    Future getHotArticles(ArticleType type, int page, bool isShowDialog) async{

      Map<String, String> params = Map();
      params['p']=page.toString();
      String url=HttpApi.lastArticles;

      switch(type){
        case ArticleType.good:
          url=url+'/good';
          break;
        case ArticleType.perfect:
          url=url+'/perfect';
          break;
        case ArticleType.reply:
          url=url+'/reply';
          break;
        case ArticleType.hot:
          url=url+'/hot';
          break;
        case ArticleType.none:
          break;
      }
      await requestNetwork<ArticleEntity>(Method.get, url: url,
          queryParameters: params,
          isShow: isShowDialog,
          onSuccess: (data){
            if (data != null) {

              data.articles= data.articles.take(10);
              view.provider.setHasMore(false);
              if (page == 1) {
                /// 刷新
                view.provider.list.clear();
                if (data.articles.isEmpty) {
                  view.provider.setStateType(StateType.empty);
                } else {
                  view.provider.addAll(data.articles);
                }
              } else {
                view.provider.addAll(data.articles);
              }
            } else {
              /// 加载失败
              view.provider.setHasMore(false);
              view.provider.setStateType(StateType.network);
            }
          },
          onError: (_, __) {
            /// 加载失败

          }
      );

    }




}