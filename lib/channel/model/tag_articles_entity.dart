
class TagArticlesEntity {
  Pagination pagination;
  Tag tag;
  List<Articles> articles;

  TagArticlesEntity({this.pagination, this.tag, this.articles});

  TagArticlesEntity.fromJson(Map<String, dynamic> json) {
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
    tag = json['tag'] != null ? new Tag.fromJson(json['tag']) : null;
    if (json['articles'] != null) {
      articles = new List<Articles>();
      json['articles'].forEach((v) {
        articles.add(new Articles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pagination != null) {
      data['pagination'] = this.pagination.toJson();
    }
    if (this.tag != null) {
      data['tag'] = this.tag.toJson();
    }
    if (this.articles != null) {
      data['articles'] = this.articles.map((v) => v.toJson()).toList();
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

class Tag {
  String tagIconPath;
  int tagBadCnt;
  int tagViewCount;
  String tagTitle;
  String oId;
  String tagURI;
  int tagGoodCnt;
  int tagCommentCount;
  int tagFollowerCount;
  String tagIconPathWithStyle;
  int tagLinkCount;
  int tagReferenceCount;
  String tagDescription;

  Tag(
      {this.tagIconPath,
        this.tagBadCnt,
        this.tagViewCount,
        this.tagTitle,
        this.oId,
        this.tagURI,
        this.tagGoodCnt,
        this.tagCommentCount,
        this.tagFollowerCount,
        this.tagIconPathWithStyle,
        this.tagLinkCount,
        this.tagReferenceCount,
        this.tagDescription});

  Tag.fromJson(Map<String, dynamic> json) {
    tagIconPath = json['tagIconPath'];
    tagBadCnt = json['tagBadCnt'];
    tagViewCount = json['tagViewCount'];
    tagTitle = json['tagTitle'];
    oId = json['oId'];
    tagURI = json['tagURI'];
    tagGoodCnt = json['tagGoodCnt'];
    tagCommentCount = json['tagCommentCount'];
    tagFollowerCount = json['tagFollowerCount'];
    tagIconPathWithStyle = json['tagIconPathWithStyle'];

    tagLinkCount = json['tagLinkCount'];
    tagReferenceCount = json['tagReferenceCount'];
    tagDescription = json['tagDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tagIconPath'] = this.tagIconPath;
    data['tagBadCnt'] = this.tagBadCnt;
    data['tagViewCount'] = this.tagViewCount;
    data['tagTitle'] = this.tagTitle;
    data['oId'] = this.oId;
    data['tagURI'] = this.tagURI;
    data['tagGoodCnt'] = this.tagGoodCnt;
    data['tagCommentCount'] = this.tagCommentCount;
    data['tagFollowerCount'] = this.tagFollowerCount;
    data['tagIconPathWithStyle'] = this.tagIconPathWithStyle;

    data['tagLinkCount'] = this.tagLinkCount;
    data['tagReferenceCount'] = this.tagReferenceCount;
    data['tagDescription'] = this.tagDescription;
    return data;
  }
}

class Articles {
  bool nofollow;
  int articleOriginalIndex;
  int articleCreateTime;
  String articleAuthorId;
  int articleGoodCnt;
  String articleThumbnailURL;
  int articleStickRemains;
  String articleLink;
  String timeAgo;
  String articleUpdateTimeStr;
  String articleAuthorName;
  int articleType;
  bool offered;
  String articleCreateTimeStr;
  int articleViewCount;
  String articleAuthorThumbnailURL64;
  String articlePreviewContent;
  String articleAuthorThumbnailURL48;
  int articleCommentCount;
  int articlePollCnt;
  String articleTitle;
  String articleTags;
  String oId;
  String cmtTimeAgo;
  int articleStick;
  List<ArticleTagObjs> articleTagObjs;
  String articleLatestCmtTimeStr;
  String target;
  String articleAuthorThumbnailURL96;
  int articleUpdateTime;
  String articleAuthorThumbnailURL256;
  int articlePerfect;
  String articlePermalink;
  ArticleAuthor articleAuthor;

  Articles(
      {this.nofollow,
        this.articleOriginalIndex,
        this.articleCreateTime,
        this.articleAuthorId,
        this.articleGoodCnt,
        this.articleThumbnailURL,
        this.articleStickRemains,
        this.articleLink,
        this.timeAgo,
        this.articleUpdateTimeStr,
        this.articleAuthorName,
        this.articleType,
        this.offered,
        this.articleCreateTimeStr,
        this.articleViewCount,
        this.articleAuthorThumbnailURL64,
        this.articlePreviewContent,
        this.articleAuthorThumbnailURL48,
        this.articleCommentCount,
        this.articlePollCnt,
        this.articleTitle,
        this.articleTags,
        this.oId,
        this.cmtTimeAgo,
        this.articleStick,
        this.articleTagObjs,
        this.articleLatestCmtTimeStr,
        this.target,
        this.articleAuthorThumbnailURL96,
        this.articleUpdateTime,
        this.articleAuthorThumbnailURL256,
        this.articlePerfect,
        this.articlePermalink,
        this.articleAuthor});

  Articles.fromJson(Map<String, dynamic> json) {
    nofollow = json['nofollow'];
    articleOriginalIndex = json['articleOriginalIndex'];
    articleCreateTime = json['articleCreateTime'];
    articleAuthorId = json['articleAuthorId'];
    articleGoodCnt = json['articleGoodCnt'];
    articleThumbnailURL = json['articleThumbnailURL'];
    articleStickRemains = json['articleStickRemains'];
    articleLink = json['articleLink'];
    timeAgo = json['timeAgo'];
    articleUpdateTimeStr = json['articleUpdateTimeStr'];
    articleAuthorName = json['articleAuthorName'];
    articleType = json['articleType'];
    offered = json['offered'];
    articleCreateTimeStr = json['articleCreateTimeStr'];
    articleViewCount = json['articleViewCount'];
    articleAuthorThumbnailURL64 = json['articleAuthorThumbnailURL64'];
    articlePreviewContent = json['articlePreviewContent'];
    articleAuthorThumbnailURL48 = json['articleAuthorThumbnailURL48'];
    articleCommentCount = json['articleCommentCount'];
    articlePollCnt = json['articlePollCnt'];
    articleTitle = json['articleTitle'];
    articleTags = json['articleTags'];
    oId = json['oId'];
    cmtTimeAgo = json['cmtTimeAgo'];
    articleStick = json['articleStick'];
    if (json['articleTagObjs'] != null) {
      articleTagObjs = new List<ArticleTagObjs>();
      json['articleTagObjs'].forEach((v) {
        articleTagObjs.add(new ArticleTagObjs.fromJson(v));
      });
    }
    articleLatestCmtTimeStr = json['articleLatestCmtTimeStr'];
    target = json['target'];
    articleAuthorThumbnailURL96 = json['articleAuthorThumbnailURL96'];
    articleUpdateTime = json['articleUpdateTime'];
    articleAuthorThumbnailURL256 = json['articleAuthorThumbnailURL256'];
    articlePerfect = json['articlePerfect'];
    articlePermalink = json['articlePermalink'];
    articleAuthor = json['articleAuthor'] != null
        ? new ArticleAuthor.fromJson(json['articleAuthor'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nofollow'] = this.nofollow;
    data['articleOriginalIndex'] = this.articleOriginalIndex;
    data['articleCreateTime'] = this.articleCreateTime;
    data['articleAuthorId'] = this.articleAuthorId;
    data['articleGoodCnt'] = this.articleGoodCnt;
    data['articleThumbnailURL'] = this.articleThumbnailURL;
    data['articleStickRemains'] = this.articleStickRemains;
    data['articleLink'] = this.articleLink;
    data['timeAgo'] = this.timeAgo;
    data['articleUpdateTimeStr'] = this.articleUpdateTimeStr;
    data['articleAuthorName'] = this.articleAuthorName;
    data['articleType'] = this.articleType;
    data['offered'] = this.offered;
    data['articleCreateTimeStr'] = this.articleCreateTimeStr;
    data['articleViewCount'] = this.articleViewCount;
    data['articleAuthorThumbnailURL64'] = this.articleAuthorThumbnailURL64;
    data['articlePreviewContent'] = this.articlePreviewContent;
    data['articleAuthorThumbnailURL48'] = this.articleAuthorThumbnailURL48;
    data['articleCommentCount'] = this.articleCommentCount;
    data['articlePollCnt'] = this.articlePollCnt;
    data['articleTitle'] = this.articleTitle;
    data['articleTags'] = this.articleTags;
    data['oId'] = this.oId;
    data['cmtTimeAgo'] = this.cmtTimeAgo;
    data['articleStick'] = this.articleStick;
    if (this.articleTagObjs != null) {
      data['articleTagObjs'] =
          this.articleTagObjs.map((v) => v.toJson()).toList();
    }
    data['articleLatestCmtTimeStr'] = this.articleLatestCmtTimeStr;
    data['target'] = this.target;
    data['articleAuthorThumbnailURL96'] = this.articleAuthorThumbnailURL96;
    data['articleUpdateTime'] = this.articleUpdateTime;
    data['articleAuthorThumbnailURL256'] = this.articleAuthorThumbnailURL256;
    data['articlePerfect'] = this.articlePerfect;
    data['articlePermalink'] = this.articlePermalink;
    if (this.articleAuthor != null) {
      data['articleAuthor'] = this.articleAuthor.toJson();
    }
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

class ArticleAuthor {
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

  ArticleAuthor(
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

  ArticleAuthor.fromJson(Map<String, dynamic> json) {
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
