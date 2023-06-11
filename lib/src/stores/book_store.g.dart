// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BookStore on _BookStore, Store {
  Computed<bool>? _$isBookFavoriteComputed;

  @override
  bool get isBookFavorite =>
      (_$isBookFavoriteComputed ??= Computed<bool>(() => super.isBookFavorite,
              name: '_BookStore.isBookFavorite'))
          .value;

  late final _$selectedBookModelAtom =
      Atom(name: '_BookStore.selectedBookModel', context: context);

  @override
  BookModel? get selectedBookModel {
    _$selectedBookModelAtom.reportRead();
    return super.selectedBookModel;
  }

  @override
  set selectedBookModel(BookModel? value) {
    _$selectedBookModelAtom.reportWrite(value, super.selectedBookModel, () {
      super.selectedBookModel = value;
    });
  }

  late final _$_BookStoreActionController =
      ActionController(name: '_BookStore', context: context);

  @override
  void setSelectedBookModel(dynamic v) {
    final _$actionInfo = _$_BookStoreActionController.startAction(
        name: '_BookStore.setSelectedBookModel');
    try {
      return super.setSelectedBookModel(v);
    } finally {
      _$_BookStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedBookModel: ${selectedBookModel},
isBookFavorite: ${isBookFavorite}
    ''';
  }
}
