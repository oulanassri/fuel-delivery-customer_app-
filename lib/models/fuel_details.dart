class FuelDetailsModel {
  int? id;
  String? fuelTypeName;
  String? centerName;
  int? price;

  FuelDetailsModel({this.id, this.fuelTypeName, this.centerName, this.price});

  FuelDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fuelTypeName = json['fuelTypeName'];
    centerName = json['centerName'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fuelTypeName'] = this.fuelTypeName;
    data['centerName'] = this.centerName;
    data['price'] = this.price;
    return data;
  }
}
