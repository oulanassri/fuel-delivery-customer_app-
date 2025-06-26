class AuthCodeModel {
  String? authCode;
  String? driverName;
  String? driverPhone;

  AuthCodeModel({this.authCode, this.driverName, this.driverPhone});

  AuthCodeModel.fromJson(Map<String, dynamic> json) {
    authCode = json['authCode'];
    driverName = json['driverName'];
    driverPhone = json['driverPhone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authCode'] = this.authCode;
    data['driverName'] = this.driverName;
    data['driverPhone'] = this.driverPhone;
    return data;
  }
}
