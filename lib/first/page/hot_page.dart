import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zhacpai/first/models/article_entity.dart';
import 'package:zhacpai/first/presenter/hot_presenter.dart';
import 'package:zhacpai/first/presenter/recommend_presenter.dart';
import 'package:zhacpai/first/provider/base_list_provider.dart';
import 'package:zhacpai/mvp/base_page_state.dart';
import 'package:zhacpai/res/colors.dart';
import 'package:zhacpai/widgets/my_refresh_list.dart';
import 'package:zhacpai/widgets/state_layout.dart';

class HotPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HotPageState();
  }
}

class HotPageState extends BasePageState<HotPage, HotPresenter> {
  int _page = 1;
  BaseListProvider<Articles> provider = BaseListProvider<Articles>();

  @override
  void initState() {

    provider.setStateType(StateType.loading);
    _onRefresh();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BaseListProvider<Articles>>(
      create: (_) => provider,
      child: Consumer<BaseListProvider<Articles>>(
        builder: (_, provider, __) {
          return DeerListView(
            key: Key('hot'),
            itemCount: provider.list.length+1,
            stateType: provider.stateType,
            onRefresh: _onRefresh,
            itemExtent: null,
            hasMore: provider.hasMore,
            itemBuilder: (_, index) {
              return index==0?Container(
                width: double.infinity,
                height: 10,
                color: Colours.searchBackgroundColor,
              ):hotCard(provider.list[index-1]);
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

  Widget hotCard(Articles list) {



  }

}
