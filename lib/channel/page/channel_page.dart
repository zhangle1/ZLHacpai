import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:zhacpai/channel/model/domain_list_entity.dart';
import 'package:zhacpai/channel/model/tags_list_entity.dart';
import 'package:zhacpai/channel/presenter/channel_presenter.dart';
import 'package:zhacpai/channel/provider/channel_provider.dart';
import 'package:zhacpai/mvp/base_page_state.dart';
import 'package:zhacpai/res/colors.dart';
import 'package:zhacpai/res/gaps.dart';
import 'package:zhacpai/routers/fluro_navigator.dart';
import 'package:zhacpai/routers/routers.dart';
import 'package:zhacpai/util/randomUtils.dart';
import 'package:zhacpai/widgets/load_image.dart';
import 'package:zhacpai/widgets/state_layout.dart';

class ChannelPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ChannelPageState();
  }
}

class ChannelPageState extends BasePageState<ChannelPage, ChannelPresenter>
    with
        AutomaticKeepAliveClientMixin<ChannelPage>,
        SingleTickerProviderStateMixin {
  @override
  bool get wantKeepAlive => true;

  ChannelProvider provider = ChannelProvider();

  @override
  void initState() {
    super.initState();
    provider.stateType = StateType.loading;
    this.presenter.getRefreshChannelLabelData();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ChangeNotifierProvider<ChannelProvider>(
        create: (_) => provider,
        child: Consumer<ChannelProvider>(
          builder: (_, provider, __) {
            return provider.channelEntity == null
                ? StateLayout(type: provider.stateType)
                : SafeArea(
                    child: Container(
                      color: Colours.searchBackgroundColor,
                      child: ListView(
                        children: <Widget>[
                          DoMainHeader(),
                          DoMainGridView(
                              provider.channelEntity.doMainListEntity),
                          createSpaceContainer(),
                          TagsHeader((){
                            presenter.getChangesTagsData();
                          }),
                          createTagsChips(provider.channelEntity.tagsListEntity)
                        ],
                      ),
                    ),
                  );
          },
        ));
  }

  Widget DoMainHeader() {
    return Container(
      padding:
          EdgeInsets.only(left: 16.0, top: 10.0, right: 16.0, bottom: 10.0),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: Text("领域",
                  style:
                      TextStyle(height: 1.3, color: Colours.dark_text_gray))),
//          FlatButton(
//              child: Row(
//                children: <Widget>[
//                  Text("换一换",
//                      style: TextStyle(
//                          height: 1.3, color: Colours.dark_text_gray)),
//                  Gaps.hGap4,
//                  LoadSVGAssetImage('ic_refresh', width: 20, height: 20)
//                ],
//              ),
//              onPressed: () => {}),
        ],
      ),
    );
  }

  displaySvg(String svgString) async {
    final DrawableRoot svgRoot = await svg.fromSvgString(svgString, svgString);
    return await svgRoot.toPicture().toImage(40, 40);
  }

  Widget DoMainGridView(DoMainListEntity doMainListEntity) {
    var itemDatas = doMainListEntity.data.domains;

    List<Widget> itemWidgets = new List<Widget>();

    for (var i = 0; i < itemDatas.length; i++) {
      itemWidgets.add(InkWell(
        onTap: (){
          NavigatorUtils.push(context, Routes.domainArticles+'?domainLabel='+itemDatas[i].domainURI.substring(itemDatas[i].domainURI.lastIndexOf('/')+1));
        },
        child: Container(
            child:
           Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SvgPicture.string(itemDatas[i].domainIconPath, width: 40, height: 40),
                Gaps.vGap4,
                Text(itemDatas[i].domainTitle,
                    style: TextStyle(color: Colours.dark_bg_gray))
              ],
            )
        ),
      ));
    }

    return Container(
      color: Colors.white,
      child: GridView.count(
        padding: EdgeInsets.only(left: 16.0, right: 16.0),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 4,
        children: itemWidgets,
      ),
    );
  }

  Widget createSpaceContainer() {
    return Container(
      height: 12.0,
      color: Colours.searchBackgroundColor,
    );
  }

  @override
  ChannelPresenter createPresenter() {
    return ChannelPresenter();
  }

  TagsHeader(Function() tagsChange) {
    return Container(
      padding:
      EdgeInsets.only(left: 16.0, top: 10.0, right: 16.0, bottom: 10.0),
      color: Colors.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: Text("标签",
                  style:
                  TextStyle(height: 1.3, color: Colours.dark_text_gray))),
          FlatButton(
              child: Row(
                children: <Widget>[
                  Text("换一换",
                      style: TextStyle(
                          height: 1.3, color: Colours.dark_text_gray)),
                  Gaps.hGap4,
                  LoadSVGAssetImage('ic_refresh', width: 20, height: 20)
                ],
              ),
              onPressed: tagsChange),
        ],
      ),
    );


  }

  createTagsChips
      (TagsListEntity tagsListEntity) {
    List<Widget> chips =   tagsListEntity.data.tags.map<Widget>(
            (Tags tags){
              return Chip(
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                key: ValueKey<String>(tags.tagTitle),
                backgroundColor: getChipBgColor(tags.tagTitle),
                label: Text(
                  tags.tagTitle,
                  style: new TextStyle(fontSize: 14.0),
                ),
              );
            }

        ).toList();
      return InkWell(
        onTap: (){},
        child: _ChipsTile(

          children: chips,
        ),
      );




  }



}

class _ChipsTile extends StatelessWidget {
  const _ChipsTile({
    Key key,
    this.label,
    this.children,
  }) : super(key: key);

  final String label;
  final List<Widget> children;

  // Wraps a list of chips into a ListTile for display as a section in the demo.
  @override
  Widget build(BuildContext context) {
    final List<Widget> cardChildren = <Widget>[

    ];
    cardChildren.add(Wrap(
        children: children.map((Widget chip) {
          return Padding(
            padding: const EdgeInsets.all(3.0),
            child: chip,
          );
        }).toList()));

    return new Container(
      padding: EdgeInsets.only(left: 16.0,right: 16.0,bottom: 16.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: cardChildren,
      ),
      decoration: new BoxDecoration(
          color: Colors.white,
          border: new Border(
              bottom: new BorderSide(width: 0.33, color: Colours.divider))),
    );
  }
}

