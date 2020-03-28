import 'package:vsem_edu/network/models/base_response2.dart';

class Order {
  String orderId;
  String clientId;
  String merchantId;
  String transType;
  String paymentType;
  String dateCreated;
  String dateCreatedRaw;
  String totalWTax;
  String status;
  String statusRaw;
  String requestCancel;
  String orderLocked;
  String requestCancelStatus;
  String merchantName;
  String logo;
  Null rating;
  String transaction;
  bool addReview;
  bool addCancel;
  String cancelStatus;
  bool addTrack;

  Order(
      {this.orderId,
        this.clientId,
        this.merchantId,
        this.transType,
        this.paymentType,
        this.dateCreated,
        this.dateCreatedRaw,
        this.totalWTax,
        this.status,
        this.statusRaw,
        this.requestCancel,
        this.orderLocked,
        this.requestCancelStatus,
        this.merchantName,
        this.logo,
        this.rating,
        this.transaction,
        this.addReview,
        this.addCancel,
        this.cancelStatus,
        this.addTrack});

  Order.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    clientId = json['client_id'];
    merchantId = json['merchant_id'];
    transType = json['trans_type'];
    paymentType = json['payment_type'];
    dateCreated = json['date_created'];
    dateCreatedRaw = json['date_created_raw'];
    totalWTax = json['total_w_tax'];
    status = json['status'];
    statusRaw = json['status_raw'];
    requestCancel = json['request_cancel'];
    orderLocked = json['order_locked'];
    requestCancelStatus = json['request_cancel_status'];
    merchantName = json['merchant_name'];
    logo = json['logo'];
    rating = json['rating'];
    transaction = json['transaction'];
    addReview = json['add_review'];
    addCancel = json['add_cancel'];
    cancelStatus = json['cancel_status'];
    addTrack = json['add_track'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['client_id'] = this.clientId;
    data['merchant_id'] = this.merchantId;
    data['trans_type'] = this.transType;
    data['payment_type'] = this.paymentType;
    data['date_created'] = this.dateCreated;
    data['date_created_raw'] = this.dateCreatedRaw;
    data['total_w_tax'] = this.totalWTax;
    data['status'] = this.status;
    data['status_raw'] = this.statusRaw;
    data['request_cancel'] = this.requestCancel;
    data['order_locked'] = this.orderLocked;
    data['request_cancel_status'] = this.requestCancelStatus;
    data['merchant_name'] = this.merchantName;
    data['logo'] = this.logo;
    data['rating'] = this.rating;
    data['transaction'] = this.transaction;
    data['add_review'] = this.addReview;
    data['add_cancel'] = this.addCancel;
    data['cancel_status'] = this.cancelStatus;
    data['add_track'] = this.addTrack;
    return data;
  }
}