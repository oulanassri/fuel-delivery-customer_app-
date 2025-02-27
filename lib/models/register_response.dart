class RegisterResponse {
  int? statusCode;
  Data? data;

  RegisterResponse({this.statusCode, this.data});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statusCode'] = this.statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? name;
  String? password;
  String? phone;
  String? email;
  String? createdAt;

  Data({this.name, this.password, this.phone, this.email, this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    password = json['password'];
    phone = json['phone'];
    email = json['email'];
    createdAt = json['createdAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['password'] = this.password;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['createdAt'] = this.createdAt;
    return data;
  }
}
