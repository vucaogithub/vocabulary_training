import 'package:vocabulary_training/models/favourite.dart';

class PostFavourite {
  final Data? data;

  PostFavourite({
    this.data,
  });

  factory PostFavourite.fromJson(Map<String, dynamic> json) => PostFavourite(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
  };
}

class Data {
  final List<String>? title;
  final List<Favourite>? favourite;

  Data({
    this.title,
    this.favourite,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    title: json["title"] == null ? [] : List<String>.from(json["title"]!.map((x) => x)),
    favourite: json["favourite"] == null ? [] : List<Favourite>.from(json["favourite"]!.map((x) => Favourite.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "title": title == null ? [] : List<dynamic>.from(title!.map((x) => x)),
    "favourite": favourite == null ? [] : List<dynamic>.from(favourite!.map((x) => x.toJson())),
  };
}

