import 'package:collection/collection.dart';

import 'word_item_model.dart';

class AssignmentItem extends WordItemModel {
  AssignmentItem(
      {super.english,
      super.example,
      super.exampleVietnamese,
      super.id,
      super.wordType,
      super.meaning,
      super.phonetics,
      super.topic,
      super.vietnamese});

  bool isDone = false;
  bool isNeedHelp = false;

  factory AssignmentItem.fromWordItemModel(WordItemModel model) {
    final json = model.toJson();
    return AssignmentItem(
      id: json["id"],
      topic: json["topic"],
      english: json["english"],
      wordType: json["word_type"],
      phonetics: json["phonetics"],
      vietnamese: json["vietnamese"],
      meaning: json["meaning"],
      example: json["example"],
      exampleVietnamese: json["example_vietnamese"],
    );
  }

  reset(){
    isDone = false;
    isNeedHelp = false;
  }
}

class AssignmentModel {
  final List<AssignmentItem> assignment;

  AssignmentModel(this.assignment);

  AssignmentItem? get firstOrNull {
    return assignment.firstWhereOrNull((e) {
      return !e.isDone;
    });
  }

  int get wordRemaining => assignment.where((item) {
        return !item.isDone;
      }).length;

  int get numberOfRetrainingList => retrainingList.length;

  List<AssignmentItem> get retrainingList {
    return assignment.where((item) {
      return item.isNeedHelp;
    }).toList();
  }

  int get score =>
      assignment.where((item) => !item.isNeedHelp && item.isDone).length;

  int get numberOfWords => assignment.length;

  moveItemToLast() {
    final item = firstOrNull;
    if (item != null) {
      assignment.remove(item);
      assignment.add(item);
    }
  }

  reset(List<AssignmentItem> words) {
    assignment.clear();
    assignment.addAll(words.map((e){
      e.reset();
      return e;
    }));
    assignment.shuffle();
  }
}
