// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';

import 'package:book_app/src/models/book_model.dart';
import 'package:book_app/src/repositories/books_repository.dart';
import 'package:book_app/src/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../utils/environment.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore with Store {
  @observable
  HttpStatus getBooksStatus = HttpStatus.none;

  static String key = '&key=${Environment.apiKey}';

  @observable
  int maxResults = 3;

  @action
  void setMaxResults(v) => maxResults = v;

  @observable
  int page = 0;

  @action
  void setPage(v) => page = v;

  @observable
  String filter = '';

  @action
  void setFilter(v) => filter = v;

  @observable
  TextEditingController filterController = TextEditingController();

  @observable
  ObserverList<BookModel> listBookModel = ObserverList();

  @action
  Future<void> getBooks() async {
    try {
      getBooksStatus = HttpStatus.loading;
      dynamic data = await BooksRepository.get(
          query: '?q=$filter&maxResults=$maxResults$key');
      var response = jsonDecode(data);
      if (response['totalItems'] != 0) {
        for (var u in response['items']) {
          listBookModel.add(BookModel.fromJson(u));
        }

        if (listBookModel.isEmpty) {
          getBooksStatus = HttpStatus.error;
        } else {
          getBooksStatus = HttpStatus.success;
        }
      }
    } catch (e) {
      getBooksStatus = HttpStatus.fail;
    }
  }
}
