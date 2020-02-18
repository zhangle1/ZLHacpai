
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flustars/flustars.dart' as FlutterStars;

import 'package:keyboard_actions/keyboard_actions.dart';
import 'package:zhacpai/common/common.dart';
import 'package:zhacpai/login/presenter/login_presenter.dart';
import 'package:zhacpai/mvp/base_page_state.dart';
import 'package:zhacpai/res/gaps.dart';
import 'package:zhacpai/res/styles.dart';
import 'package:zhacpai/routers/fluro_navigator.dart';
import 'package:zhacpai/routers/routers.dart';
import 'package:zhacpai/util/utils.dart';
import 'package:zhacpai/widgets/app_bar.dart';
import 'package:zhacpai/widgets/my_button.dart';
import 'package:zhacpai/widgets/text_field.dart';


/// design/1注册登录/index.html
class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends BasePageState<LoginPage,LoginPagePresenter> {
  //定义一个controller
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  final FocusNode _nodeText1 = FocusNode();
  final FocusNode _nodeText2 = FocusNode();
  bool _isClick = false;

  @override
  void initState() {
    super.initState();
    //监听输入改变  
    _nameController.addListener(_verify);
    _passwordController.addListener(_verify);
    _nameController.text = FlutterStars.SpUtil.getString(Constant.phone);
  }

  void _verify() {
    String name = _nameController.text;
    String password = _passwordController.text;
    bool isClick = true;
    if (name.isEmpty || name.length < 5) {
      isClick = false;
    }
    if (password.isEmpty || password.length < 6) {
      isClick = false;
    }

    /// 状态不一样在刷新，避免重复不必要的setState
    if (isClick != _isClick) {
      setState(() {
        _isClick = isClick;
      });
    }
  }

   void _login() {
//    FlutterStars.SpUtil.putString(Constant.phone, _nameController.text);
    presenter.login(_nameController.text, _passwordController.text);
  }

  void goHomePage(){
    NavigatorUtils.push(context, Routes.home, clearStack: true);
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        isBack: false,
        actionName: '',
        onPressed: () {
//          NavigatorUtils.push(context, LoginRouter.smsLoginPage);
        },
      ),
      body: defaultTargetPlatform == TargetPlatform.iOS ? FormKeyboardActions(
        child: _buildBody(),
      ) : SingleChildScrollView(
        child: _buildBody(),
      ) 
    );
  }
  
  _buildBody() {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            '密码登录',
            style: TextStyles.textBold26,
          ),
          Gaps.vGap16,
          MyTextField(
            key: const Key('phone'),
            focusNode: _nodeText1,
            controller: _nameController,
            maxLength: 11,
            keyboardType: TextInputType.text,
            hintText: '请输入账号',
          ),
          Gaps.vGap8,
          MyTextField(
            key: const Key('password'),
            keyName: 'password',
            focusNode: _nodeText2,
            config: Utils.getKeyboardActionsConfig(context, [_nodeText1, _nodeText2]),
            isInputPwd: true,
            controller: _passwordController,
            keyboardType: TextInputType.visiblePassword,
            maxLength: 16,
            hintText: '请输入密码',
          ),
          Gaps.vGap10,
          Gaps.vGap15,
          MyButton(
            key: const Key('login'),
            onPressed: _isClick ? _login : null,
            text: '登录',
          ),

          Gaps.vGap16,

        ],
      ),
    );
  }

  @override
  LoginPagePresenter createPresenter() {
    return LoginPagePresenter();
  }
}
