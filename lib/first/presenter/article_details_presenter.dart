import 'package:zhacpai/first/models/article_details_entity.dart';
import 'package:zhacpai/first/models/article_details_model.dart';
import 'package:zhacpai/first/page/article_details_page.dart';
import 'package:zhacpai/mvp/base_page_presenter.dart';

class ArticleDetailsPresenter extends BasePagePresenter<ArticleDetailState> {
  ArticleDetailsModel articleDetailsModel = ArticleDetailsModel();

  getRefreshArticleDetails(String articleId) async {
    ArticleDetailsEntity entity =
        await articleDetailsModel.getArticleDetailsData(articleId.replaceAll('[', "").replaceAll(']', ''));
    view.provider.entity=entity;


  }
}
