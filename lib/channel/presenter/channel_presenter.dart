import 'package:zhacpai/channel/model/channel_entity.dart';
import 'package:zhacpai/channel/model/channel_model.dart';
import 'package:zhacpai/channel/model/domain_list_entity.dart';
import 'package:zhacpai/channel/model/tags_list_entity.dart';

import 'package:zhacpai/channel/page/channel_page.dart';
import 'package:zhacpai/mvp/base_page_presenter.dart';

import 'package:zhacpai/util/log_utils.dart';
import 'package:zhacpai/util/randomUtils.dart';

class ChannelPresenter extends BasePagePresenter<ChannelPageState> {
  final ChannelModel channelModel = ChannelModel();

  getRefreshChannelLabelData() async {
    var domain = channelModel.getDomainModelAsync();
    var tags = channelModel.getTagsModelAsync("1");
    Future.wait([domain, tags], eagerError: true).then((ret) {

     ChannelEntity channelEntity= ChannelEntity();

      for (var value in ret) {
        if(value is DoMainListEntity){
          var doMain = value as DoMainListEntity;
          channelEntity.doMainListEntity=doMain;
        }
        if(value is TagsListEntity){
          var tags =value as TagsListEntity;
          channelEntity.tagsListEntity=tags;
        }
      }

     Log.e("channel success:" );

     view.provider.channelEntity=channelEntity;

    }, onError: (e) {
      Log.e("channel error:" + e.toString());
    });
  }




  getChangesTagsData() async{
    view.showProgress();

    var item=  view.provider.channelEntity.tagsListEntity.data;
    int page=item.pagination.paginationPageCount~/20;
    if(item.pagination.paginationPageCount%20!=0){
      page+=1;
    }
   page= randomNumber(page);
   var tagFuture= channelModel.getTagsModelAsync(page.toString());

   tagFuture.then((ret){
      if(ret is TagsListEntity){
        view.provider.tags=ret;
      }
      view.closeProgress();
      Log.e("tag 完成了");

   },onError: (e){
     Log.e("tag 错误进来了"+e.toString());
     view.closeProgress();
   });


  }

}
