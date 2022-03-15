import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Timemodel {
  bool state;
  String timecheck;
  Timemodel({
    required this.state,
    required this.timecheck,
  });

  Map<String, dynamic> toMap() {
    return {
      'state': state,
      'timecheck': timecheck,
    };
  }

  factory Timemodel.fromMap(Map<String, dynamic> map) {
    return Timemodel(
      state: map['state'] ?? false,
      timecheck: map['timecheck'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Timemodel.fromJson(String source) => Timemodel.fromMap(json.decode(source));
}
