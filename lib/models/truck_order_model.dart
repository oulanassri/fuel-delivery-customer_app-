class TruckOrderModel {
  String? status;
  String? estimatedDeliveryTime;

  TruckOrderModel({this.status, this.estimatedDeliveryTime});

  TruckOrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    estimatedDeliveryTime = json['estimatedDeliveryTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['estimatedDeliveryTime'] = this.estimatedDeliveryTime;
    return data;
  }
}