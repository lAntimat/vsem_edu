import 'dart:collection';

class BaseResponse2 {
  int code;
  String msg;

  BaseResponse2({this.code, this.msg});

  bool hasError() {
    return code == 1 ? false : true;
  }

}