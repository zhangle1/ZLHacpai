import 'package:zhacpai/dynamic/model/dynamic_item_model.dart';
import 'package:zhacpai/dynamic/model/dynamic_spider_model.dart';
import 'package:zhacpai/dynamic/page/dynamic_page.dart';
import 'package:zhacpai/mvp/base_page_presenter.dart';

class DynamicPresenter extends BasePagePresenter<DynamicPageState> {
  DynamicSpiderModel dynamicSpiderModel = DynamicSpiderModel();

  getDynamicDataByPageNum(String page) async {
    List<DynamicItemModel> items =
    await dynamicSpiderModel.getDynamicDataByPageNum(page);

    view.provider.addAll(items);

  }

  getDynamicDataRefresh(String page) async {
    List<DynamicItemModel> items =
        await dynamicSpiderModel.getDynamicDataByPageNum(page);
    view.provider.clear();
    view.provider.addAll(items);

  }
}
