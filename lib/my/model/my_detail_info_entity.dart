
class MyDetailInfoEntity {
  int sc;
  String msg;
  String random;
  Data data;

  MyDetailInfoEntity({this.sc, this.msg, this.random, this.data});

  MyDetailInfoEntity.fromJson(Map<String, dynamic> json) {
    sc = json['sc'];
    msg = json['msg'];
    random = json['random'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sc'] = this.sc;
    data['msg'] = this.msg;
    data['random'] = this.random;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  User user;

  Data({this.user});

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class User {
  String userAvatarURL96;
  String userNickname;
  int userAppRole;
  String userCardBImgURL;
  int userCurrentCheckinStreak;
  String userAvatarURL;
  String userAvatarURL256;
  String userPointHex;
  String userIntro;
  String userAvatarURL128;
  String userHomeBImgDColor;
  String userTags;
  String userURL;
  int userTagCount;
  int userComment2Count;
  int userLongestCheckinStreak;
  String userAvatarURL48;
  int userNo;
  String userCardBImgDColor;
  int userPoint;
  int userCommentCount;
  int userGeneralRank;
  String oId;
  String userName;
  String userHomeBImgURL;
  int userArticleCount;
  String userAvatarURL64;
  String userRole;

  User(
      {this.userAvatarURL96,
        this.userNickname,
        this.userAppRole,
        this.userCardBImgURL,
        this.userCurrentCheckinStreak,
        this.userAvatarURL,
        this.userAvatarURL256,
        this.userPointHex,
        this.userIntro,
        this.userAvatarURL128,
        this.userHomeBImgDColor,
        this.userTags,
        this.userURL,
        this.userTagCount,
        this.userComment2Count,
        this.userLongestCheckinStreak,
        this.userAvatarURL48,
        this.userNo,
        this.userCardBImgDColor,
        this.userPoint,
        this.userCommentCount,
        this.userGeneralRank,
        this.oId,
        this.userName,
        this.userHomeBImgURL,
        this.userArticleCount,
        this.userAvatarURL64,
        this.userRole});

  User.fromJson(Map<String, dynamic> json) {
    userAvatarURL96 = json['userAvatarURL96'];
    userNickname = json['userNickname'];
    userAppRole = json['userAppRole'];
    userCardBImgURL = json['userCardBImgURL'];
    userCurrentCheckinStreak = json['userCurrentCheckinStreak'];
    userAvatarURL = json['userAvatarURL'];
    userAvatarURL256 = json['userAvatarURL256'];
    userPointHex = json['userPointHex'];
    userIntro = json['userIntro'];
    userAvatarURL128 = json['userAvatarURL128'];
    userHomeBImgDColor = json['userHomeBImgDColor'];
    userTags = json['userTags'];
    userURL = json['userURL'];
    userTagCount = json['userTagCount'];
    userComment2Count = json['userComment2Count'];
    userLongestCheckinStreak = json['userLongestCheckinStreak'];
    userAvatarURL48 = json['userAvatarURL48'];
    userNo = json['userNo'];
    userCardBImgDColor = json['userCardBImgDColor'];
    userPoint = json['userPoint'];
    userCommentCount = json['userCommentCount'];
    userGeneralRank = json['userGeneralRank'];
    oId = json['oId'];
    userName = json['userName'];
    userHomeBImgURL = json['userHomeBImgURL'];
    userArticleCount = json['userArticleCount'];
    userAvatarURL64 = json['userAvatarURL64'];
    userRole = json['userRole'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userAvatarURL96'] = this.userAvatarURL96;
    data['userNickname'] = this.userNickname;
    data['userAppRole'] = this.userAppRole;
    data['userCardBImgURL'] = this.userCardBImgURL;
    data['userCurrentCheckinStreak'] = this.userCurrentCheckinStreak;
    data['userAvatarURL'] = this.userAvatarURL;
    data['userAvatarURL256'] = this.userAvatarURL256;
    data['userPointHex'] = this.userPointHex;
    data['userIntro'] = this.userIntro;
    data['userAvatarURL128'] = this.userAvatarURL128;
    data['userHomeBImgDColor'] = this.userHomeBImgDColor;
    data['userTags'] = this.userTags;
    data['userURL'] = this.userURL;
    data['userTagCount'] = this.userTagCount;
    data['userComment2Count'] = this.userComment2Count;
    data['userLongestCheckinStreak'] = this.userLongestCheckinStreak;
    data['userAvatarURL48'] = this.userAvatarURL48;
    data['userNo'] = this.userNo;
    data['userCardBImgDColor'] = this.userCardBImgDColor;
    data['userPoint'] = this.userPoint;
    data['userCommentCount'] = this.userCommentCount;
    data['userGeneralRank'] = this.userGeneralRank;
    data['oId'] = this.oId;
    data['userName'] = this.userName;
    data['userHomeBImgURL'] = this.userHomeBImgURL;
    data['userArticleCount'] = this.userArticleCount;
    data['userAvatarURL64'] = this.userAvatarURL64;
    data['userRole'] = this.userRole;
    return data;
  }
}
