class OrdersModel {
  String? date;
  String? orderNumber;
  String? locationDescription;
  String? neighborhoodName;
  String? fuelTypeName;
  int? orderedQuantity;
  Null? price;
  Null? finalQuantity;
  Null? finalPrice;
  Null? customerCarBrand;
  String? customerApartmentName;
  String? authCode;

  OrdersModel(
      {this.date,
        this.orderNumber,
        this.locationDescription,
        this.neighborhoodName,
        this.fuelTypeName,
        this.orderedQuantity,
        this.price,
        this.finalQuantity,
        this.finalPrice,
        this.customerCarBrand,
        this.customerApartmentName,
        this.authCode});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    orderNumber = json['orderNumber'];
    locationDescription = json['locationDescription'];
    neighborhoodName = json['neighborhoodName'];
    fuelTypeName = json['fuelTypeName'];
    orderedQuantity = json['orderedQuantity'];
    price = json['price'];
    finalQuantity = json['finalQuantity'];
    finalPrice = json['finalPrice'];
    customerCarBrand = json['customerCarBrand'];
    customerApartmentName = json['customerApartmentName'];
    authCode = json['authCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['orderNumber'] = this.orderNumber;
    data['locationDescription'] = this.locationDescription;
    data['neighborhoodName'] = this.neighborhoodName;
    data['fuelTypeName'] = this.fuelTypeName;
    data['orderedQuantity'] = this.orderedQuantity;
    data['price'] = this.price;
    data['finalQuantity'] = this.finalQuantity;
    data['finalPrice'] = this.finalPrice;
    data['customerCarBrand'] = this.customerCarBrand;
    data['customerApartmentName'] = this.customerApartmentName;
    data['authCode'] = this.authCode;
    return data;
  }
}
