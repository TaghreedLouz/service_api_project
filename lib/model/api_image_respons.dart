
import 'package:service_api_project/model/order.dart';

class ApiImageRespons {
  int? code;
  bool? success;
  String? message;
  Order? data;

  ApiImageRespons({this.code, this.success, this.message, this.data});

  ApiImageRespons.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    success = json['success'];
    message = json['message'];
    // data = json['data'] != null ? work1.fromJson(json['data']) : null;

    if (json['data'] is Map<String, dynamic>) {
      data = json['data'] != null ? Order.fromJson(json['data']) : null;
    } else if (json['data'] is List<dynamic>) {
      // Handle array response if needed
      // Example: data = parseArrayResponse(json['data']);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}