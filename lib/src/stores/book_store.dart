// ignore_for_file: library_private_types_in_public_api

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../models/book_model.dart';
import 'base_store.dart';
part 'book_store.g.dart';

class BookStore = _BookStore with _$BookStore;

abstract class _BookStore with Store {
  final BaseStore baseStore = GetIt.I<BaseStore>();
  @observable
  BookModel? selectedBookModel;

  @action
  void setSelectedBookModel(v) => selectedBookModel = v;

  @computed
  bool get isBookFavorite {
    var a = baseStore.favoriteBookList
        .where((element) => element.id == selectedBookModel!.id)
        .toList();
    if (a.isNotEmpty) {
      return true;
    }

    return false;
  }
}
