import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vocabulary_training/models/favourite.dart';
import 'package:vocabulary_training/models/post_favourite.dart';
import 'package:vocabulary_training/services/vocabulary_service.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  final _service = VocabularyService();
  FavouriteCubit() : super(FavouriteInitial());
  fetchFavouritesList() async {
    emit(FavouriteLoading());
    final data = await _service.getAllFavourite();
    emit(FavouriteSuccess(favourites: data));
  }
  updateFavouritesList(List<Favourite> list) async {
    emit(FavouriteSuccess(favourites: list));
  }
  submit(List<Favourite> list) async {
    emit(FavouriteLoading());
    final response = await _service.postAllFavourite(
        PostFavourite(data: Data(title: ["id", "word"],favourite: list)));
    emit(FavouriteSuccess(favourites: list));
  }
}
