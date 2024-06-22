import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nested/nested.dart';
import 'package:vocabulary_training/models/topic_model.dart';
import 'package:vocabulary_training/models/word_item_model.dart';
import 'package:vocabulary_training/screens/home/bloc/vocabulary/vocabulary_cubit.dart';
import 'package:vocabulary_training/screens/home/widgets/main_content.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final vocabularyCubit = VocabularyCubit();

  List<SingleChildWidget> _initProviders() {
    return [
      BlocProvider(
        create: (context) => vocabularyCubit..fetchWords(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: _initProviders(),
      child: Scaffold(
        body: Center(
          child: BlocBuilder<VocabularyCubit, VocabularyState>(
              builder: (context, state) {
            final topics = <TopicModel>[];
            final list = <WordItemModel>[];
            if (state is VocabularySuccess) {
              list.addAll(state.items);
              final topicName = list.map((e) => e.topic).toSet();
              topics.addAll(topicName.map((e) {
                return TopicModel("$e",
                    words: list.where((test) {
                      return test.topic == e;
                    }).toList());
              }).toSet());
            }
            return MainContent(
              onRefresh: () => Future.sync(() => vocabularyCubit.fetchWords()),
              topics: topics.toSet(),
              list: list,
            );
          }),
        ),
      ),
    );
  }
}
