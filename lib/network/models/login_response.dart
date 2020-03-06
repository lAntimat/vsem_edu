class LoginResponse {
  int code;
  String msg;
  String token;

  LoginResponse({this.code, this.msg, this.token});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];

    if(!hasError()) {
      token = json['details']['client_info']["token"];
    }
  }

  bool hasError() {
    return code == 1 ? false : true;
  }
}
