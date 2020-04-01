import 'package:flutter/material.dart';
import 'package:zhacpai/channel/model/channel_entity.dart';
import 'package:zhacpai/channel/model/tags_list_entity.dart';
import 'package:zhacpai/widgets/state_layout.dart';



class ChannelProvider  extends ChangeNotifier{

  StateType _stateType = StateType.loading;

  ChannelEntity _channelEntity;

  StateType get stateType => _stateType;

  ChannelEntity get channelEntity => _channelEntity;

  set channelEntity(ChannelEntity value) {
    _channelEntity = value;
    notifyListeners();
  }

  set tags(TagsListEntity value){
    _channelEntity.tagsListEntity=value;
    notifyListeners();
  }


  set stateType(StateType value) {
    _stateType = value;
    notifyListeners();
  }


}