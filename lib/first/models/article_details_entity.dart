class ArticleDetailsEntity {
  int sc;
  String msg;
  String random;
  Data data;

  ArticleDetailsEntity({this.sc, this.msg, this.random, this.data});

  ArticleDetailsEntity.fromJson(Map<String, dynamic> json) {
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
  Pagination pagination;
  Article article;

  Data({this.pagination, this.article});

  Data.fromJson(Map<String, dynamic> json) {
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
    article =
    json['article'] != null ? new Article.fromJson(json['article']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pagination != null) {
      data['pagination'] = this.pagination.toJson();
    }
    if (this.article != null) {
      data['article'] = this.article.toJson();
    }
    return data;
  }
}

class Pagination {
  int paginationPageCount;
  List<int> paginationPageNums;

  Pagination({this.paginationPageCount, this.paginationPageNums});

  Pagination.fromJson(Map<String, dynamic> json) {
    paginationPageCount = json['paginationPageCount'];
    paginationPageNums = json['paginationPageNums'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['paginationPageCount'] = this.paginationPageCount;
    data['paginationPageNums'] = this.paginationPageNums;
    return data;
  }
}

class Article {
  int articleCreateTime;
  bool discussionViewable;
  String articleIPFSHash;
  String articleToC;
  List<ArticleComments> articleComments;
  int articleRewardPoint;
  String articleThumbnailURL;
  String articleAuthorName;
  int articleRefCnt;
  int articleType;
  String articleCreateTimeStr;
  int articleViewCount;
  bool articleCommentable;
  String articleAuthorThumbnailURL64;
  String articlePreviewContent;
  String articleContent;
  int articleCommentCount;
  int articlePollCnt;
  int articleAnonymousView;
  String cmtTimeAgo;
  String articleLatestCmtTimeStr;
  String articlePdfURL;
  String articleAuthorThumbnailURL96;
  String articleAuthorThumbnailURL256;
  int articlePerfect;
  int articleEmbeddedAdStatus;
  String articlePermalink;
  int articleContentLength;
  int articleShowInList;
  bool nofollow;
  int articleOriginalIndex;
  String articleAuthorId;
  int articleBadCnt;
  int articlePdfGenerated;
  int articleGoodCnt;
  int articleQnAOfferPoint;
  int articleStickRemains;
  String articleLink;
  String timeAgo;
  String articleUpdateTimeStr;
  bool offered;
  int articleWatchCnt;
  int articleOriginalIndexUpdated;
  String articleAudioURL;
  String articleAuthorThumbnailURL48;
  String articleImg1URL;
  int articlePushOrder;
  int articleCollectCnt;
  String articleTitle;
  String articleTags;
  String oId;
  int articleStick;
  List<ArticleTagObjs> articleTagObjs;
  String target;
  int articleThankCnt;
  String articleRewardContent;
  int articleUpdateTime;
  int articleRefedCnt;
  Commenter articleAuthor;

  Article(
      {this.articleCreateTime,
        this.discussionViewable,
        this.articleIPFSHash,
        this.articleToC,
        this.articleComments,
        this.articleRewardPoint,
        this.articleThumbnailURL,
        this.articleAuthorName,
        this.articleRefCnt,
        this.articleType,
        this.articleCreateTimeStr,
        this.articleViewCount,
        this.articleCommentable,
        this.articleAuthorThumbnailURL64,
        this.articlePreviewContent,
        this.articleContent,
        this.articleCommentCount,
        this.articlePollCnt,
        this.articleAnonymousView,
        this.cmtTimeAgo,
        this.articleLatestCmtTimeStr,
        this.articlePdfURL,
        this.articleAuthorThumbnailURL96,
        this.articleAuthorThumbnailURL256,
        this.articlePerfect,
        this.articleEmbeddedAdStatus,
        this.articlePermalink,
        this.articleContentLength,
        this.articleShowInList,
        this.nofollow,
        this.articleOriginalIndex,
        this.articleAuthorId,
        this.articleBadCnt,
        this.articlePdfGenerated,
        this.articleGoodCnt,
        this.articleQnAOfferPoint,
        this.articleStickRemains,
        this.articleLink,
        this.timeAgo,
        this.articleUpdateTimeStr,
        this.offered,
        this.articleWatchCnt,
        this.articleOriginalIndexUpdated,
        this.articleAudioURL,
        this.articleAuthorThumbnailURL48,
        this.articleImg1URL,
        this.articlePushOrder,
        this.articleCollectCnt,
        this.articleTitle,
        this.articleTags,
        this.oId,
        this.articleStick,
        this.articleTagObjs,
        this.target,
        this.articleThankCnt,
        this.articleRewardContent,
        this.articleUpdateTime,
        this.articleRefedCnt,
        this.articleAuthor});

  Article.fromJson(Map<String, dynamic> json) {
    articleCreateTime = json['articleCreateTime'];
    discussionViewable = json['discussionViewable'];
    articleIPFSHash = json['articleIPFSHash'];
    articleToC = json['articleToC'];
    if (json['articleComments'] != null) {
      articleComments = new List<ArticleComments>();
      json['articleComments'].forEach((v) {
        articleComments.add(new ArticleComments.fromJson(v));
      });
    }
    articleRewardPoint = json['articleRewardPoint'];
    articleThumbnailURL = json['articleThumbnailURL'];
    articleAuthorName = json['articleAuthorName'];
    articleRefCnt = json['articleRefCnt'];
    articleType = json['articleType'];
    articleCreateTimeStr = json['articleCreateTimeStr'];
    articleViewCount = json['articleViewCount'];
    articleCommentable = json['articleCommentable'];
    articleAuthorThumbnailURL64 = json['articleAuthorThumbnailURL64'];
    articlePreviewContent = json['articlePreviewContent'];
    articleContent = json['articleContent'];
    articleCommentCount = json['articleCommentCount'];
    articlePollCnt = json['articlePollCnt'];
    articleAnonymousView = json['articleAnonymousView'];
    cmtTimeAgo = json['cmtTimeAgo'];
    articleLatestCmtTimeStr = json['articleLatestCmtTimeStr'];
    articlePdfURL = json['articlePdfURL'];
    articleAuthorThumbnailURL96 = json['articleAuthorThumbnailURL96'];
    articleAuthorThumbnailURL256 = json['articleAuthorThumbnailURL256'];
    articlePerfect = json['articlePerfect'];
    articleEmbeddedAdStatus = json['articleEmbeddedAdStatus'];
    articlePermalink = json['articlePermalink'];
    articleContentLength = json['articleContentLength'];
    articleShowInList = json['articleShowInList'];
    nofollow = json['nofollow'];
    articleOriginalIndex = json['articleOriginalIndex'];
    articleAuthorId = json['articleAuthorId'];
    articleBadCnt = json['articleBadCnt'];
    articlePdfGenerated = json['articlePdfGenerated'];
    articleGoodCnt = json['articleGoodCnt'];
    articleQnAOfferPoint = json['articleQnAOfferPoint'];
    articleStickRemains = json['articleStickRemains'];
    articleLink = json['articleLink'];
    timeAgo = json['timeAgo'];
    articleUpdateTimeStr = json['articleUpdateTimeStr'];
    offered = json['offered'];
    articleWatchCnt = json['articleWatchCnt'];
    articleOriginalIndexUpdated = json['articleOriginalIndexUpdated'];
    articleAudioURL = json['articleAudioURL'];
    articleAuthorThumbnailURL48 = json['articleAuthorThumbnailURL48'];
    articleImg1URL = json['articleImg1URL'];
    articlePushOrder = json['articlePushOrder'];
    articleCollectCnt = json['articleCollectCnt'];
    articleTitle = json['articleTitle'];
    articleTags = json['articleTags'];
    oId = json['oId'];
    articleStick = json['articleStick'];
    if (json['articleTagObjs'] != null) {
      articleTagObjs = new List<ArticleTagObjs>();
      json['articleTagObjs'].forEach((v) {
        articleTagObjs.add(new ArticleTagObjs.fromJson(v));
      });
    }
    target = json['target'];
    articleThankCnt = json['articleThankCnt'];
    articleRewardContent = json['articleRewardContent'];
    articleUpdateTime = json['articleUpdateTime'];
    articleRefedCnt = json['articleRefedCnt'];
    articleAuthor = json['articleAuthor'] != null
        ? new Commenter.fromJson(json['articleAuthor'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['articleCreateTime'] = this.articleCreateTime;
    data['discussionViewable'] = this.discussionViewable;
    data['articleIPFSHash'] = this.articleIPFSHash;
    data['articleToC'] = this.articleToC;
    if (this.articleComments != null) {
      data['articleComments'] =
          this.articleComments.map((v) => v.toJson()).toList();
    }
    data['articleRewardPoint'] = this.articleRewardPoint;
    data['articleThumbnailURL'] = this.articleThumbnailURL;
    data['articleAuthorName'] = this.articleAuthorName;
    data['articleRefCnt'] = this.articleRefCnt;
    data['articleType'] = this.articleType;
    data['articleCreateTimeStr'] = this.articleCreateTimeStr;
    data['articleViewCount'] = this.articleViewCount;
    data['articleCommentable'] = this.articleCommentable;
    data['articleAuthorThumbnailURL64'] = this.articleAuthorThumbnailURL64;
    data['articlePreviewContent'] = this.articlePreviewContent;
    data['articleContent'] = this.articleContent;
    data['articleCommentCount'] = this.articleCommentCount;
    data['articlePollCnt'] = this.articlePollCnt;
    data['articleAnonymousView'] = this.articleAnonymousView;
    data['cmtTimeAgo'] = this.cmtTimeAgo;
    data['articleLatestCmtTimeStr'] = this.articleLatestCmtTimeStr;
    data['articlePdfURL'] = this.articlePdfURL;
    data['articleAuthorThumbnailURL96'] = this.articleAuthorThumbnailURL96;
    data['articleAuthorThumbnailURL256'] = this.articleAuthorThumbnailURL256;
    data['articlePerfect'] = this.articlePerfect;
    data['articleEmbeddedAdStatus'] = this.articleEmbeddedAdStatus;
    data['articlePermalink'] = this.articlePermalink;
    data['articleContentLength'] = this.articleContentLength;
    data['articleShowInList'] = this.articleShowInList;
    data['nofollow'] = this.nofollow;
    data['articleOriginalIndex'] = this.articleOriginalIndex;
    data['articleAuthorId'] = this.articleAuthorId;
    data['articleBadCnt'] = this.articleBadCnt;
    data['articlePdfGenerated'] = this.articlePdfGenerated;
    data['articleGoodCnt'] = this.articleGoodCnt;
    data['articleQnAOfferPoint'] = this.articleQnAOfferPoint;
    data['articleStickRemains'] = this.articleStickRemains;
    data['articleLink'] = this.articleLink;
    data['timeAgo'] = this.timeAgo;
    data['articleUpdateTimeStr'] = this.articleUpdateTimeStr;
    data['offered'] = this.offered;
    data['articleWatchCnt'] = this.articleWatchCnt;
    data['articleOriginalIndexUpdated'] = this.articleOriginalIndexUpdated;
    data['articleAudioURL'] = this.articleAudioURL;
    data['articleAuthorThumbnailURL48'] = this.articleAuthorThumbnailURL48;
    data['articleImg1URL'] = this.articleImg1URL;
    data['articlePushOrder'] = this.articlePushOrder;
    data['articleCollectCnt'] = this.articleCollectCnt;
    data['articleTitle'] = this.articleTitle;
    data['articleTags'] = this.articleTags;
    data['oId'] = this.oId;
    data['articleStick'] = this.articleStick;
    if (this.articleTagObjs != null) {
      data['articleTagObjs'] =
          this.articleTagObjs.map((v) => v.toJson()).toList();
    }
    data['target'] = this.target;
    data['articleThankCnt'] = this.articleThankCnt;
    data['articleRewardContent'] = this.articleRewardContent;
    data['articleUpdateTime'] = this.articleUpdateTime;
    data['articleRefedCnt'] = this.articleRefedCnt;
    if (this.articleAuthor != null) {
      data['articleAuthor'] = this.articleAuthor.toJson();
    }
    return data;
  }
}

class ArticleComments {
  int commentRefCnt;
  bool commentAuthorViewable;
  String commentCreateTimeStr;
  String commentAuthorId;
  String commentURL;
  int commentCreateTime;
  String commentAuthorURL;
  String commentAuthorThumbnailURL96;
  String timeAgo;
  String commentArticlePermalink;
  String commentOriginalCommentId;
  int commentGoodCnt;
  int commentVisible;
  String commentOnArticleId;
  String commentSharpURL;
  int commentReplyCnt;
  int commentRefedCnt;
  String commentAuthorThumbnailURL64;
  String oId;
  String commentContent;
  Commenter commenter;
  String commentAuthorName;
  String commentAuthorThumbnailURL48;
  int commentThankCnt;
  int commentBadCnt;
  int commentComment2Cnt;
  String commentAuthorThumbnailURL;
  String commentAudioURL;
  int commentQnAOffered;
  List<Null> commentComment2s;
  int commentContentLength;
  String clientCommentId;
  String commentOriginalAuthorThumbnailURL;

  ArticleComments(
      {this.commentRefCnt,
        this.commentAuthorViewable,
        this.commentCreateTimeStr,
        this.commentAuthorId,
        this.commentURL,
        this.commentCreateTime,
        this.commentAuthorURL,
        this.commentAuthorThumbnailURL96,
        this.timeAgo,
        this.commentArticlePermalink,
        this.commentOriginalCommentId,
        this.commentGoodCnt,
        this.commentVisible,
        this.commentOnArticleId,
        this.commentSharpURL,
        this.commentReplyCnt,
        this.commentRefedCnt,
        this.commentAuthorThumbnailURL64,
        this.oId,
        this.commentContent,
        this.commenter,
        this.commentAuthorName,
        this.commentAuthorThumbnailURL48,
        this.commentThankCnt,
        this.commentBadCnt,
        this.commentComment2Cnt,
        this.commentAuthorThumbnailURL,
        this.commentAudioURL,
        this.commentQnAOffered,
        this.commentComment2s,
        this.commentContentLength,
        this.clientCommentId,
        this.commentOriginalAuthorThumbnailURL});

  ArticleComments.fromJson(Map<String, dynamic> json) {
    commentRefCnt = json['commentRefCnt'];

    commentAuthorViewable = json['commentAuthorViewable'];
    commentCreateTimeStr = json['commentCreateTimeStr'];
    commentAuthorId = json['commentAuthorId'];
    commentURL = json['commentURL'];
    commentCreateTime = json['commentCreateTime'];
    commentAuthorURL = json['commentAuthorURL'];
    commentAuthorThumbnailURL96 = json['commentAuthorThumbnailURL96'];
    timeAgo = json['timeAgo'];
    commentArticlePermalink = json['commentArticlePermalink'];
    commentOriginalCommentId = json['commentOriginalCommentId'];
    commentGoodCnt = json['commentGoodCnt'];
    commentVisible = json['commentVisible'];
    commentOnArticleId = json['commentOnArticleId'];
    commentSharpURL = json['commentSharpURL'];
    commentReplyCnt = json['commentReplyCnt'];
    commentRefedCnt = json['commentRefedCnt'];
    commentAuthorThumbnailURL64 = json['commentAuthorThumbnailURL64'];
    oId = json['oId'];
    commentContent = json['commentContent'];
    commenter = json['commenter'] != null
        ? new Commenter.fromJson(json['commenter'])
        : null;
    commentAuthorName = json['commentAuthorName'];
    commentAuthorThumbnailURL48 = json['commentAuthorThumbnailURL48'];
    commentThankCnt = json['commentThankCnt'];
    commentBadCnt = json['commentBadCnt'];
    commentComment2Cnt = json['commentComment2Cnt'];
    commentAuthorThumbnailURL = json['commentAuthorThumbnailURL'];
    commentAudioURL = json['commentAudioURL'];
    commentQnAOffered = json['commentQnAOffered'];

    commentContentLength = json['commentContentLength'];
    clientCommentId = json['clientCommentId'];
    commentOriginalAuthorThumbnailURL =
    json['commentOriginalAuthorThumbnailURL'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['commentRefCnt'] = this.commentRefCnt;

    data['commentAuthorViewable'] = this.commentAuthorViewable;
    data['commentCreateTimeStr'] = this.commentCreateTimeStr;
    data['commentAuthorId'] = this.commentAuthorId;
    data['commentURL'] = this.commentURL;
    data['commentCreateTime'] = this.commentCreateTime;
    data['commentAuthorURL'] = this.commentAuthorURL;
    data['commentAuthorThumbnailURL96'] = this.commentAuthorThumbnailURL96;
    data['timeAgo'] = this.timeAgo;
    data['commentArticlePermalink'] = this.commentArticlePermalink;
    data['commentOriginalCommentId'] = this.commentOriginalCommentId;
    data['commentGoodCnt'] = this.commentGoodCnt;
    data['commentVisible'] = this.commentVisible;
    data['commentOnArticleId'] = this.commentOnArticleId;
    data['commentSharpURL'] = this.commentSharpURL;
    data['commentReplyCnt'] = this.commentReplyCnt;
    data['commentRefedCnt'] = this.commentRefedCnt;
    data['commentAuthorThumbnailURL64'] = this.commentAuthorThumbnailURL64;
    data['oId'] = this.oId;
    data['commentContent'] = this.commentContent;
    if (this.commenter != null) {
      data['commenter'] = this.commenter.toJson();
    }
    data['commentAuthorName'] = this.commentAuthorName;
    data['commentAuthorThumbnailURL48'] = this.commentAuthorThumbnailURL48;
    data['commentThankCnt'] = this.commentThankCnt;
    data['commentBadCnt'] = this.commentBadCnt;
    data['commentComment2Cnt'] = this.commentComment2Cnt;
    data['commentAuthorThumbnailURL'] = this.commentAuthorThumbnailURL;
    data['commentAudioURL'] = this.commentAudioURL;
    data['commentQnAOffered'] = this.commentQnAOffered;

    data['commentContentLength'] = this.commentContentLength;
    data['clientCommentId'] = this.clientCommentId;
    data['commentOriginalAuthorThumbnailURL'] =
        this.commentOriginalAuthorThumbnailURL;
    return data;
  }
}

class Commenter {
  String userHomeBImgDColor;
  String userTags;
  String userURL;
  int userTagCount;
  String userNickname;
  int userComment2Count;
  int userLongestCheckinStreak;
  int userAppRole;
  String userCardBImgURL;
  int userCurrentCheckinStreak;
  int userNo;
  String userAvatarURL;
  String userCardBImgDColor;
  int userPoint;
  int userCommentCount;
  String userIntro;
  int userGeneralRank;
  String oId;
  String userName;
  String userHomeBImgURL;
  int userArticleCount;
  String userRole;

  Commenter(
      {this.userHomeBImgDColor,
        this.userTags,
        this.userURL,
        this.userTagCount,
        this.userNickname,
        this.userComment2Count,
        this.userLongestCheckinStreak,
        this.userAppRole,
        this.userCardBImgURL,
        this.userCurrentCheckinStreak,
        this.userNo,
        this.userAvatarURL,
        this.userCardBImgDColor,
        this.userPoint,
        this.userCommentCount,
        this.userIntro,
        this.userGeneralRank,
        this.oId,
        this.userName,
        this.userHomeBImgURL,
        this.userArticleCount,
        this.userRole});

  Commenter.fromJson(Map<String, dynamic> json) {
    userHomeBImgDColor = json['userHomeBImgDColor'];
    userTags = json['userTags'];
    userURL = json['userURL'];
    userTagCount = json['userTagCount'];
    userNickname = json['userNickname'];
    userComment2Count = json['userComment2Count'];
    userLongestCheckinStreak = json['userLongestCheckinStreak'];
    userAppRole = json['userAppRole'];
    userCardBImgURL = json['userCardBImgURL'];
    userCurrentCheckinStreak = json['userCurrentCheckinStreak'];
    userNo = json['userNo'];
    userAvatarURL = json['userAvatarURL'];
    userCardBImgDColor = json['userCardBImgDColor'];
    userPoint = json['userPoint'];
    userCommentCount = json['userCommentCount'];
    userIntro = json['userIntro'];
    userGeneralRank = json['userGeneralRank'];
    oId = json['oId'];
    userName = json['userName'];
    userHomeBImgURL = json['userHomeBImgURL'];
    userArticleCount = json['userArticleCount'];
    userRole = json['userRole'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userHomeBImgDColor'] = this.userHomeBImgDColor;
    data['userTags'] = this.userTags;
    data['userURL'] = this.userURL;
    data['userTagCount'] = this.userTagCount;
    data['userNickname'] = this.userNickname;
    data['userComment2Count'] = this.userComment2Count;
    data['userLongestCheckinStreak'] = this.userLongestCheckinStreak;
    data['userAppRole'] = this.userAppRole;
    data['userCardBImgURL'] = this.userCardBImgURL;
    data['userCurrentCheckinStreak'] = this.userCurrentCheckinStreak;
    data['userNo'] = this.userNo;
    data['userAvatarURL'] = this.userAvatarURL;
    data['userCardBImgDColor'] = this.userCardBImgDColor;
    data['userPoint'] = this.userPoint;
    data['userCommentCount'] = this.userCommentCount;
    data['userIntro'] = this.userIntro;
    data['userGeneralRank'] = this.userGeneralRank;
    data['oId'] = this.oId;
    data['userName'] = this.userName;
    data['userHomeBImgURL'] = this.userHomeBImgURL;
    data['userArticleCount'] = this.userArticleCount;
    data['userRole'] = this.userRole;
    return data;
  }
}

class ArticleTagObjs {
  int tagShowSideAd;
  String tagIconPath;
  int tagStatus;
  int tagBadCnt;
  double tagRandomDouble;
  int tagViewCount;
  String tagTitle;
  String oId;
  String tagURI;
  String tagAd;
  int tagGoodCnt;
  String tagCSS;
  int tagCommentCount;
  String tagDescriptionText;
  int tagFollowerCount;
  String tagIconPathWithStyle;
  String tagSeoTitle;
  int tagLinkCount;
  String tagSeoDesc;
  int tagReferenceCount;
  String tagSeoKeywords;
  String tagDescription;

  ArticleTagObjs(
      {this.tagShowSideAd,
        this.tagIconPath,
        this.tagStatus,
        this.tagBadCnt,
        this.tagRandomDouble,
        this.tagViewCount,
        this.tagTitle,
        this.oId,
        this.tagURI,
        this.tagAd,
        this.tagGoodCnt,
        this.tagCSS,
        this.tagCommentCount,
        this.tagDescriptionText,
        this.tagFollowerCount,
        this.tagIconPathWithStyle,
        this.tagSeoTitle,
        this.tagLinkCount,
        this.tagSeoDesc,
        this.tagReferenceCount,
        this.tagSeoKeywords,
        this.tagDescription});

  ArticleTagObjs.fromJson(Map<String, dynamic> json) {
    tagShowSideAd = json['tagShowSideAd'];
    tagIconPath = json['tagIconPath'];
    tagStatus = json['tagStatus'];
    tagBadCnt = json['tagBadCnt'];
    tagRandomDouble = json['tagRandomDouble'];
    tagViewCount = json['tagViewCount'];
    tagTitle = json['tagTitle'];
    oId = json['oId'];
    tagURI = json['tagURI'];
    tagAd = json['tagAd'];
    tagGoodCnt = json['tagGoodCnt'];
    tagCSS = json['tagCSS'];
    tagCommentCount = json['tagCommentCount'];
    tagDescriptionText = json['tagDescriptionText'];
    tagFollowerCount = json['tagFollowerCount'];
    tagIconPathWithStyle = json['tagIconPathWithStyle'];
    tagSeoTitle = json['tagSeoTitle'];
    tagLinkCount = json['tagLinkCount'];
    tagSeoDesc = json['tagSeoDesc'];
    tagReferenceCount = json['tagReferenceCount'];
    tagSeoKeywords = json['tagSeoKeywords'];
    tagDescription = json['tagDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tagShowSideAd'] = this.tagShowSideAd;
    data['tagIconPath'] = this.tagIconPath;
    data['tagStatus'] = this.tagStatus;
    data['tagBadCnt'] = this.tagBadCnt;
    data['tagRandomDouble'] = this.tagRandomDouble;
    data['tagViewCount'] = this.tagViewCount;
    data['tagTitle'] = this.tagTitle;
    data['oId'] = this.oId;
    data['tagURI'] = this.tagURI;
    data['tagAd'] = this.tagAd;
    data['tagGoodCnt'] = this.tagGoodCnt;
    data['tagCSS'] = this.tagCSS;
    data['tagCommentCount'] = this.tagCommentCount;
    data['tagDescriptionText'] = this.tagDescriptionText;
    data['tagFollowerCount'] = this.tagFollowerCount;
    data['tagIconPathWithStyle'] = this.tagIconPathWithStyle;
    data['tagSeoTitle'] = this.tagSeoTitle;
    data['tagLinkCount'] = this.tagLinkCount;
    data['tagSeoDesc'] = this.tagSeoDesc;
    data['tagReferenceCount'] = this.tagReferenceCount;
    data['tagSeoKeywords'] = this.tagSeoKeywords;
    data['tagDescription'] = this.tagDescription;
    return data;
  }
}
