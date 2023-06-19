class Order {
  int? id;
  int? userId;
  String? deliveryId;
  int? workId;
  String? details;
  String? detailsAddress;
  String? lat;
  String? long;
  String? phone;
  int? status;
  String? createdAt;
  String? updatedAt;
  List<String>? photoOrder;
  Work? work;

  Order(
      {this.id,
        this.userId,
        this.deliveryId,
        this.workId,
        this.details,
        this.detailsAddress,
        this.lat,
        this.long,
        this.phone,
        this.status,
        this.createdAt,
        this.updatedAt,
        this.photoOrder,
       // this.photoOrder = const [],
        this.work});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    deliveryId = json['delivery_id'];
    workId = json['work_id'];
    details = json['details'];
    detailsAddress = json['details_address'];
    lat = json['lat'];
    long = json['long'];
    phone = json['phone'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['photo_order'] != null) {
      photoOrder = [];
      json['photo_order'].forEach((v) {
        photoOrder!.add(v);
      });
    }
    work = json['work'] != null ? new Work.fromJson(json['work']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['delivery_id'] = this.deliveryId;
    data['work_id'] = this.workId;
    data['details'] = this.details;
    data['details_address'] = this.detailsAddress;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['phone'] = this.phone;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.photoOrder != null) {
      data['photo_order'] = this.photoOrder!.map((v) => v).toList();
    }
    if (this.work != null) {
      data['work'] = this.work!.toJson();
    }
    return data;
  }
}

class Work {
  String? name;
  int? id;

  Work({this.name, this.id});

  Work.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }
}
