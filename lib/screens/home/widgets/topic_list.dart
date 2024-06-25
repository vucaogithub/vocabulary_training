import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:vocabulary_training/models/assignment_model.dart';
import 'package:vocabulary_training/models/topic_model.dart';
import 'package:vocabulary_training/screens/assignment/assignment_screen.dart';
import 'package:vocabulary_training/screens/home/bloc/vocabulary/vocabulary_cubit.dart';
import 'package:vocabulary_training/widgets/common_check_box.dart';

import '../../../widgets/card_shrimer.dart';

class TopicList extends StatefulWidget {
  final List<TopicModel> topics;
  final Function(TopicModel topic) onTopicTap;
  final Future<void> Function() onRefresh;

  const TopicList(
      {super.key,
      required this.topics,
      required this.onRefresh,
      required this.onTopicTap});

  @override
  State<TopicList> createState() => _TopicListState();
}

class _TopicListState extends State<TopicList> {
  bool isSelectAll = false;

  @override
  Widget build(BuildContext context) {
    final isDialOpen = ValueNotifier(false);
    return RefreshIndicator(
      onRefresh: widget.onRefresh,
      child: Scaffold(
        floatingActionButton: SpeedDial(
          openCloseDial: isDialOpen,
          children: [
            SpeedDialChild(
                label: "Take assignment",
                onTap: () async {
                  final listSelected =
                      widget.topics.where((e) => e.isSelected).toList();
                  if (listSelected.isNotEmpty) {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        maintainState: false,
                        builder: (context) {
                          return AssignmentScreen(
                            words: widget.topics
                                .where((e) {
                                  return e.isSelected;
                                })
                                .expand((topic) {
                                  return topic.words;
                                })
                                .map((item) =>
                                    AssignmentItem.fromWordItemModel(item))
                                .toList(),
                          );
                        },
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                          "Please, choose at least topic!",
                          style: TextStyle(color: Colors.black),
                        ),
                        backgroundColor: Colors.amber));
                  }
                },
                child: const Icon(Icons.assignment)),
          ],
          child: const Icon(Icons.menu),
        ),
        body: Column(
          children: [
            Card(
              child: ListTile(
                leading: CommonCheckBox(
                    initValue: isSelectAll,
                    onChanged: (enable) {
                      setState(() {
                        isSelectAll = enable;
                        for (int i = 0; i < widget.topics.length; i++) {
                          widget.topics.elementAt(i).isSelected = enable;
                        }
                      });
                    }),
                title: const Text("Select all topics"),
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
                      itemCount: widget.topics.length,
                      itemBuilder: (context, index) {
                        final item = widget.topics.elementAt(index);
                        return GestureDetector(
                          key: Key(item.isSelected.toString()),
                          onTap: () {
                            widget.onTopicTap.call(item);
                          },
                          child: Card(
                            child: ListTile(
                              leading: CommonCheckBox(
                                  initValue: item.isSelected,
                                  onChanged: (enable) {
                                    item.isSelected = enable;
                                  }),
                              title: Text(item.title),
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
}
