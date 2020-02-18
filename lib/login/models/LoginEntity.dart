class LoginEntity {
  int sc;
  String msg;
  String userName;
  String token;

  LoginEntity({this.sc, this.msg, this.userName, this.token});

  LoginEntity.fromJson(Map<String, dynamic> json) {
    sc = json['sc'];
    msg = json['msg'];
    userName = json['userName'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sc'] = this.sc;
    data['msg'] = this.msg;
    data['userName'] = this.userName;
    data['token'] = this.token;
    return data;
  }
}