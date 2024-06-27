import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:vocabulary_training/models/assignment_model.dart';
import 'package:vocabulary_training/models/word_item_model.dart';
import 'package:vocabulary_training/screens/assignment/assignment_screen.dart';
import 'package:vocabulary_training/screens/flash_card/flash_card.dart';

class FloatButtonMenuApp extends StatelessWidget {
  const FloatButtonMenuApp({
    super.key, required this.doUpdateList,
  });
  final List<WordItemModel> Function(List<WordItemModel> words)? doUpdateList;

  @override
  Widget build(BuildContext context) {
    final List<WordItemModel> words = [];
    final isDialOpen = ValueNotifier(false);
    return SpeedDial(
      onOpen: (){
        final data = doUpdateList?.call(words);
        if(data != null){
          words.clear();
          words.addAll(data);
        }
      },
      openCloseDial: isDialOpen,
      children: [
        SpeedDialChild(
            label: "Flash card",
            onTap: () async {
              if (words.isNotEmpty) {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    maintainState: false,
                    builder: (context) => FlashCard(
                      words: words,
                    ),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                      "Please, Choose at least item!",
                      style: TextStyle(color: Colors.black),
                    ),
                    backgroundColor: Colors.amber));
              }
            },
            child: const Icon(Icons.assignment)),
        SpeedDialChild(
            label: "Take assignment",
            onTap: () async {
              if (words.isNotEmpty) {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    maintainState: false,
                    builder: (context) => AssignmentScreen(
                      words: words
                          .map((item) => AssignmentItem.fromWordItemModel(item))
                          .toList(),
                    ),
                  ),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                      "Please, Choose at least item!",
                      style: TextStyle(color: Colors.black),
                    ),
                    backgroundColor: Colors.amber));
              }
            },
            child: const Icon(Icons.assignment)),
      ],
      child: const Icon(Icons.menu),
    );
  }
}
