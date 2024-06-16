import 'package:equatable/equatable.dart';
class Favourite extends Equatable{
  final int? id;
  final String? word;

  const Favourite({
    this.id,
    this.word,
  });

  factory Favourite.fromJson(Map<String, dynamic> json) => Favourite(
    id: json["id"],
    word: json["word"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "word": word,
  };

  @override
  String toString() {
    return 'Favourite{id: $id, word: $word}';
  }

  @override
  List<Object?> get props => [id,word];
}
