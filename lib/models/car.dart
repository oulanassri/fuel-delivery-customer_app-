class Car {
  String type, color, yearOfManufacture, plateNumber;

  Car({
    required this.type,
    required this.color,
    required this.yearOfManufacture,
    required this.plateNumber,
  });
}

List carList = [
  Car(
      type: 'KIA',
      color: 'White',
      yearOfManufacture: '2010',
      plateNumber: '223322'),
  Car(
      type: 'KIA',
      color: 'Black',
      yearOfManufacture: '2010',
      plateNumber: '223322'),
];
