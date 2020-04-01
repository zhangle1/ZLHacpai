import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zhacpai/channel/provider/channel_provider.dart';
import 'package:zhacpai/mvp/base_page_state.dart';
import 'package:zhacpai/my/model/my_entity.dart';
import 'package:zhacpai/my/presenter/my_presenter.dart';
import 'package:zhacpai/my/provider/MyProvider.dart';
import 'package:zhacpai/res/colors.dart';
import 'package:zhacpai/widgets/state_layout.dart';

class MyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyPageState();
  }
}

class MyPageState extends BasePageState<MyPage, MyPresenter>
    with AutomaticKeepAliveClientMixin<MyPage>, SingleTickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;

  MyProvider provider = MyProvider();

  @override
  void initState() {
    super.initState();
    provider.stateType = StateType.loading;
    this.presenter.getRefreshMyDetailInfo();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyProvider>(
        create: (_) => provider,
        child: Consumer<MyProvider>(builder: (_, provider, __) {
          return provider.entity == null
              ? StateLayout(type: provider.stateType)
              : Container(
                  color: Colours.searchBackgroundColor,
                  child: ListView(
                    children: <Widget>[
                      createMyInfoCard(provider.entity),
                      createMyServiceCard(provider.entity),
                      createSettingCard(),
                    ],
                  ));
        }));
  }

  Widget createMyInfoCard(MyEntity entity) {
    var userItem = entity.myDetailInfoEntity.data.user;
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 6.0),
      padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
      child: Column(
        children: <Widget>[
          Container(
            margin:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
            decoration: BoxDecoration(
                color: Colours.searchBackgroundColor,
                borderRadius: new BorderRadius.all(new Radius.circular(6.0))),
            child: FlatButton(
              child: Container(
                child: ListTile(
                  leading: Container(
                    child: new CircleAvatar(
                        backgroundImage: new NetworkImage(
                            userItem.userAvatarURL48),
                        radius: 20.0),
                  ),
                  title: new Container(
                    margin: const EdgeInsets.only(bottom: 2.0),
                    child: new Text(userItem.userNickname??userItem.userName),
                  ),
                  subtitle: new Container(
                    margin: const EdgeInsets.only(top: 2.0),
                    child: new Text("查看或编辑个人主页"),
                  ),
                ),
              ),
            ),
          ),
          new Container(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  width: (MediaQuery.of(context).size.width - 6.0) / 4,
                  child: new FlatButton(
                      onPressed: () {},
                      child: new Container(
                        height: 50.0,
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              child: new Text(
                                userItem.userArticleCount.toString(),
                                style: new TextStyle(
                                    fontSize: 16.0, color: Colours.text_dark),
                              ),
                            ),
                            new Container(
                              child: new Text(
                                "我的帖子",
                                style: new TextStyle(
                                    fontSize: 12.0, color: Colours.text_dark),
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
                new Container(
                  height: 14.0,
                  width: 1.0,
                  decoration: new BoxDecoration(
                      border: new BorderDirectional(
                          start: new BorderSide(
                              color: Colours.searchBackgroundColor,
                              width: 1.0))),
                ),
                new Container(
                  width: (MediaQuery.of(context).size.width - 6.0) / 4,
                  child: new FlatButton(
                      onPressed: () {},
                      child: new Container(
                        height: 50.0,
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              child: new Text(
                                userItem.userCommentCount.toString(),
                                style: new TextStyle(
                                    fontSize: 16.0, color: Colours.text_dark),
                              ),
                            ),
                            new Container(
                              child: new Text(
                                "我的回帖",
                                style: new TextStyle(
                                    fontSize: 12.0, color: Colours.text_dark),
                              ),
                            )
                          ],
                        ),
                      )),
                ),
                new Container(
                  height: 14.0,
                  width: 1.0,
                  decoration: new BoxDecoration(
                      border: new BorderDirectional(
                          start: new BorderSide(
                              color: Colours.searchBackgroundColor,
                              width: 1.0))),
                ),
                new Container(
                  width: (MediaQuery.of(context).size.width - 6.0) / 4,
                  child: new FlatButton(
                      onPressed: () {},
                      child: new Container(
                        height: 50.0,
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              child: new Text(
                                userItem.userTagCount.toString(),
                                style: new TextStyle(
                                    fontSize: 16.0, color: Colours.text_dark),
                              ),
                            ),
                            new Container(
                              child: new Text(
                                "关注标签",
                                style: new TextStyle(
                                    fontSize: 12.0, color: Colours.text_dark),
                              ),
                            )
                          ],
                        ),
                      )),
                ),
                new Container(
                  height: 14.0,
                  width: 1.0,
                  decoration: new BoxDecoration(
                      border: new BorderDirectional(
                          start: new BorderSide(
                              color: Colours.searchBackgroundColor,
                              width: 1.0))),
                ),
                new Container(
                    width: (MediaQuery.of(context).size.width - 6.0) / 4,
                    child: new FlatButton(
                        onPressed: () {},
                        child: new Container(
                          height: 50.0,
                          child: new Column(
                            children: <Widget>[
                              new Container(
                                child: new Text(
                                  "~~",
                                  style: new TextStyle(
                                      fontSize: 16.0, color: Colours.text_dark),
                                ),
                              ),
                              new Container(
                                child: new Text(
                                  "关注用户",
                                  style: new TextStyle(
                                      fontSize: 12.0, color: Colours.text_dark),
                                ),
                              )
                            ],
                          ),
                        )))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget createMyServiceCard(MyEntity entity) {
    return new Container(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 6.0, bottom: 6.0),
      padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
      child: new Column(
        children: <Widget>[
          new Container(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: new FlatButton(
                      onPressed: () {},
                      child: new Container(
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              margin: const EdgeInsets.only(bottom: 6.0),
                              child: new CircleAvatar(
                                radius: 20.0,
                                child:
                                    new Icon(Icons.message, color: Colors.white),
                                backgroundColor: Colors.green,
                              ),
                            ),
                            new Container(
                              child: new Text(
                                "回帖消息",
                                style: new TextStyle(
                                    color: Colours.text_dark, fontSize: 14.0),
                              ),
                            )
                          ],
                        ),
                      )),
                ),
                new Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: new FlatButton(
                      onPressed: () {},
                      child: new Container(
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              margin: const EdgeInsets.only(bottom: 6.0),
                              child: new CircleAvatar(
                                radius: 20.0,
                                child: new Icon(Icons.comment,
                                    color: Colors.white),
                                backgroundColor: Colors.blue,
                              ),
                            ),
                            new Container(
                              child: new Text("评论消息",
                                  style: new TextStyle(
                                      color: Colours.text_dark,
                                      fontSize: 14.0)),
                            )
                          ],
                        ),
                      )),
                ),
                new Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: new FlatButton(
                      onPressed: () {},
                      child: new Container(
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              margin: const EdgeInsets.only(bottom: 6.0),
                              child: new CircleAvatar(
                                radius: 20.0,
                                child: new Icon(Icons.receipt,
                                    color: Colors.white),
                                backgroundColor: new Color(0xFFA68F52),
                              ),
                            ),
                            new Container(
                              child: new Text("回复消息",
                                  style: new TextStyle(
                                      color: Colours.text_dark,
                                      fontSize: 14.0)),
                            )
                          ],
                        ),
                      )),
                ),
                new Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: new FlatButton(
                      onPressed: () {},
                      child: new Container(
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              margin: const EdgeInsets.only(bottom: 6.0),
                              child: new CircleAvatar(
                                radius: 20.0,
                                child: new Icon(Icons.attach_money,
                                    color: Colors.white),
                                backgroundColor: new Color(0xFF355A9B),
                              ),
                            ),
                            new Container(
                              child: new Text("我的积分",
                                  style: new TextStyle(
                                      color: Colours.text_dark,
                                      fontSize: 14.0)),
                            )
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(top: 16.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Container(
                  width: MediaQuery.of(context).size.width / 4,
                  child: new FlatButton(
                      onPressed: () {},
                      child: new Container(
                        child: new Column(
                          children: <Widget>[
                            new Container(
                              margin: const EdgeInsets.only(bottom: 6.0),
                              child: new CircleAvatar(
                                radius: 20.0,
                                child:
                                    new Icon(Icons.people, color: Colors.white),
                                backgroundColor: new Color(0xFF088DB4),
                              ),
                            ),
                            new Container(
                              child: new Text(
                                "我的粉丝",
                                style: new TextStyle(
                                    color: Colours.text_dark, fontSize: 14.0),
                              ),
                            )
                          ],
                        ),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  MyPresenter createPresenter() {
    return MyPresenter();
  }

  Widget createSettingCard
      () {
    return  Container(
      color: Colors.white,
      margin: const EdgeInsets.only(top: 6.0, bottom: 6.0),
      padding: const EdgeInsets.only(top: 12.0, bottom: 8.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Container(
            width: MediaQuery.of(context).size.width / 4,
            child: new FlatButton(
                onPressed: (){},
                child: new Container(
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.only(bottom: 6.0),
                        child: new CircleAvatar(
                          radius: 20.0,
                          child: new Icon(Icons.invert_colors, color: Colors.white),
                          backgroundColor: new Color(0xFFB88800),
                        ),
                      ),
                      new Container(
                        child: new Text("社区建设", style: new TextStyle(color: Colours.text_dark, fontSize: 14.0)),
                      )
                    ],
                  ),
                )
            ),
          ),
          new Container(
            width: MediaQuery.of(context).size.width / 4,
            child: new FlatButton(
                onPressed: (){},
                child: new Container(
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.only(bottom: 6.0),
                        child: new CircleAvatar(
                          radius: 20.0,
                          child: new Icon(Icons.golf_course, color: Colors.white),
                          backgroundColor: new Color(0xFF63616D),
                        ),
                      ),
                      new Container(
                        child: new Text("反馈", style: new TextStyle(color: Colours.text_dark, fontSize: 14.0)),
                      )
                    ],
                  ),
                )
            ),
          ),
          new Container(
            width: MediaQuery.of(context).size.width / 4,
            child: new FlatButton(

                child: new Container(
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.only(bottom: 6.0),
                        child: new CircleAvatar(
                          radius: 20.0,
                          child: new Icon(Icons.brightness_2, color: Colors.white),
                          backgroundColor: new Color(0xFFB86A0D),
                        ),
                      ),
                      new Container(
                        child: new Text("日间模式" , style: new TextStyle(color: Colours.text_dark, fontSize: 14.0)),
                      )
                    ],
                  ),
                )
            ),
          ),
          new Container(
            width: MediaQuery.of(context).size.width / 4,
            child: new FlatButton(
                onPressed: (){},
                child: new Container(
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.only(bottom: 6.0),
                        child: new CircleAvatar(
                          radius: 20.0,
                          child: new Icon(Icons.perm_data_setting, color: Colors.white),
                          backgroundColor: new Color(0xFF636269),
                        ),
                      ),
                      new Container(
                        child: new Text("设置", style: new TextStyle(color: Colours.text_dark, fontSize: 14.0)),
                      )
                    ],
                  ),
                )
            ),
          ),
        ],
      ),
    );


  }
}
