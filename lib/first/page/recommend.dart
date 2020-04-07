import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zhacpai/first/models/article_entity.dart';
import 'package:zhacpai/first/presenter/recommend_presenter.dart';
import 'package:zhacpai/first/provider/base_list_provider.dart';
import 'package:zhacpai/mvp/base_page_state.dart';
import 'package:zhacpai/res/colors.dart';
import 'package:zhacpai/routers/fluro_navigator.dart';
import 'package:zhacpai/routers/routers.dart';
import 'package:zhacpai/util/cookie_utils.dart';
import 'package:zhacpai/util/log_utils.dart';
import 'package:zhacpai/widgets/my_refresh_list.dart';
import 'package:zhacpai/widgets/state_layout.dart';

class RecommendPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RecommendPageState();
  }
}

class RecommendPageState
    extends BasePageState<RecommendPage, RecommendPresenter>  with AutomaticKeepAliveClientMixin<RecommendPage> {
  int _page = 1;
  BaseListProvider<Articles> provider = BaseListProvider<Articles>();

  @override
  void initState() {
    provider.setStateTypeNotNotify(StateType.loading);
    super.initState();
    _onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider<BaseListProvider<Articles>>(
      create: (_) => provider,
      child: Consumer<BaseListProvider<Articles>>(
        builder: (_, provider, __) {
          return DeerListView(
            key: Key('recommend'),
            itemCount: provider.list.length,
            stateType: provider.stateType,
            onRefresh: _onRefresh,
            loadMore: _loadMore,
            itemExtent: null,
            hasMore: provider.hasMore,
            itemBuilder: (_, index) {
              return commonCard(provider.list[index]);
            },
          );
        },
      ),
    );
  }

  Future _onRefresh() async {
    _page = 1;
    await presenter.getLastArticles(ArticleType.perfect, _page, false);
  }

  Future _loadMore() async {
    _page++;
    await presenter.getLastArticles(ArticleType.perfect, _page, false);
  }

//  padding: const EdgeInsets.only(top: 10.0),
//  ),

  @override
  createPresenter() {
    return RecommendPresenter();
  }

  Widget commonCard(Articles article) {
    Widget markWidget;
    var map = getCookieMap();

    Log.e(article.articleImg1URL.toString(), tag: 'img');
    if (article.articleImg1URL == null || article.articleImg1URL.isEmpty) {
      markWidget = new Text(
        article.articlePreviewContent.replaceAll("[图片]", ""),
        maxLines: 3,
        style: TextStyle(color: Colours.dark_text_gray, height: 1.3),
      );
    } else {
      markWidget = new Row(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              child: Text(
                article.articlePreviewContent.replaceAll("[图片]", ""),
                maxLines: 3,
                style: TextStyle(color: Colours.dark_text_gray, height: 1.3),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: AspectRatio(
              aspectRatio: 3.0 / 2.0,
              child: Container(
                foregroundDecoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            NetworkImage(article.articleImg1URL, headers: map),
                        centerSlice:
                            Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0)),
                    borderRadius:
                        const BorderRadius.all(const Radius.circular(6.0))),
              ),
            ),
          )
        ],
      );
    }

    return new Container(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 16.0),
      padding: const EdgeInsets.only(bottom: 12.0),
      child: FlatButton(
        onPressed: () {
          NavigatorUtils.push(
              context,
              '${Routes.articleDetails}?articleId=${article.oId}&nickName=${Uri.encodeComponent(article.articleAuthor.userNickname)}&image=${Uri.encodeComponent(article.articleAuthorThumbnailURL96)}');
        },
//          &nickName=${article.articleAuthor.userNickname}
//
        child: new Column(
          children: <Widget>[
            new Container(
              child: new Row(
                children: <Widget>[
                  new CircleAvatar(
                    backgroundImage: new NetworkImage(
                        article.articleAuthorThumbnailURL96,
                        headers: map),
                    radius: 16,
                  ),
                  new Text(
                      "  " +
                          article.articleAuthor.userNickname +
                          " 发布了" +
                          " · " +
                          article.timeAgo,
                      style: new TextStyle(color: Colours.dark_text_gray))
                ],
              ),
              padding: const EdgeInsets.only(top: 10.0),
            ),
            new Container(
                child: new Text(article.articleTitle,
                    style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        height: 1.3,
                        color: Colors.black)),
                margin: new EdgeInsets.only(top: 6.0, bottom: 2.0),
                alignment: Alignment.topLeft),
            new Container(
                child: markWidget,
                margin: new EdgeInsets.only(top: 6.0),
                alignment: Alignment.topLeft),
            new Container(
              child: new Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      article.articleThankCnt.toString() +
                          " 感谢 · " +
                          article.articleCommentCount.toString() +
                          '评论',
                      style: TextStyle(color: Colours.dark_text_gray),
                    ),
                  )
                ],
              ),
              padding: const EdgeInsets.only(),
            )
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
