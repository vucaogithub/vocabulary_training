part of 'favourite_cubit.dart';

@immutable
sealed class FavouriteState {}

final class FavouriteInitial extends FavouriteState {}
final class FavouriteLoading extends FavouriteState {}
final class FavouriteSuccess extends FavouriteState {
  final List<Favourite> favourites;

  FavouriteSuccess({required this.favourites});
}
final class FavouriteError extends FavouriteState {
  final String message;

  FavouriteError({required this.message});
}
