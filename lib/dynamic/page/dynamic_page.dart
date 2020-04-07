import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:provider/provider.dart';
import 'package:zhacpai/dynamic/model/dynamic_item_model.dart';
import 'package:zhacpai/dynamic/presenter/dynamic_presenter.dart';
import 'package:zhacpai/first/provider/base_list_provider.dart';
import 'package:zhacpai/mvp/base_page_state.dart';
import 'package:zhacpai/res/gaps.dart';
import 'package:zhacpai/widgets/image_view.dart';
import 'package:zhacpai/widgets/my_refresh_list.dart';

class DynamicPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DynamicPageState();
  }
}

class DynamicPageState extends BasePageState<DynamicPage, DynamicPresenter>
    with
        AutomaticKeepAliveClientMixin<DynamicPage>,
        SingleTickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;

  int _page = 1;
  BaseListProvider<DynamicItemModel> provider =
      BaseListProvider<DynamicItemModel>();

  @override
  void initState() {
    super.initState();
//    presenter.getDynamicDataByPageNum("1");

    _onRefresh();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: ChangeNotifierProvider<BaseListProvider<DynamicItemModel>>(
              create: (_) => provider,
              child: Consumer<BaseListProvider<DynamicItemModel>>(
                  builder: (_, provider, __) {
                return Container(
                  child: Column(
                    children: <Widget>[
                      Flexible(
                          child: DeerListView(
                              key: Key('dynamic'),
                              itemCount: provider.list.length,
                              stateType: provider.stateType,
                              onRefresh: _onRefresh,
                              loadMore: _onLoadData,
                              itemExtent: null,
                              hasMore: true,
                              itemBuilder: (_, index) {
                                return Message(provider.list[index]);
                              }))
                    ],
                  ),
                );
              }))),
    );
  }

  Future _onLoadData() async {
    _page++;
    await presenter.getDynamicDataByPageNum(_page.toString());
  }

  Future _onRefresh() async {
    _page = 1;
    await presenter.getDynamicDataRefresh(_page.toString());
  }

  @override
  DynamicPresenter createPresenter() {
    return DynamicPresenter();
  }

  Widget Message(DynamicItemModel item) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          createMsgAvatar(item),
          createTextItemContainer(item),
        ],
      ),
    );
  }

  Widget createMsgAvatar(DynamicItemModel item) {
    return InkWell(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        margin: EdgeInsets.only(right: 10.0),
        child: ImageView(
          img: item.avatar,
          height: 50,
          width: 50,
          fit: BoxFit.cover,
        ),
      ),
      onTap: () {},
    );
  }

  createTextItemContainer(DynamicItemModel item) {
    return Flexible(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Text(
            item.userName.trim(),
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 12, color: Colors.black),
          ),
        ),
        Gaps.vGap4,
        Container(
            width: 300,
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              color: false ? Color(0xff98E165) : Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            child: Container(
                child: Html(
              data: item.content,
            )))
      ],
    ));
  }
}

//ExtendedText(
//item.content ?? '文字为空',
//maxLines: 200,
//overflow: TextOverflow.ellipsis,
//specialTextSpanBuilder: TextSpanBuilder(),
//style: TextStyle(fontSize: 15),
//),
