import 'package:service_api_project/model/worker.dart';

class ApiRespons {
  int? code;
  bool? success;
  String? message;
  worker? data;

  ApiRespons({this.code, this.success, this.message, this.data});

  ApiRespons.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new worker.fromJson(json['data']) : null;
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

