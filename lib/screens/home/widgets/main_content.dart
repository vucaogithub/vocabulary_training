import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vocabulary_training/models/topic_model.dart';
import 'package:vocabulary_training/models/word_item_model.dart';
import 'package:vocabulary_training/screens/home/bloc/vocabulary/vocabulary_cubit.dart';
import 'package:vocabulary_training/screens/topic_list_screen/topic_list_screen.dart';
import 'package:vocabulary_training/screens/word_list/word_list.dart';

class MainContent extends StatelessWidget {
  const MainContent({
    super.key,
    required this.topics,
    required this.list,
    required this.onRefresh,
  });

  final Future<void> Function() onRefresh;
  final Set<TopicModel> topics;
  final List<WordItemModel> list;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
            color: Colors.blue,
            child: const TabBar(
              labelColor: Colors.white,
              indicatorColor: Colors.transparent,
              labelStyle: TextStyle(fontSize: 18),
              unselectedLabelStyle: TextStyle(fontSize: 14),
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
          ),
          Expanded(
            child: TabBarView(
              children: [
                TopicList(
                  topics: topics.toList(),
                  onRefresh: onRefresh,
                  onTopicTap: (TopicModel topic) {
                    final vocabularyCubit = context.read<VocabularyCubit>();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MultiBlocProvider(
                                  providers: [
                                    BlocProvider.value(
                                      value: vocabularyCubit,
                                    ),
                                  ],
                                  child: WordList(
                                      list: topic.words,
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
