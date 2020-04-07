import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:zhacpai/first/presenter/article_details_presenter.dart';
import 'package:zhacpai/first/provider/article_details_provider.dart';
import 'package:zhacpai/mvp/base_page_state.dart';
import 'package:zhacpai/net/http_api.dart';
import 'package:zhacpai/res/colors.dart';
import 'package:zhacpai/res/gaps.dart';
import 'package:zhacpai/res/styles.dart';
import 'package:zhacpai/routers/fluro_navigator.dart';
import 'package:zhacpai/widgets/load_image.dart';
import 'package:zhacpai/widgets/state_layout.dart';

class ArticleDetailsPage extends StatefulWidget {
  final String articleId;
  final String nickName;
  final String image;

  const ArticleDetailsPage(
      {this.articleId: '', this.nickName , this.image = ''});

  @override
  State<StatefulWidget> createState() {
    return ArticleDetailState();
  }
}

class ArticleDetailState
    extends BasePageState<ArticleDetailsPage, ArticleDetailsPresenter> {
  ArticleDetailsProvider provider = ArticleDetailsProvider();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ArticleDetailsProvider>(
        create: (_) => provider,
        child: Consumer<ArticleDetailsProvider>(builder: (_, provider, __) {
          return provider.entity == null
              ? Container(
                  color: Colors.white,
                  child: StateLayout(type: provider.stateType),
                )
              : Scaffold(
                  appBar: new AppBar(
                    iconTheme: IconThemeData(color: Colours.text),
                    backgroundColor: Colors.white,
                    title: Text(
                      provider.entity.data.article.articleTitle,
                      style: TextStyle(color: Colours.text, fontSize: 20),
                    ),
                    centerTitle: true,
                    actions: <Widget>[
//          new IconButton(icon: new Icon(Icons.more_vert), onPressed: () {}),
                      new PopupMenuButton(
                          padding: const EdgeInsets.all(0.0),
                          onSelected: _onPopSelected,
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuItem<String>>[
                                new PopupMenuItem<String>(
                                    value: "browser",
                                    child: ListTile(
                                        contentPadding: EdgeInsets.all(0.0),
                                        dense: false,
                                        title: new Container(
                                          alignment: Alignment.center,
                                          child: new Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.language,
                                                color: Colours.text,
                                                size: 22.0,
                                              ),
                                              Gaps.hGap10,
                                              Text(
                                                '浏览器打开',
                                                style: TextStyles.listContent,
                                              )
                                            ],
                                          ),
                                        ))),
                                new PopupMenuItem<String>(
                                    value: "share",
                                    child: ListTile(
                                        contentPadding: EdgeInsets.all(0.0),
                                        dense: false,
                                        title: new Container(
                                          alignment: Alignment.center,
                                          child: new Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.share,
                                                color: Colours.text,
                                                size: 22.0,
                                              ),
                                              Gaps.hGap10,
                                              Text(
                                                '分享',
                                                style: TextStyles.listContent,
                                              )
                                            ],
                                          ),
                                        ))),
                              ])
                    ],
                  ),
                  body: Stack(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Flexible(
                            child: SingleChildScrollView(
                              padding: EdgeInsets.only(top: 56,bottom: 56),
                              child: Html(
                                data:
                                    provider.entity.data.article.articleContent,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: 56,
                          padding: EdgeInsets.symmetric(vertical: 12,horizontal: 16),
                          color: Colors.white,
                          child: Row(
                            children: <Widget>[
                              new CircleAvatar(
                                backgroundImage: new NetworkImage(widget.image),
                                radius: 16,
                              ),
                              new Text("  " + widget.nickName,
                                  style: new TextStyle(
                                      color: Colours.dark_text_gray)),
                              Spacer(),
                              Container(
                                padding: EdgeInsets.symmetric(vertical: 8,horizontal: 12.0),
                                child:  Text('关注',style: TextStyle(color: Colours.app_main),),
                                  decoration: new BoxDecoration(
                                    borderRadius: const BorderRadius.all(const Radius.circular(6.0)),
                                    color: Colours.searchBackgroundColor,

                                  )
                              )

                            ],
                          ),
                        ),
                      ),

                      Positioned(

                          child: Align(
                            alignment: FractionalOffset.bottomLeft,
                            child: Container(
                              color: Colors.white,
                              height: 56,
                                child:Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Spacer(),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        LoadSVGAssetImage('ic_liulang',width: 24,height: 24),
                                        const Text(
                                          '浏览',
                                          style: TextStyle(color: Colours.dark_text),
                                        )
                                      ],
                                    ),
                                    Gaps.hGap16,
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        LoadSVGAssetImage('ic_pinglun',width: 24,height: 24)
                                        ,
                                        const Text(
                                          '评论',
                                          style: TextStyle(color: Colours.dark_text),
                                        )
                                      ],
                                    ),
                                    Gaps.hGap16,

                                  ],
                                )
                            ),
                          ),
                      )
                    ],
                  ));
        }));
  }

//  Stack(
//  children: <Widget>[
//
//  Align(
//  child:
//  Column(children: <Widget>[
//  Flexible(
//  child: SingleChildScrollView(
//  child: Html(
//  data: provider.entity.data.article.articleContent,
//  ),
//  ),
//  ),
//
//  ],),
//
//  ),
//
//  Align(
//  alignment: Alignment.topLeft,
//  child:)
//  ],
//  ),

  void _onPopSelected(String value) {
    var itemArticle = provider.entity.data.article;
    switch (value) {
      case "browser":
        NavigatorUtils.launchInBrowser(
          HttpApi.baseUrl +
              HttpApi.articleDetails +
              widget.articleId.replaceAll("[", "").replaceAll("]", ""),
          title: itemArticle.articleTitle,
        );
        break;
      case "collection":
        break;
      case "share":
        String _url = HttpApi.articleDetails +
            widget.articleId.replaceAll("[", "").replaceAll("]", "");
//        Share.share('$_title : $_url');
        break;
      default:
        break;
    }
  }

  @override
  void initState() {
    super.initState();

    _onRefresh();
  }

  @override
  ArticleDetailsPresenter createPresenter() {
    return ArticleDetailsPresenter();
  }

  void _onRefresh() {
    presenter.getRefreshArticleDetails(widget.articleId);
  }
}
