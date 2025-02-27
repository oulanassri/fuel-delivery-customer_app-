class SearchInfo {
  Geometry? geometry;
  String? type;
  Properties? properties;

  SearchInfo({this.geometry, this.type, this.properties});

  SearchInfo.fromJson(Map<String, dynamic> json) {
    geometry = json['geometry'] != null
        ? new Geometry.fromJson(json['geometry'])
        : null;
    type = json['type'];
    properties = json['properties'] != null
        ? new Properties.fromJson(json['properties'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.geometry != null) {
      data['geometry'] = this.geometry!.toJson();
    }
    data['type'] = this.type;
    if (this.properties != null) {
      data['properties'] = this.properties!.toJson();
    }
    return data;
  }
}

class Geometry {
  List<double>? coordinates;
  String? type;

  Geometry({this.coordinates, this.type});

  Geometry.fromJson(Map<String, dynamic> json) {
    coordinates = json['coordinates'].cast<double>();
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coordinates'] = this.coordinates;
    data['type'] = this.type;
    return data;
  }
}

class Properties {
  String? osmType;
  int? osmId;
  List<double>? extent;
  String? country;
  String? osmKey;
  String? countrycode;
  String? osmValue;
  String? name;
  String? state;
  String? type;

  Properties(
      {this.osmType,
        this.osmId,
        this.extent,
        this.country,
        this.osmKey,
        this.countrycode,
        this.osmValue,
        this.name,
        this.state,
        this.type});

  Properties.fromJson(Map<String, dynamic> json) {
    osmType = json['osm_type'];
    osmId = json['osm_id'];

    country = json['country'];
    osmKey = json['osm_key'];
    countrycode = json['countrycode'];
    osmValue = json['osm_value'];
    name = json['name'];
    state = json['state'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['osm_type'] = this.osmType;
    data['osm_id'] = this.osmId;
    data['extent'] = this.extent;
    data['country'] = this.country;
    data['osm_key'] = this.osmKey;
    data['countrycode'] = this.countrycode;
    data['osm_value'] = this.osmValue;
    data['name'] = this.name;
    data['state'] = this.state;
    data['type'] = this.type;
    return data;
  }
}
