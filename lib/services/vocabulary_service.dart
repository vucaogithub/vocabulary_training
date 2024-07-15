import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:vocabulary_training/models/favourite.dart';
import 'package:vocabulary_training/models/post_favourite.dart';
import 'package:vocabulary_training/models/word_item_model.dart';

class VocabularyService{
  static const baseUrl = "https://script.google.com/macros/s/AKfycbxTrnjeyk54aVDct6hfPY-AZtOjZCUFbA9bffmsooNnvVjKh-t9rf8GhOrOpBFOWSkH2g/exec";

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
}