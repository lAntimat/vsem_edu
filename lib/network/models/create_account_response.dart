class CreateAccountResponse {
  int code;
  String msg;
  String customerToken;

  CreateAccountResponse({this.code, this.msg, this.customerToken});

  CreateAccountResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];

    if(!hasError()) {
      customerToken = json['details']["customer_token"];
    }
  }

  bool hasError() {
    return code == 1 ? false : true;
  }
}
