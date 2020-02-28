

import 'package:flutter/material.dart';

class DynamicPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DynamicPageState();
  }
}

class _DynamicPageState extends State<DynamicPage> with AutomaticKeepAliveClientMixin<DynamicPage>,SingleTickerProviderStateMixin {

  @override
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