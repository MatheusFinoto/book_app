// ignore_for_file: library_private_types_in_public_api

import 'dart:convert';

import 'package:book_app/src/models/book_model.dart';
import 'package:book_app/src/utils/constants.dart';
import 'package:book_app/src/utils/local_data.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'base_store.g.dart';

class BaseStore = _BaseStore with _$BaseStore;

abstract class _BaseStore with Store {
  _BaseStore() {
    loadList();
    nPrint(selectedLocale);
  }

  @observable
  bool themeDark = true;

  @action
  void setTheme(value) => themeDark = value;

  @action
  Map<String, String> getHeader() {
    Map<String, String> header = {"Content-Type": "application/json"};
    return header;
  }

  @observable
  ObservableList<BookModel> favoriteBookList = ObservableList();

  @action
  void addFavorite({required BookModel bookModel}) {
    favoriteBookList.add(bookModel);
    saveList();
  }

  @action
  void removeFavorite({required BookModel bookModel}) {
    favoriteBookList.remove(bookModel);
    saveList();
  }

  @action
  Future<void> saveList() async {
    List tempList = [];
    for (var u in favoriteBookList) {
      tempList.add(u.toJson());
    }
    LocalData()
        .saveData(key: 'favorites', value: jsonEncode({"list": tempList}));
  }

  @action
  Future<void> loadList() async {
    dynamic data = await LocalData().loadData(key: 'favorites');
    if (data != null) {
      var response = jsonDecode(data);
      for (var u in response['list']) {
        favoriteBookList.add(BookModel.fromJson(u));
      }
    }
  }

  @observable
  Locale selectedLocale = const Locale('pt', 'BR');

  @action
  void setSelectedLocale(Locale v) => selectedLocale = v;

  @observable
  List<Locale> listOfLocales = const [Locale('pt', 'BR'), Locale('en', 'US')];
}
