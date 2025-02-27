class FuelType {
  String type, subType;

  FuelType({
    required this.type,
    required this.subType,
  });
}

List fuelTypeList = [
  FuelType(type: 'مازوت', subType: 'مازوت 94'),
  FuelType(type: 'مازوت', subType: 'مازوت 92'),
  FuelType(type: 'بينزين', subType: 'بينزين 90'),
  FuelType(type: 'بينزين', subType: 'بينزين 95'),
];
