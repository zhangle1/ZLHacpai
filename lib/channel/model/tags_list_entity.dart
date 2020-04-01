class TagsListEntity {
  int sc;
  String msg;
  String random;
  Data data;

  TagsListEntity({this.sc, this.msg, this.random, this.data});

  TagsListEntity.fromJson(Map<String, dynamic> json) {
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
  List<Tags> tags;

  Data({this.pagination, this.tags});

  Data.fromJson(Map<String, dynamic> json) {
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
    if (json['tags'] != null) {
      tags = new List<Tags>();
      json['tags'].forEach((v) {
        tags.add(new Tags.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pagination != null) {
      data['pagination'] = this.pagination.toJson();
    }
    if (this.tags != null) {
      data['tags'] = this.tags.map((v) => v.toJson()).toList();
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

class Tags {
  String tagIconPath;
  int tagBadCnt;
  String tagTitle;
  String oId;
  String tagURI;
  int tagGoodCnt;
  int tagCommentCount;
  int tagFollowerCount;
  String tagIconPathWithStyle;
  int tagReferenceCount;
  String tagDescription;

  Tags(
      {this.tagIconPath,
        this.tagBadCnt,
        this.tagTitle,
        this.oId,
        this.tagURI,
        this.tagGoodCnt,
        this.tagCommentCount,
        this.tagFollowerCount,
        this.tagIconPathWithStyle,
        this.tagReferenceCount,
        this.tagDescription});

  Tags.fromJson(Map<String, dynamic> json) {
    tagIconPath = json['tagIconPath'];
    tagBadCnt = json['tagBadCnt'];
    tagTitle = json['tagTitle'];
    oId = json['oId'];
    tagURI = json['tagURI'];
    tagGoodCnt = json['tagGoodCnt'];
    tagCommentCount = json['tagCommentCount'];
    tagFollowerCount = json['tagFollowerCount'];
    tagIconPathWithStyle = json['tagIconPathWithStyle'];
    tagReferenceCount = json['tagReferenceCount'];
    tagDescription = json['tagDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tagIconPath'] = this.tagIconPath;
    data['tagBadCnt'] = this.tagBadCnt;
    data['tagTitle'] = this.tagTitle;
    data['oId'] = this.oId;
    data['tagURI'] = this.tagURI;
    data['tagGoodCnt'] = this.tagGoodCnt;
    data['tagCommentCount'] = this.tagCommentCount;
    data['tagFollowerCount'] = this.tagFollowerCount;
    data['tagIconPathWithStyle'] = this.tagIconPathWithStyle;
    data['tagReferenceCount'] = this.tagReferenceCount;
    data['tagDescription'] = this.tagDescription;
    return data;
  }
}
