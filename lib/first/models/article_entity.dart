

 class ArticleEntity{
   Pagination pagination;
   List<Articles> articles;

   ArticleEntity({this.pagination, this.articles});

   ArticleEntity.fromJson(Map<String, dynamic> json) {
     pagination = json['pagination'] != null
         ? new Pagination.fromJson(json['pagination'])
         : null;
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

 class Articles {
   int articleCreateTime;
   String articleIPFSHash;
   String articleThumbnailURL;
   String articleAuthorName;
   int articleRefCnt;
   int articleType;
   String articleCreateTimeStr;
   int articleViewCount;
   String articleAuthorThumbnailURL64;
   String articlePreviewContent;
   int articleCommentCount;
   int articlePollCnt;
   String cmtTimeAgo;
   String articleLatestCmtTimeStr;
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
   int articleGoodCnt;
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
   int articleCollectCnt;
   String articleTitle;
   String articleTags;
   String oId;
   int articleStick;
   List<ArticleTagObjs> articleTagObjs;
   String target;
   int articleThankCnt;
   int articleUpdateTime;
   int articleRefedCnt;
   ArticleAuthor articleAuthor;
   List<ArticleRefSrcs> articleRefSrcs;

   Articles(
       {this.articleCreateTime,
         this.articleIPFSHash,
         this.articleThumbnailURL,
         this.articleAuthorName,
         this.articleRefCnt,
         this.articleType,
         this.articleCreateTimeStr,
         this.articleViewCount,
         this.articleAuthorThumbnailURL64,
         this.articlePreviewContent,
         this.articleCommentCount,
         this.articlePollCnt,
         this.cmtTimeAgo,
         this.articleLatestCmtTimeStr,
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
         this.articleGoodCnt,
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
         this.articleCollectCnt,
         this.articleTitle,
         this.articleTags,
         this.oId,
         this.articleStick,
         this.articleTagObjs,
         this.target,
         this.articleThankCnt,
         this.articleUpdateTime,
         this.articleRefedCnt,
         this.articleAuthor,
         this.articleRefSrcs});

   Articles.fromJson(Map<String, dynamic> json) {
     articleCreateTime = json['articleCreateTime'];
     articleIPFSHash = json['articleIPFSHash'];
     articleThumbnailURL = json['articleThumbnailURL'];
     articleAuthorName = json['articleAuthorName'];
     articleRefCnt = json['articleRefCnt'];
     articleType = json['articleType'];
     articleCreateTimeStr = json['articleCreateTimeStr'];
     articleViewCount = json['articleViewCount'];
     articleAuthorThumbnailURL64 = json['articleAuthorThumbnailURL64'];
     articlePreviewContent = json['articlePreviewContent'];
     articleCommentCount = json['articleCommentCount'];
     articlePollCnt = json['articlePollCnt'];
     cmtTimeAgo = json['cmtTimeAgo'];
     articleLatestCmtTimeStr = json['articleLatestCmtTimeStr'];
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
     articleGoodCnt = json['articleGoodCnt'];
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
     articleUpdateTime = json['articleUpdateTime'];
     articleRefedCnt = json['articleRefedCnt'];
     articleAuthor = json['articleAuthor'] != null
         ? new ArticleAuthor.fromJson(json['articleAuthor'])
         : null;
     if (json['articleRefSrcs'] != null) {
       articleRefSrcs = new List<ArticleRefSrcs>();
       json['articleRefSrcs'].forEach((v) {
         articleRefSrcs.add(new ArticleRefSrcs.fromJson(v));
       });
     }
   }

   Map<String, dynamic> toJson() {
     final Map<String, dynamic> data = new Map<String, dynamic>();
     data['articleCreateTime'] = this.articleCreateTime;
     data['articleIPFSHash'] = this.articleIPFSHash;
     data['articleThumbnailURL'] = this.articleThumbnailURL;
     data['articleAuthorName'] = this.articleAuthorName;
     data['articleRefCnt'] = this.articleRefCnt;
     data['articleType'] = this.articleType;
     data['articleCreateTimeStr'] = this.articleCreateTimeStr;
     data['articleViewCount'] = this.articleViewCount;
     data['articleAuthorThumbnailURL64'] = this.articleAuthorThumbnailURL64;
     data['articlePreviewContent'] = this.articlePreviewContent;
     data['articleCommentCount'] = this.articleCommentCount;
     data['articlePollCnt'] = this.articlePollCnt;
     data['cmtTimeAgo'] = this.cmtTimeAgo;
     data['articleLatestCmtTimeStr'] = this.articleLatestCmtTimeStr;
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
     data['articleGoodCnt'] = this.articleGoodCnt;
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
     data['articleUpdateTime'] = this.articleUpdateTime;
     data['articleRefedCnt'] = this.articleRefedCnt;
     if (this.articleAuthor != null) {
       data['articleAuthor'] = this.articleAuthor.toJson();
     }
     if (this.articleRefSrcs != null) {
       data['articleRefSrcs'] =
           this.articleRefSrcs.map((v) => v.toJson()).toList();
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

 class ArticleRefSrcs {
   int referenceType;
   String referenceAuthorName;
   String referenceTitle;
   String referenceURL;

   ArticleRefSrcs(
       {this.referenceType,
         this.referenceAuthorName,
         this.referenceTitle,
         this.referenceURL});

   ArticleRefSrcs.fromJson(Map<String, dynamic> json) {
     referenceType = json['referenceType'];
     referenceAuthorName = json['referenceAuthorName'];
     referenceTitle = json['referenceTitle'];
     referenceURL = json['referenceURL'];
   }

   Map<String, dynamic> toJson() {
     final Map<String, dynamic> data = new Map<String, dynamic>();
     data['referenceType'] = this.referenceType;
     data['referenceAuthorName'] = this.referenceAuthorName;
     data['referenceTitle'] = this.referenceTitle;
     data['referenceURL'] = this.referenceURL;
     return data;
   }
}