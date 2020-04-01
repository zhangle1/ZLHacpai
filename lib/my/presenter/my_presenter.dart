


import 'package:zhacpai/mvp/base_page_presenter.dart';
import 'package:zhacpai/my/model/my_detail_info_entity.dart';
import 'package:zhacpai/my/model/my_entity.dart';
import 'package:zhacpai/my/model/my_model.dart';
import 'package:zhacpai/my/model/my_unread_notify_entity.dart';
import 'package:zhacpai/my/page/my_page.dart';

class  MyPresenter  extends BasePagePresenter<MyPageState>{

  final MyModel myModel=MyModel();

  getRefreshMyDetailInfo()async{

    var myDetailInfoAsync = myModel.getMyDetailInfoAsync();
    var myUnreadNotifyAsync = myModel.getMyUnreadNotifyAsync();
    Future.wait([myDetailInfoAsync,myUnreadNotifyAsync],eagerError: true).then((ret){
      MyEntity myEntity = MyEntity();
      for (var value in ret) {
        if (value is MyDetailInfoEntity) {
          var myDetailInfo = value as MyDetailInfoEntity;
          myEntity.myDetailInfoEntity = myDetailInfo;
        }
        if (value is MyUnreadNotifyEntity) {
          var unRead = value as MyUnreadNotifyEntity;
          myEntity.myUnreadNotifyEntity = unRead;
        }
      }
      view.provider.entity=myEntity;
    },onError: (e){

    });
  }



}