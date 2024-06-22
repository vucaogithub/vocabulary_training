import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:vocabulary_training/models/favourite.dart';
import 'package:vocabulary_training/models/word_item_model.dart';
import 'package:vocabulary_training/screens/assignment/assignment_screen.dart';
import 'package:vocabulary_training/screens/home/bloc/vocabulary/vocabulary_cubit.dart';
import 'package:collection/collection.dart';
import '../home/bloc/favourite/favourite_cubit.dart';
import '../../widgets/card_shrimer.dart';

class WordList extends StatefulWidget {
  final List<WordItemModel> list;
  final Future<void> Function() onRefresh;

  const WordList({super.key, required this.list, required this.onRefresh});

  @override
  State<WordList> createState() => _WordListState();
}

class _WordListState extends State<WordList> {
  final enableSubmit = StreamController.broadcast();
  final List<Favourite> oldList = [];
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);
  late final favouriteCubit = context.read<FavouriteCubit>();
  late final vocabularyCubit = context.read<VocabularyCubit>();

  @override
  void dispose() {
    super.dispose();
    enableSubmit.close();
    isDialOpen.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Navigator.canPop(context)
          ? AppBar(
              centerTitle: true,
              title: const Text("Topic"),
            )
          : null,
      floatingActionButton: StreamBuilder(
          initialData: false,
          stream: enableSubmit.stream,
          builder: (context, snapshot) {
            final enableSubmitBtn = snapshot.data == true;
            return SpeedDial(
              openCloseDial: isDialOpen,
              children: [
                SpeedDialChild(
                    label: "Take assignment",
                    onTap: vocabularyCubit.state is VocabularySuccess
                        ? () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AssignmentScreen(
                                  words: widget.list,
                                ),
                              ),
                            );
                          }
                        : () {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                                    content: Text(
                                      "Please, waiting list loaded!",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    backgroundColor: Colors.amber));
                          },
                    child: const Icon(Icons.assignment)),
                SpeedDialChild(
                    label: "Submit",
                    onTap: enableSubmitBtn
                        ? () {
                            final state = favouriteCubit.state;
                            if (state is FavouriteSuccess) {
                              favouriteCubit.submit(state.favourites);
                              oldList.clear();
                            }
                          }
                        : null,
                    child: StreamBuilder(
                        initialData: false,
                        stream: enableSubmit.stream,
                        builder: (context, snapshot) {
                          return Icon(
                            Icons.upload,
                            color: enableSubmitBtn ? Colors.blue : Colors.grey,
                          );
                        }))
              ],
              child: const Icon(Icons.menu),
            );
          }),
      body: RefreshIndicator(
        onRefresh: widget.onRefresh,
        child: BlocBuilder<VocabularyCubit, VocabularyState>(
          builder: (context, state) {
            Function eq = const DeepCollectionEquality.unordered().equals;
            if (state is VocabularyLoading) {
              return ListView(
                children: List.generate(5, (index) => const ShimmerCard()),
              );
            }
            return ListView.builder(
                itemCount: widget.list.length,
                itemBuilder: (context, index) {
                  final item = widget.list.elementAt(index);
                  return GestureDetector(
                    onTap: (){
                    },
                    child: Card(
                      child: ListTile(
                        title: Text(item.english ?? ''),
                        subtitle: Text(item.meaning.toString()),
                        leading: BlocBuilder<FavouriteCubit, FavouriteState>(
                          builder: (context, state) {
                            if (state is FavouriteLoading) {
                              return const CircularProgressIndicator();
                            } else if (state is FavouriteSuccess) {
                              if (oldList.isEmpty) {
                                oldList.addAll(List.from(state.favourites));
                              }
                              if (oldList.isNotEmpty) {
                                final isEnable = !eq(
                                    oldList.map((e) => e.id).toSet(),
                                    state.favourites.map((e) => e.id).toSet());
                                enableSubmit.sink.add(isEnable);
                              }
                              final isFavourite = state.favourites
                                  .map((element) => element.id)
                                  .toSet()
                                  .toList()
                                  .contains(item.id);
                              return Checkbox(
                                  value: isFavourite,
                                  onChanged: (isChecked) {
                                    if (isChecked != true) {
                                      state.favourites.removeWhere(
                                          (test) => test.id == item.id);
                                    } else {
                                      state.favourites.add(Favourite(
                                          id: item.id, word: item.english));
                                    }
                                    context
                                        .read<FavouriteCubit>()
                                        .updateFavouritesList(state.favourites);
                                  });
                            }
                            return const Icon(Icons.info);
                          },
                        ),
                      ),
                    ),
                  );
                });
          },
        ),
      ),
    );
  }
}
