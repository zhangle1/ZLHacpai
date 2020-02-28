

import 'package:flutter/material.dart';
import 'package:zhacpai/first/presenter/recommend_presenter.dart';
import 'package:zhacpai/mvp/base_page_state.dart';

class RecommendPage extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    return RecommendPageState();
  }

}

class RecommendPageState extends BasePageState<RecommendPage,RecommendPresenter> {
  @override
  Widget build(BuildContext context) {
    return null;
  }

  @override
  createPresenter() {
    return RecommendPresenter();
  }










}