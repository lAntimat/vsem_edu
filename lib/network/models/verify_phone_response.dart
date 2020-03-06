class VerifyPhoneResponse {
  int code;
  String msg;
  String token;

  VerifyPhoneResponse({this.code, this.msg, this.token});

  VerifyPhoneResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];

    if(!hasError()) {
      token = json['details']["token"];
    }
  }

  bool hasError() {
    return code == 1 ? false : true;
  }
}
