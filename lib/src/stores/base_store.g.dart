// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseStore on _BaseStore, Store {
  late final _$themeDarkAtom =
      Atom(name: '_BaseStore.themeDark', context: context);

  @override
  bool get themeDark {
    _$themeDarkAtom.reportRead();
    return super.themeDark;
  }

  @override
  set themeDark(bool value) {
    _$themeDarkAtom.reportWrite(value, super.themeDark, () {
      super.themeDark = value;
    });
  }

  late final _$favoriteBookListAtom =
      Atom(name: '_BaseStore.favoriteBookList', context: context);

  @override
  ObservableList<BookModel> get favoriteBookList {
    _$favoriteBookListAtom.reportRead();
    return super.favoriteBookList;
  }

  @override
  set favoriteBookList(ObservableList<BookModel> value) {
    _$favoriteBookListAtom.reportWrite(value, super.favoriteBookList, () {
      super.favoriteBookList = value;
    });
  }

  late final _$selectedLocaleAtom =
      Atom(name: '_BaseStore.selectedLocale', context: context);

  @override
  Locale get selectedLocale {
    _$selectedLocaleAtom.reportRead();
    return super.selectedLocale;
  }

  @override
  set selectedLocale(Locale value) {
    _$selectedLocaleAtom.reportWrite(value, super.selectedLocale, () {
      super.selectedLocale = value;
    });
  }

  late final _$listOfLocalesAtom =
      Atom(name: '_BaseStore.listOfLocales', context: context);

  @override
  List<Locale> get listOfLocales {
    _$listOfLocalesAtom.reportRead();
    return super.listOfLocales;
  }

  @override
  set listOfLocales(List<Locale> value) {
    _$listOfLocalesAtom.reportWrite(value, super.listOfLocales, () {
      super.listOfLocales = value;
    });
  }

  late final _$saveListAsyncAction =
      AsyncAction('_BaseStore.saveList', context: context);

  @override
  Future<void> saveList() {
    return _$saveListAsyncAction.run(() => super.saveList());
  }

  late final _$loadListAsyncAction =
      AsyncAction('_BaseStore.loadList', context: context);

  @override
  Future<void> loadList() {
    return _$loadListAsyncAction.run(() => super.loadList());
  }

  late final _$_BaseStoreActionController =
      ActionController(name: '_BaseStore', context: context);

  @override
  void setTheme(dynamic value) {
    final _$actionInfo =
        _$_BaseStoreActionController.startAction(name: '_BaseStore.setTheme');
    try {
      return super.setTheme(value);
    } finally {
      _$_BaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  Map<String, String> getHeader() {
    final _$actionInfo =
        _$_BaseStoreActionController.startAction(name: '_BaseStore.getHeader');
    try {
      return super.getHeader();
    } finally {
      _$_BaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addFavorite({required BookModel bookModel}) {
    final _$actionInfo = _$_BaseStoreActionController.startAction(
        name: '_BaseStore.addFavorite');
    try {
      return super.addFavorite(bookModel: bookModel);
    } finally {
      _$_BaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeFavorite({required BookModel bookModel}) {
    final _$actionInfo = _$_BaseStoreActionController.startAction(
        name: '_BaseStore.removeFavorite');
    try {
      return super.removeFavorite(bookModel: bookModel);
    } finally {
      _$_BaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedLocale(Locale v) {
    final _$actionInfo = _$_BaseStoreActionController.startAction(
        name: '_BaseStore.setSelectedLocale');
    try {
      return super.setSelectedLocale(v);
    } finally {
      _$_BaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
themeDark: ${themeDark},
favoriteBookList: ${favoriteBookList},
selectedLocale: ${selectedLocale},
listOfLocales: ${listOfLocales}
    ''';
  }
}
