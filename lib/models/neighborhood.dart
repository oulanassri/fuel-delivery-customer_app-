class NeighborhoodModel {
  int? id;
  int? cityId;
  String? name;

  NeighborhoodModel({this.id, this.cityId, this.name});

  NeighborhoodModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cityId = json['cityId'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cityId'] = this.cityId;
    data['name'] = this.name;
    return data;
  }
}
