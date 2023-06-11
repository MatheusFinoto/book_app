// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  late final _$getBooksStatusAtom =
      Atom(name: '_HomeStore.getBooksStatus', context: context);

  @override
  HttpStatus get getBooksStatus {
    _$getBooksStatusAtom.reportRead();
    return super.getBooksStatus;
  }

  @override
  set getBooksStatus(HttpStatus value) {
    _$getBooksStatusAtom.reportWrite(value, super.getBooksStatus, () {
      super.getBooksStatus = value;
    });
  }

  late final _$maxResultsAtom =
      Atom(name: '_HomeStore.maxResults', context: context);

  @override
  int get maxResults {
    _$maxResultsAtom.reportRead();
    return super.maxResults;
  }

  @override
  set maxResults(int value) {
    _$maxResultsAtom.reportWrite(value, super.maxResults, () {
      super.maxResults = value;
    });
  }

  late final _$pageAtom = Atom(name: '_HomeStore.page', context: context);

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  late final _$filterAtom = Atom(name: '_HomeStore.filter', context: context);

  @override
  String get filter {
    _$filterAtom.reportRead();
    return super.filter;
  }

  @override
  set filter(String value) {
    _$filterAtom.reportWrite(value, super.filter, () {
      super.filter = value;
    });
  }

  late final _$filterControllerAtom =
      Atom(name: '_HomeStore.filterController', context: context);

  @override
  TextEditingController get filterController {
    _$filterControllerAtom.reportRead();
    return super.filterController;
  }

  @override
  set filterController(TextEditingController value) {
    _$filterControllerAtom.reportWrite(value, super.filterController, () {
      super.filterController = value;
    });
  }

  late final _$listBookModelAtom =
      Atom(name: '_HomeStore.listBookModel', context: context);

  @override
  ObserverList<BookModel> get listBookModel {
    _$listBookModelAtom.reportRead();
    return super.listBookModel;
  }

  @override
  set listBookModel(ObserverList<BookModel> value) {
    _$listBookModelAtom.reportWrite(value, super.listBookModel, () {
      super.listBookModel = value;
    });
  }

  late final _$getBooksAsyncAction =
      AsyncAction('_HomeStore.getBooks', context: context);

  @override
  Future<void> getBooks() {
    return _$getBooksAsyncAction.run(() => super.getBooks());
  }

  late final _$_HomeStoreActionController =
      ActionController(name: '_HomeStore', context: context);

  @override
  void setMaxResults(dynamic v) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.setMaxResults');
    try {
      return super.setMaxResults(v);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPage(dynamic v) {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.setPage');
    try {
      return super.setPage(v);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFilter(dynamic v) {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.setFilter');
    try {
      return super.setFilter(v);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
getBooksStatus: ${getBooksStatus},
maxResults: ${maxResults},
page: ${page},
filter: ${filter},
filterController: ${filterController},
listBookModel: ${listBookModel}
    ''';
  }
}
