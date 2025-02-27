class PropertiesModel {
  List<CustomerCars>? customerCars;
  List<Null>? customerApartments;

  PropertiesModel({this.customerCars, this.customerApartments});

  PropertiesModel.fromJson(Map<String, dynamic> json) {
    if (json['customerCars'] != null) {
      customerCars = <CustomerCars>[];
      json['customerCars'].forEach((v) {
        customerCars!.add(new CustomerCars.fromJson(v));
      });
    }
    if (json['customerApartments'] != null) {
      customerApartments = <Null>[];
      json['customerApartments'].forEach((v) {
       // customerApartments!.add(new Null.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customerCars != null) {
      data['customerCars'] = this.customerCars!.map((v) => v.toJson()).toList();
    }
    if (this.customerApartments != null) {
    //  data['customerApartments'] =
       //   this.customerApartments!.map((v) => v?.toJson()).toList();
    }
    return data;
  }
}

class CustomerCars {
  String? plateNumber;
  String? brand;
  String? model;
  String? color;
  String? phone;

  CustomerCars(
      {this.plateNumber, this.brand, this.model, this.color, this.phone});

  CustomerCars.fromJson(Map<String, dynamic> json) {
    plateNumber = json['plateNumber'];
    brand = json['brand'];
    model = json['model'];
    color = json['color'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['plateNumber'] = this.plateNumber;
    data['brand'] = this.brand;
    data['model'] = this.model;
    data['color'] = this.color;
    data['phone'] = this.phone;
    return data;
  }
}
