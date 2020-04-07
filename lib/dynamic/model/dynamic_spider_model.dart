
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
    var userName = value.querySelectorAll(".ft-a-title");
    var userNameText='';

    var avatar =value.querySelectorAll(".avatar");
    var avatarText='';

    var content=value.querySelectorAll("p");
    var contentText='';

    if(userName.length!=0){userNameText=userName.first.innerHtml.replaceAll("@", "");}
    if(avatar.length!=0){avatarText=avatar.first.attributes["data-src"];}
    if(content.length!=0){contentText=content.first.innerHtml;}
    return DynamicItemModel(userNameText,
        avatarText,
        contentText
    );
   }).toList();

    return Future.value(modelList);
  }


}
