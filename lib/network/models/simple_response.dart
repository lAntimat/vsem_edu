class SimpleResponse {
  int code;
  String msg;

  SimpleResponse({this.code, this.msg});

  SimpleResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
  }

  bool hasError() {
    return code == 1 ? false : true;
  }
}
