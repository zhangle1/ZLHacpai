


import 'package:zhacpai/channel/provider/channel_provider.dart';
import 'package:zhacpai/widgets/state_layout.dart';

abstract  class BaseEasyProvider<T> extends ChannelProvider{

  StateType _stateType = StateType.loading;

  T _entity;

  StateType get stateType => _stateType;

  T get entity=>_entity;

  set entity(T value) {
    _entity = value;
    notifyListeners();
  }

  set stateType(StateType value) {
    _stateType = value;
    notifyListeners();
  }


}