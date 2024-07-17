import 'package:equatable/equatable.dart';

class WordItemModel extends Equatable {
  final int? id;
  final String? topic;
  final String? english;
  final String? phonetics;
  final String? vietnamese;
  final String? meaning;
  final String? example;
  final String? exampleVietnamese;
  final bool? enable;

  bool isSelected = false;

  WordItemModel({
    this.id,
    this.topic,
    this.english,
    this.phonetics,
    this.vietnamese,
    this.meaning,
    this.example,
    this.exampleVietnamese,
    this.enable,
  });

  factory WordItemModel.fromJson(Map<String, dynamic> json) =>
      WordItemModel(
        id: json["id"],
        topic: json["topic"],
        english: json["english"],
        phonetics: json["phonetics"],
        vietnamese: json["vietnamese"],
        meaning: json["meaning"],
        example: json["example"],
        exampleVietnamese: json["example_vietnamese"],
        enable: json["enable"],
      );

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "topic": topic,
        "english": english,
        "phonetics": phonetics,
        "vietnamese": vietnamese,
        "meaning": meaning,
        "example": example,
        "example_vietnamese": exampleVietnamese,
        "enable": enable,
      };

  @override
  List<Object?> get props =>
      [
        id,
        topic,
        english,
        phonetics,
        vietnamese,
        meaning,
        example,
        exampleVietnamese,
        enable,
      ];
}
