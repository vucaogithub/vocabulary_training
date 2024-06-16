part of 'vocabulary_cubit.dart';

@immutable
sealed class VocabularyState {}

final class VocabularyInitial extends VocabularyState {}
final class VocabularySuccess extends VocabularyState {
  final List<WordItemModel> items;

  VocabularySuccess({required this.items});
}
final class VocabularyError extends VocabularyState {
  final String message;

  VocabularyError({required this.message});
}
final class VocabularyLoading extends VocabularyState {}
