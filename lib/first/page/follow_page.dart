import 'dart:collection';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zhacpai/first/models/my_follow_people_entity.dart';
import 'package:zhacpai/first/models/user_article_entity.dart';
import 'package:zhacpai/first/presenter/FollowPresenter.dart';
import 'package:zhacpai/first/provider/base_list_provider.dart';
import 'package:zhacpai/mvp/base_page_state.dart';
import 'package:zhacpai/res/colors.dart';
import 'package:zhacpai/res/gaps.dart';
import 'package:zhacpai/routers/fluro_navigator.dart';
import 'package:zhacpai/routers/routers.dart';
import 'package:zhacpai/util/cookie_utils.dart';
import 'package:zhacpai/util/log_utils.dart';
import 'package:zhacpai/widgets/my_refresh_list.dart';
import 'package:zhacpai/widgets/state_layout.dart';

class FollowPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FollowPageState();
  }
}

class FollowPageState extends BasePageState<FollowPage, FollowPresenter>
    with AutomaticKeepAliveClientMixin<FollowPage>
{
  int _page = 1;
  BaseListProvider<MyFollowItemModel> provider =
      BaseListProvider<MyFollowItemModel>();
  MyFollowItemHandler myFollowItemHandler ;

  @override
  void initState() {
    provider.setStateTypeNotNotify(StateType.loading);
    super.initState();
    _onRefresh();
  }

  Future _onRefresh() async {
    _page = 1;
    myFollowItemHandler= MyFollowItemHandler();
    await presenter.getFollowRefdreshData(_page, myFollowItemHandler, false);
  }

  Future _loadMore() async {
    _page++;
    await presenter.getLoadMoreFreshData(_page, myFollowItemHandler, false);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider<BaseListProvider<MyFollowItemModel>>(
      create: (_) => provider,
      child: Consumer<BaseListProvider<MyFollowItemModel>>(
        builder: (_, provider, __) {
          return DeerListView(
            key: Key('my_follow'),
            itemCount: provider.list.length,
            stateType: provider.stateType,
            onRefresh: _onRefresh,
            loadMore: _loadMore,
            itemExtent: null,
            hasMore: provider.hasMore,
            itemBuilder: (_, index) {
              if (index == 0) {
                return headerWidget(provider.list[index]);
              } else {
                return commonCard(provider.list[index]);
              }
            },
          );
        },
      ),
    );
  }

  @override
  FollowPresenter createPresenter() {
    return FollowPresenter();
  }

  Widget headerWidget(MyFollowItemModel list) {
    var map = getCookieMap();
    final widgets = <Widget>[];
    for (var user in list.myFollowPeopleEntity.data.users) {
      var item = Container(
        margin: const EdgeInsets.only(left: 12.0, right: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new CircleAvatar(
              backgroundImage:
                  new NetworkImage(user.userAvatarURL96, headers: map),
              radius: 22,
            ),
            Gaps.vGap4,
            Container(
              width: 50,
              child: Text(
                user.userName,
                maxLines: 1,
                style: TextStyle(color: Colours.dark_bg_color, height: 1),
              ),
            ),
          ],
        ),
      );
      widgets.add(item);
    }

    return Container(
      color: Colours.searchBackgroundColor,
      padding: const EdgeInsets.only(top: 12, bottom: 6.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(left: 12),
              child: Text(

                '我的关注',
                style: TextStyle(height: 1.3,color: Colours.dark_text_gray),
              ),
            ),
            Gaps.vGap5,
            Row(children: widgets),
          ],
        )
      ),
    );
  }


  Widget commonCard(MyFollowItemModel list) {
    Widget markWidget;
    var map = getCookieMap();
    var article= list.userArticles;
    Log.e(article.articleImg1URL.toString(),tag: 'img');
    if (article.articleImg1URL == null||article.articleImg1URL.isEmpty) {
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
                        image: NetworkImage(article.articleImg1URL,headers: map),
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
      padding: const EdgeInsets.only(bottom: 12.0),
      margin: const EdgeInsets.only(bottom: 12.0),
      child: FlatButton(
        onPressed: () {
          NavigatorUtils.push(
              context,
              '${Routes.articleDetails}?articleId=${article.oId}&nickName=${Uri.encodeComponent(article.articleAuthor.userNickname)}&image=${Uri.encodeComponent(article.articleAuthorThumbnailURL96)}');
        },
        child: new Column(
          children: <Widget>[
            new Container(
              child: new Row(
                children: <Widget>[
                  new CircleAvatar(
                    backgroundImage:
                    new NetworkImage(article.articleAuthorThumbnailURL96,headers: map),
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
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

}

class MyFollowItemModel {
  final MyFollowType type;
  final MyFollowPeopleEntity myFollowPeopleEntity;
  final Articles userArticles;

  MyFollowItemModel(this.type, {this.myFollowPeopleEntity, this.userArticles});
}

class MyFollowItemHandler {
  MyFollowPeopleEntity peopleEntity;

  Map<String, MyFollowPeopleRecord> map =
      HashMap<String, MyFollowPeopleRecord>();
  List<String> randomList = new List();

  int currentPage = 0;
  int pageSize = 20;

  int count = 0;

  bool hasMore = true;

//
  void setMyFollowPeopleEntity(MyFollowPeopleEntity peopleEntity) {
    map.clear();

    this.peopleEntity = peopleEntity;
    var users = peopleEntity.data.users;
    for (var item in users) {
      map[item.userName] = MyFollowPeopleRecord(item.userName, 0);
    }
  }

  bool canLoop() {
    return hasMore && (count < (pageSize * currentPage + pageSize));
  }

  bool canMore() {
    return hasMore;
  }

  MyFollowPeopleRecord loadNameRandom() {
    var randomKey = map.keys.elementAt(new Random().nextInt(map.length));
    MyFollowPeopleRecord item = map[randomKey];
    item.currentPage += 1;
    return item;
  }

  void removeName(String userName) {
    map.remove(userName);
    hasMore = map.length != 0;
  }

  void addCount(int c) {
    count += c;
  }

  void increaseCurrentPage() {
    currentPage += 1;
  }
}

class MyFollowPeopleRecord {
  final String userName;
  int currentPage;
  bool isMore = true;

  MyFollowPeopleRecord(this.userName, this.currentPage);
}

enum MyFollowType { MyFollowHeader, MyFollowItem }
