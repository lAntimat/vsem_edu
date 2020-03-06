import 'dart:collection';

class BaseResponse<T> {
  int code;
  String msg;
  T data;
  Map<String, dynamic> dataJson;

  BaseResponse({this.code, this.msg, this.data});

  BaseResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];

    if(!hasError()) {
      dataJson = json['details']['data'];
    }
  }

  bool hasError() {
    return code == 1 ? false : true;
  }

}