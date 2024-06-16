import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:vocabulary_training/models/post_favourite.dart';
import 'package:vocabulary_training/models/word_item_model.dart';
import 'package:vocabulary_training/services/vocabulary_service.dart';

part 'vocabulary_state.dart';

class VocabularyCubit extends Cubit<VocabularyState> {
  final _service = VocabularyService();
  VocabularyCubit() : super(VocabularyInitial());

  fetchWords() async {
    emit(VocabularyLoading());
    final data = await _service.getAllWords();
    emit(VocabularySuccess(items: data));
  }
}
