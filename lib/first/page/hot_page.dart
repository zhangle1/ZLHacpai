import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zhacpai/first/models/article_entity.dart';
import 'package:zhacpai/first/presenter/hot_presenter.dart';
import 'package:zhacpai/first/presenter/recommend_presenter.dart';
import 'package:zhacpai/first/provider/base_list_provider.dart';
import 'package:zhacpai/mvp/base_page_state.dart';
import 'package:zhacpai/res/colors.dart';
import 'package:zhacpai/routers/fluro_navigator.dart';
import 'package:zhacpai/routers/routers.dart';
import 'package:zhacpai/widgets/my_refresh_list.dart';
import 'package:zhacpai/widgets/state_layout.dart';

class HotPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HotPageState();
  }
}

class HotPageState extends BasePageState<HotPage, HotPresenter>    with AutomaticKeepAliveClientMixin<HotPage>{
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
            key: Key('hot'),
            itemCount: provider.list.length ,
            stateType: provider.stateType,
            onRefresh: _onRefresh,
            itemExtent: null,
            hasMore: provider.hasMore,
            itemBuilder: (_, index) {
              return index == 0
                  ? Container(
                      width: double.infinity,
                      height: 10,
                      color: Colours.searchBackgroundColor,
                    )
                  : hotCard(provider.list[index ], index);
            },
          );
        },
      ),
    );
  }

  @override
  HotPresenter createPresenter() {
    return new HotPresenter();
  }

  Future _onRefresh() async {
    _page = 1;
    await presenter.getHotArticles(ArticleType.hot, _page, false);
  }

  Widget hotCard(Articles article, int index) {
    return Container(
      decoration: new BoxDecoration(
          color: Colors.white,
          border: new BorderDirectional(
              bottom: new BorderSide(
                  color: Colours.searchBackgroundColor, width: 1.0))),
      child: FlatButton(
        onPressed: () {

          NavigatorUtils.push(
              context,
              '${Routes.articleDetails}?articleId=${article.oId}&nickName=${Uri.encodeComponent(article.articleAuthor.userNickname)}&image=${Uri.encodeComponent(article.articleAuthorThumbnailURL96)}');
        },
        child: Container(
          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Text(
                  index.toString(),
                  style: TextStyle(
                      color:
                          index.compareTo(3) <= 0 ? Colors.red : Colors.yellow,
                      fontSize: 18.0),
                ),
              ),
              Expanded(
                  flex: 6,
                  child: SizedBox(
                    width: double.infinity,
                    child: new Text(
                      article.articleTitle,
                      textAlign: TextAlign.left,
                      style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          height: 1.1,
                          color: Colors.black),
                    ),
                  )),
            ],
          ),
          alignment: Alignment.centerLeft,
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
