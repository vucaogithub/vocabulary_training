import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary_training/screens/home/bloc/vocabulary/vocabulary_cubit.dart';

import 'card_shrimer.dart';

class TopicList extends StatelessWidget {
  final List<String?> topics;
  final Function(String? topic) onTopicTap;
  final Future<void> Function() onRefresh;

  const TopicList(
      {super.key,
      required this.topics,
      required this.onRefresh,
      required this.onTopicTap});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: onRefresh,
      child: BlocBuilder<VocabularyCubit, VocabularyState>(
        builder: (context, state) {
          if (state is VocabularyLoading) {
            return ListView(
              children: List.generate(5, (index) => const ShimmerCard()),
            );
          }
          return ListView.builder(
              itemCount: topics.length,
              itemBuilder: (context, index) {
                final item = topics.elementAt(index).toString();
                return GestureDetector(
                  onTap: () {
                    onTopicTap.call(item);
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(item),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
