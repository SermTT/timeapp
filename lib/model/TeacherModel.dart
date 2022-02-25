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
  String uid;
  TeacherModel({
    required this.cid,
    required this.classid,
    required this.croom,
    required this.email,
    required this.nroom,
    required this.sid,
    required this.teaname,
    required this.teanum,
    required this.uid,
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
      'uid': uid,
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
      uid: map['uid'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TeacherModel.fromJson(String source) => TeacherModel.fromMap(json.decode(source));
}
