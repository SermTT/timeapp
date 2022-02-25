import 'dart:convert';

class TeacherModel {
  String cid;
  String classid;
  String croom;
  String email;
  String nroom;
  String sid;
  String teaname;
  String teanum;
  TeacherModel({
    required this.cid,
    required this.classid,
    required this.croom,
    required this.email,
    required this.nroom,
    required this.sid,
    required this.teaname,
    required this.teanum,
  });

  

  Map<String, dynamic> toMap() {
    return {
      'cid': cid,
      'classid': classid,
      'croom': croom,
      'email': email,
      'nroom': nroom,
      'sid': sid,
      'teaname': teaname,
      'teanum': teanum,
    };
  }

  factory TeacherModel.fromMap(Map<String, dynamic> map) {
    return TeacherModel(
      cid: map['cid'] ?? '',
      classid: map['classid'] ?? '',
      croom: map['croom'] ?? '',
      email: map['email'] ?? '',
      nroom: map['nroom'] ?? '',
      sid: map['sid'] ?? '',
      teaname: map['teaname'] ?? '',
      teanum: map['teanum'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TeacherModel.fromJson(String source) => TeacherModel.fromMap(json.decode(source));
}
