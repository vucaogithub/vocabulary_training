class WordItemModel {
  final int? id;
  final String? english;
  final String? topic;
  final String? vietnamese;
  final String? meaning;
  final String? example;

  bool isFavourite = false;

  WordItemModel({
    this.id,
    this.topic,
    this.english,
    this.vietnamese,
    this.meaning,
    this.example,
  });

  factory WordItemModel.fromJson(Map<String, dynamic> json) => WordItemModel(
    id: json["id"],
    topic: json["topic"],
    english: json["english"],
    vietnamese: json["vietnamese"],
    meaning: json["meaning"],
    example: json["example"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "topic": topic,
    "english": english,
    "vietnamese": vietnamese,
    "meaning": meaning,
    "example": example,
  };
}
