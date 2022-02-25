import 'dart:convert';

class UserModel {
  final String cid;
  final String croom;
  final String email;
  final String nroom;
  final String stuname;
  final String stunum;
  UserModel({
    required this.cid,
    required this.croom,
    required this.email,
    required this.nroom,
    required this.stuname,
    required this.stunum,
  });

  Map<String, dynamic> toMap() {
    return {
      'cid': cid,
      'croom': croom,
      'email': email,
      'nroom': nroom,
      'stuname': stuname,
      'stunum': stunum,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      cid: map['cid'],
      croom: map['croom'],
      email: map['email'],
      nroom: map['nroom'],
      stuname: map['stuname'],
      stunum: map['stunum'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
