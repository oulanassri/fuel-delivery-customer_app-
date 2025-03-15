class PropertiesModel {
  List<CustomerCars>? customerCars;
  List<CustomerApartments>? customerApartments;

  PropertiesModel({this.customerCars, this.customerApartments});

  PropertiesModel.fromJson(Map<String, dynamic> json) {
    if (json['customerCars'] != null) {
      customerCars = <CustomerCars>[];
      json['customerCars'].forEach((v) {
        customerCars!.add(new CustomerCars.fromJson(v));
      });
    }
    if (json['customerApartments'] != null) {
      customerApartments = <CustomerApartments>[];
      json['customerApartments'].forEach((v) {
        customerApartments!.add(new CustomerApartments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.customerCars != null) {
      data['customerCars'] = this.customerCars!.map((v) => v.toJson()).toList();
    }
    if (this.customerApartments != null) {
      data['customerApartments'] =
          this.customerApartments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CustomerCars {
  int? id;
  String? plateNumber;
  String? brand;
  String? model;
  String? color;
  String? phone;

  CustomerCars(
      {this.id,
        this.plateNumber,
        this.brand,
        this.model,
        this.color,
        this.phone});

  CustomerCars.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    plateNumber = json['plateNumber'];
    brand = json['brand'];
    model = json['model'];
    color = json['color'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['plateNumber'] = this.plateNumber;
    data['brand'] = this.brand;
    data['model'] = this.model;
    data['color'] = this.color;
    data['phone'] = this.phone;
    return data;
  }
}

class CustomerApartments {
  int? id;
  String? neighborhoodName;
  String? cityName;
  String? name;
  String? phone;
  double? lat;
  double? long;
  String? locationDescription;

  CustomerApartments(
      {this.id,
        this.neighborhoodName,
        this.cityName,
        this.name,
        this.phone,
        this.lat,
        this.long,
        this.locationDescription});

  CustomerApartments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    neighborhoodName = json['neighborhoodName'];
    cityName = json['cityName'];
    name = json['name'];
    phone = json['phone'];
    lat = json['lat'];
    long = json['long'];
    locationDescription = json['locationDescription'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['neighborhoodName'] = this.neighborhoodName;
    data['cityName'] = this.cityName;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['lat'] = this.lat;
    data['long'] = this.long;
    data['locationDescription'] = this.locationDescription;
    return data;
  }
}
