
import 'package:universal_html/driver.dart';
import 'package:universal_html/html.dart';

import 'package:zhacpai/util/log_utils.dart';

import 'dynamic_item_model.dart';

class DynamicSpiderModel {
//  void getDynamicDataByPageNum(String s) {}



  Future<List<DynamicItemModel>> getDynamicDataByPageNum(String page)  async {

    final driver = new HtmlDriver(userAgent:UserAgent("zhacpai"));
    await driver.setDocumentFromUri(Uri.parse('https://hacpai.com/cr?p=' + page));

   List<Element> elementLists=  driver.document.querySelectorAll(".chats__list > .chats__item");

   List<DynamicItemModel> modelList = elementLists.map<DynamicItemModel>((value){
    return DynamicItemModel(value.querySelectorAll(".ft-a-title").first.innerHtml.replaceAll("@", ""),
        value.querySelectorAll(".avatar").first.attributes["data-src"],
        value.querySelectorAll("p").first.innerHtml
    );
   }).toList();

    return Future.value(modelList);
  }


}
