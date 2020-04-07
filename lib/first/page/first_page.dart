

import 'package:flutter/material.dart';
import 'package:zhacpai/first/page/follow_page.dart';
import 'package:zhacpai/first/page/hot_page.dart';
import 'package:zhacpai/first/page/recommend.dart';
import 'package:zhacpai/login/page/login_page.dart';
import 'package:zhacpai/res/colors.dart';

class FirstPage extends StatefulWidget{
  @override
  _FirstPageState createState() => _FirstPageState();
}


class  _FirstPageState extends State<FirstPage> with AutomaticKeepAliveClientMixin<FirstPage>,SingleTickerProviderStateMixin{

  @override
  bool get wantKeepAlive => true;

  Widget barSearch() {
    return new Container(
        child: new Row(
          children: <Widget>[
            new Expanded(
                child: new FlatButton.icon(
                  onPressed: (){

                  },
                  icon: new Icon(
                      Icons.search,
                      color: Colours.dark_text_gray,
                      size: 16.0
                  ),
                  label: new Text(
                    "请问要来点黑客派吗O(∩_∩)O",
                    style: new TextStyle(color: Colours.dark_text_gray),
                  ),
                )
            ),
            new Container(
              decoration: new BoxDecoration(
                  border: new BorderDirectional(
                      start: new BorderSide(color: Colours.dark_text_gray, width: 1.0)
                  )
              ),
              height: 14.0,
              width: 1.0,
            ),
            new Container(
                child: new FlatButton.icon(
                  onPressed: (){

                  },
                  icon: new Icon(
                      Icons.border_color,
                      color: Colours.dark_text_gray,
                      size: 14.0
                  ),
                  label: new Text(
                    "提问",
                    style: new TextStyle(color: Colours.dark_text_gray),
                  ),
                )
            )
          ],
        ),
        decoration: new BoxDecoration(
          borderRadius: const BorderRadius.all(const Radius.circular(4.0)),
          color: Colours.searchBackgroundColor,

        )
    );
  }


  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    super.build(context);

    return new DefaultTabController(length: 3,
          child: new Scaffold(
            appBar: new AppBar(
              title:  barSearch(),
              bottom: new TabBar(
                indicatorColor: Colours.app_main,
                labelColor:  Colors.blue,
                unselectedLabelColor:  Colors.black,
                tabs: [
                  new Tab(text: "关注"),
                  new Tab(text: "推荐"),
                  new Tab(text: "热榜"),
                ],
              ),
              backgroundColor:Colours.material_bg,
            ),
            body: new TabBarView(
                children: [
                  new FollowPage(),
                  new RecommendPage(),
                  new HotPage()
                ]
            ),
            backgroundColor: Colours.searchBackgroundColor,
          )
      ,
    );
  }
}
