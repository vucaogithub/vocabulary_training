import 'word_item_model.dart';

class TopicModel {
  final List<WordItemModel> words;
  final String title;
  bool isSelected = false;

  TopicModel(this.title, {required this.words});
}
