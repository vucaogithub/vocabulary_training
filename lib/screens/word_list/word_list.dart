import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:vocabulary_training/models/favourite.dart';
import 'package:vocabulary_training/models/word_item_model.dart';
import 'package:vocabulary_training/screens/assignment/assignment_screen.dart';
import 'package:vocabulary_training/screens/home/bloc/vocabulary/vocabulary_cubit.dart';
import 'package:collection/collection.dart';
import 'package:vocabulary_training/widgets/common_check_box.dart';
import 'package:vocabulary_training/widgets/t_t_s_widget.dart';
import '../../widgets/card_shrimer.dart';

class WordList extends StatefulWidget {
  final List<WordItemModel> list;
  final Future<void> Function() onRefresh;

  const WordList({super.key, required this.list, required this.onRefresh});

  @override
  State<WordList> createState() => _WordListState();
}

class _WordListState extends State<WordList> {
  late final vocabularyCubit = context.read<VocabularyCubit>();
  final isDialOpen = ValueNotifier(false);
  bool isSelectAll = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navigator.canPop(context)
          ? AppBar(
              centerTitle: true,
              title: const Text("Topic"),
            )
          : null,
      floatingActionButton: SpeedDial(
        openCloseDial: isDialOpen,
        children: [
          SpeedDialChild(
              label: "Take assignment",
              onTap: () async {
                final listSelected =
                    widget.list.where((e) => e.isSelected).toList();
                if (listSelected.isNotEmpty) {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AssignmentScreen(
                        words: listSelected,
                      ),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        "Please, Choose at least word!",
                        style: TextStyle(color: Colors.black),
                      ),
                      backgroundColor: Colors.amber));
                }
              },
              child: const Icon(Icons.assignment)),
        ],
        child: const Icon(Icons.menu),
      ),
      body: RefreshIndicator(
        onRefresh: widget.onRefresh,
        child: Column(
          children: [
            Card(
              child: ListTile(
                leading: CommonCheckBox(
                    initValue: isSelectAll,
                    onChanged: (enable) {
                      setState(() {
                        isSelectAll = enable;
                        for (int i = 0; i < widget.list.length; i++) {
                          widget.list.elementAt(i).isSelected = enable;
                        }
                      });
                    }),
                title: const Text("Select all words"),
              ),
            ),
            Expanded(
              child: BlocBuilder<VocabularyCubit, VocabularyState>(
                builder: (context, state) {
                  if (state is VocabularyLoading) {
                    return ListView(
                      children:
                          List.generate(5, (index) => const ShimmerCard()),
                    );
                  }
                  return ListView.builder(
                      itemCount: widget.list.length,
                      itemBuilder: (context, index) {
                        final item = widget.list.elementAt(index);
                        return GestureDetector(
                          key: Key(item.isSelected.toString()),
                          onTap: () {
                            showDataPopup(context, item);
                          },
                          child: Card(
                            child: ListTile(
                              title: Text(item.english ?? ''),
                              subtitle: Text(item.meaning.toString()),
                              leading: CommonCheckBox(
                                  initValue: item.isSelected,
                                  onChanged: (isChecked) {
                                    item.isSelected = isChecked;
                                  }),
                            ),
                          ),
                        );
                      });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showDataPopup(BuildContext context, WordItemModel item) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text("${item.english}"),
              ),
              TTSWidget(
                text: item.english,
              )
            ],
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                _buildRowContent(title: "Phonetics", content: item.phonetics),
                _buildRowContent(title: "Vietnamese", content: item.vietnamese),
                _buildRowContent(title: "Meaning", content: item.meaning),
                const Divider(),
                _buildRowContent(title: "Example"),
                SelectableText(
                  "${item.example}",
                ),
                SelectableText(
                  '${item.exampleVietnamese}',
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Column _buildRowContent({required String title, String? content}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('$title: ', style: const TextStyle(fontWeight: FontWeight.bold)),
        if (content != null)
          Flexible(
            child: SelectableText(content),
          )
      ],
    );
  }
}
