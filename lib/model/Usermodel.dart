// ignore_for_file: file_names

import 'dart:convert';

class UserModel {
  final String cid;
  final String croom;
  final String email;
  final String nroom;
  final List<String> sid;
  final String stuname;
  final String stunum;
  final String stulastname;
  UserModel({
    required this.cid,
    required this.croom,
    required this.email,
    required this.nroom,
    required this.sid,
    required this.stuname,
    required this.stunum,
    required this.stulastname,
  });
  

  Map<String, dynamic> toMap() {
    return {
      'cid': cid,
      'croom': croom,
      'email': email,
      'nroom': nroom,
      'sid': sid,
      'stuname': stuname,
      'stunum': stunum,
      'stulastname': stulastname,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      cid: map['cid'] ?? '',
      croom: map['croom'] ?? '',
      email: map['email'] ?? '',
      nroom: map['nroom'] ?? '',
      sid: List<String>.from(map['sid']),
      stuname: map['stuname'] ?? '',
      stunum: map['stunum'] ?? '',
      stulastname: map['stulastname'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));
}
