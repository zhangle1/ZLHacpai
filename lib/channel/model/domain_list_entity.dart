class DoMainListEntity {
  int sc;
  String msg;
  String random;
  Data data;

  DoMainListEntity({this.sc, this.msg, this.random, this.data});

  DoMainListEntity.fromJson(Map<String, dynamic> json) {
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
  List<Domains> domains;

  Data({this.pagination, this.domains});

  Data.fromJson(Map<String, dynamic> json) {
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
    if (json['domains'] != null) {
      domains = new List<Domains>();
      json['domains'].forEach((v) {
        domains.add(new Domains.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pagination != null) {
      data['pagination'] = this.pagination.toJson();
    }
    if (this.domains != null) {
      data['domains'] = this.domains.map((v) => v.toJson()).toList();
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

class Domains {
  String domainTitle;
  String domainIconPath;
  String domainDescription;
  String oId;
  int domainTagCnt;
  String domainURI;

  Domains(
      {this.domainTitle,
        this.domainIconPath,
        this.domainDescription,
        this.oId,
        this.domainTagCnt,
        this.domainURI});

  Domains.fromJson(Map<String, dynamic> json) {
    domainTitle = json['domainTitle'];
    domainIconPath = json['domainIconPath'];
    domainDescription = json['domainDescription'];
    oId = json['oId'];
    domainTagCnt = json['domainTagCnt'];
    domainURI = json['domainURI'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['domainTitle'] = this.domainTitle;
    data['domainIconPath'] = this.domainIconPath;
    data['domainDescription'] = this.domainDescription;
    data['oId'] = this.oId;
    data['domainTagCnt'] = this.domainTagCnt;
    data['domainURI'] = this.domainURI;
    return data;
  }
}
