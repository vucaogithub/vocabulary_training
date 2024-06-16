import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:vocabulary_training/models/favourite.dart';
import 'package:vocabulary_training/models/post_favourite.dart';
import 'package:vocabulary_training/models/word_item_model.dart';

class VocabularyService{
  static const baseUrl = "https://script.google.com/macros/s/AKfycbymiC5Om3-np90B3c6apdX9YHGK-UX6L9u084hLgpOISL3R7w22KCkxeCD0axf1luuMZQ/exec";

  VocabularyService();

  Future<List<WordItemModel>> getAllWords() async {
    const endPoint = baseUrl;
    final data = await Dio().get(endPoint,queryParameters: {
      "type":"GET_ALL_WORDS"
    });
    final list = data.data as List<dynamic>;
    final response = list.map((jsonString) {
      final item = WordItemModel.fromJson((jsonString));
      return item;
    }).toList();
    return response;
  }
  Future<List<Favourite>> getAllFavourite() async {
    const endPoint = baseUrl;
    final data = await Dio().get(endPoint,queryParameters: {
      "type":"GET_MY_FAVOURIST"
    });
    final list = data.data as List<dynamic>;
    final response = list.map((jsonString) {
      final item = Favourite.fromJson((jsonString));
      return item;
    }).toList();
    return response;
  }
  Future<dynamic> postAllFavourite(PostFavourite payload) async {
    const endPoint = baseUrl;
    final data = await Dio().post(endPoint,data: payload.toJson());
    return data;
  }
}