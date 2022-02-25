import 'dart:convert';

class PicTables {
  String cid;
  String croom;
  String urlPic;
  PicTables({
    required this.cid,
    required this.croom,
    required this.urlPic,
  });

  Map<String, dynamic> toMap() {
    return {
      'cid': cid,
      'croom': croom,
      'urlPic': urlPic,
    };
  }

  factory PicTables.fromMap(Map<String, dynamic> map) {
    return PicTables(
      cid: map['cid'] ?? '',
      croom: map['croom'] ?? '',
      urlPic: map['urlPic'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PicTables.fromJson(String source) => PicTables.fromMap(json.decode(source));
}
