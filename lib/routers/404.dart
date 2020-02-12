import 'package:flutter/material.dart';
import 'package:zhacpai/widgets/app_bar.dart';
import 'package:zhacpai/widgets/state_layout.dart';
class WidgetNotFound extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: MyAppBar(
        centerTitle: '页面不存在',
      ),
      body: StateLayout(
        type: StateType.empty,
        hintText: '页面不存在',
      ),
    );
  }
}
