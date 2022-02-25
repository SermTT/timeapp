import 'dart:convert';

class ScoreModel {
  final String score;
  final String note;
  
  ScoreModel({
    required this.score,
    required this.note,
   
  });

  Map<String, dynamic> toMap() {
    return {
      'score': score,
      'note': note,
      
    };
  }

  factory ScoreModel.fromMap(Map<String, dynamic> map) {
    return ScoreModel(
      score: map['score'],
      note: map['note'],
      
    );
  }

  String toJson() => json.encode(toMap());

  factory ScoreModel.fromJson(String source) =>
      ScoreModel.fromMap(json.decode(source));
}
