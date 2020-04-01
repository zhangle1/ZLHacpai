class MyUnreadNotifyEntity {
  int sc;
  String msg;
  String random;
  Data data;

  MyUnreadNotifyEntity({this.sc, this.msg, this.random, this.data});

  MyUnreadNotifyEntity.fromJson(Map<String, dynamic> json) {
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
  int unreadReviewNotificationCnt;
  int unreadNotificationCnt;
  int unreadPointNotificationCnt;
  int unreadAtNotificationCnt;
  int unreadCommentedNotificationCnt;
  int unreadWalletNotificationCnt;
  int unreadReplyNotificationCnt;
  int unreadComment2edNotificationCnt;
  int unreadBroadcastNotificationCnt;
  int unreadSysAnnounceNotificationCnt;
  int unreadNewFollowerNotificationCnt;
  int unreadChatNotificationCnt;
  int unreadFollowingNotificationCnt;

  Data(
      {this.unreadReviewNotificationCnt,
        this.unreadNotificationCnt,
        this.unreadPointNotificationCnt,
        this.unreadAtNotificationCnt,
        this.unreadCommentedNotificationCnt,
        this.unreadWalletNotificationCnt,
        this.unreadReplyNotificationCnt,
        this.unreadComment2edNotificationCnt,
        this.unreadBroadcastNotificationCnt,
        this.unreadSysAnnounceNotificationCnt,
        this.unreadNewFollowerNotificationCnt,
        this.unreadChatNotificationCnt,
        this.unreadFollowingNotificationCnt});

  Data.fromJson(Map<String, dynamic> json) {
    unreadReviewNotificationCnt = json['unreadReviewNotificationCnt'];
    unreadNotificationCnt = json['unreadNotificationCnt'];
    unreadPointNotificationCnt = json['unreadPointNotificationCnt'];
    unreadAtNotificationCnt = json['unreadAtNotificationCnt'];
    unreadCommentedNotificationCnt = json['unreadCommentedNotificationCnt'];
    unreadWalletNotificationCnt = json['unreadWalletNotificationCnt'];
    unreadReplyNotificationCnt = json['unreadReplyNotificationCnt'];
    unreadComment2edNotificationCnt = json['unreadComment2edNotificationCnt'];
    unreadBroadcastNotificationCnt = json['unreadBroadcastNotificationCnt'];
    unreadSysAnnounceNotificationCnt = json['unreadSysAnnounceNotificationCnt'];
    unreadNewFollowerNotificationCnt = json['unreadNewFollowerNotificationCnt'];
    unreadChatNotificationCnt = json['unreadChatNotificationCnt'];
    unreadFollowingNotificationCnt = json['unreadFollowingNotificationCnt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['unreadReviewNotificationCnt'] = this.unreadReviewNotificationCnt;
    data['unreadNotificationCnt'] = this.unreadNotificationCnt;
    data['unreadPointNotificationCnt'] = this.unreadPointNotificationCnt;
    data['unreadAtNotificationCnt'] = this.unreadAtNotificationCnt;
    data['unreadCommentedNotificationCnt'] =
        this.unreadCommentedNotificationCnt;
    data['unreadWalletNotificationCnt'] = this.unreadWalletNotificationCnt;
    data['unreadReplyNotificationCnt'] = this.unreadReplyNotificationCnt;
    data['unreadComment2edNotificationCnt'] =
        this.unreadComment2edNotificationCnt;
    data['unreadBroadcastNotificationCnt'] =
        this.unreadBroadcastNotificationCnt;
    data['unreadSysAnnounceNotificationCnt'] =
        this.unreadSysAnnounceNotificationCnt;
    data['unreadNewFollowerNotificationCnt'] =
        this.unreadNewFollowerNotificationCnt;
    data['unreadChatNotificationCnt'] = this.unreadChatNotificationCnt;
    data['unreadFollowingNotificationCnt'] =
        this.unreadFollowingNotificationCnt;
    return data;
  }
}
