import 'dart:convert';

class UserModel {
  final int no;
  final String fullName;
  final String address;

  UserModel({
    required this.no,
    required this.fullName,
    required this.address,
  });

  factory UserModel.fromRawJson(String str) =>
      UserModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        no: json["no"],
        fullName: json["full_name"],
        address: json["address"],
      );

  Map<String, dynamic> toJson() => {
        "no": no,
        "full_name": fullName,
        "address": address,
      };
}
