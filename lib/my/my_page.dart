

import 'package:flutter/material.dart';

class MyPage extends StatefulWidget{
   @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyPageState();
  }
}

class _MyPageState extends  State<MyPage> with AutomaticKeepAliveClientMixin<MyPage>,SingleTickerProviderStateMixin {

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return super.build(context);
  }

}