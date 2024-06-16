import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary_training/models/word_item_model.dart';
import 'package:vocabulary_training/screens/home/bloc/favourite/favourite_cubit.dart';
import 'package:vocabulary_training/screens/home/bloc/vocabulary/vocabulary_cubit.dart';
import 'package:vocabulary_training/screens/home/widgets/topic_list.dart';
import 'package:vocabulary_training/screens/home/widgets/word_list.dart';

class MainContent extends StatelessWidget {
  const MainContent({
    super.key,
    required this.topics,
    required this.list,
    required this.onRefresh,
  });

  final Future<void> Function() onRefresh;
  final Set<String?> topics;
  final List<WordItemModel> list;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 1,
      child: Column(
        children: [
          const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.topic),
                child: Text("Topic"),
              ),
              Tab(
                icon: Icon(Icons.wordpress),
                child: Text("All words"),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                TopicList(
                  topics: topics.toList(),
                  onRefresh: onRefresh,
                  onTopicTap: (String? topic) {
                    final vocabularyCubit = context.read<VocabularyCubit>();
                    final favouriteCubit = context.read<FavouriteCubit>();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MultiBlocProvider(
                                  providers: [
                                    BlocProvider.value(
                                      value: vocabularyCubit,
                                    ),
                                    BlocProvider.value(
                                      value: favouriteCubit,
                                    ),
                                  ],
                                  child: WordList(
                                      list: list
                                          .where((word) => word.topic == topic)
                                          .toList(),
                                      onRefresh: onRefresh),
                                )));
                  },
                ),
                WordList(
                  onRefresh: onRefresh,
                  list: list,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
