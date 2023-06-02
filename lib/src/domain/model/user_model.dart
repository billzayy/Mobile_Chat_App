class UserModel {
  UserModel({
    this.idUser,
    this.username,
    this.password,
    this.email,
    this.fullname,
    this.pictures,
    this.city,
    this.phones,
    this.status,
  });

  UserModel.fromJson(dynamic json) {
    idUser = json['Id_User'];
    username = json['Username'];
    password = json['Password'];
    email = json['Email'];
    fullname = json['Fullname'];
    pictures = json['Pictures'];
    city = json['City'];
    phones = json['Phones'];
    status = json['Status'];
  }
  int? idUser;
  String? username;
  String? password;
  String? email;
  String? fullname;
  String? pictures;
  String? city;
  String? phones;
  String? status;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Id_User'] = idUser;
    map['Username'] = username;
    map['Password'] = password;
    map['Email'] = email;
    map['Fullname'] = fullname;
    map['Pictures'] = pictures;
    map['City'] = city;
    map['Phones'] = phones;
    map['Status'] = status;
    return map;
  }
}
