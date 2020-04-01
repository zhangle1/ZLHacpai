import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zhacpai/channel/page/channel_page.dart';
import 'package:zhacpai/dynamic/page/dynamic_page.dart';
import 'package:zhacpai/first/page/first_page.dart';
import 'package:zhacpai/home/provider/home_provider.dart';
import 'package:zhacpai/login/page/login_page.dart';
import 'package:zhacpai/my/page/my_page.dart';
import 'package:zhacpai/res/colors.dart';
import 'package:zhacpai/res/dimens.dart';
import 'package:zhacpai/util/double_tap_back_exit_app.dart';
import 'package:zhacpai/util/theme_utils.dart';
import 'package:zhacpai/widgets/load_image.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _HomeState();
  }
}

class _HomeState extends State<Home> {
  List<BottomNavigationBarItem> _listDark;

  var _pageList;
  var _appBarTitles = ['首页', '频道', '动态', '我的'];

  final _pageController = PageController();

  HomeProvider provider = HomeProvider();

  List<BottomNavigationBarItem> _list;

  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData() {
    _pageList = [FirstPage(), ChannelPage(), DynamicPage(), MyPage()];
  }

  List<BottomNavigationBarItem> _buildBottomNavigationBarItem() {
    if (_list == null) {
      var _tabImages = [
        [
          const LoadSVGAssetImage(
            'home/ic_home',
            width: 25.0,
            color: Colours.unselected_item_color,
          ),
          const LoadSVGAssetImage(
            'home/ic_home',
            width: 25.0,
            color: Colours.app_main,
          ),
        ],
        [
          const LoadSVGAssetImage(
            'home/ic_channel',
            width: 25.0,
            color: Colours.unselected_item_color,
          ),
          const LoadSVGAssetImage(
            'home/ic_channel',
            width: 25.0,
            color: Colours.app_main,
          ),
        ],
        [
          const LoadSVGAssetImage(
            'home/ic_dynamic',
            width: 25.0,
            color: Colours.unselected_item_color,
          ),
          const LoadSVGAssetImage(
            'home/ic_dynamic',
            width: 25.0,
            color: Colours.app_main,
          ),
        ],
        [
          const LoadSVGAssetImage(
            'home/ic_my',
            width: 25.0,
            color: Colours.unselected_item_color,
          ),
          const LoadSVGAssetImage(
            'home/ic_my',
            width: 25.0,
            color: Colours.app_main,
          ),
        ]
      ];
      _list = List.generate(4, (i) {
        return BottomNavigationBarItem(
            icon: _tabImages[i][0],
            activeIcon: _tabImages[i][1],
            title: Padding(
              padding: const EdgeInsets.only(top: 1.5),
              child: Text(
                _appBarTitles[i],
                key: Key(_appBarTitles[i]),
              ),
            ));
      });
    }
    return _list;
  }

@override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider<HomeProvider>(
      create: (_)=>provider,
      child: DoubleTapBackExitApp(
        child: Scaffold(
          bottomNavigationBar: Consumer<HomeProvider>(
            builder: (_,provider,__){
              return BottomNavigationBar(
                backgroundColor: ThemeUtils.getBackgroundColor(context),
                items:_buildBottomNavigationBarItem(),
                type: BottomNavigationBarType.fixed,
                currentIndex: provider.value,
                elevation: 5.0,
                iconSize: 21.0,
                selectedFontSize: Dimens.font_sp10,
                unselectedFontSize: Dimens.font_sp10,
                selectedItemColor: Theme.of(context).primaryColor,
                unselectedItemColor:  Colours.unselected_item_color,
                onTap: (index) => _pageController.jumpToPage(index),
              );
            }
          ),
          body: PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: _pageList,
            physics: NeverScrollableScrollPhysics(),
          ),
        ),
      ),
    );
  }

  void _onPageChanged(int index) {
      provider.value=index;
  }
}
