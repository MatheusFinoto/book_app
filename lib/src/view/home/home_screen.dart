import 'package:book_app/src/components/shared/common_loading.dart';
import 'package:book_app/src/components/shared/components.dart';
import 'package:book_app/src/models/book_model.dart';
import 'package:book_app/src/stores/base_store.dart';
import 'package:book_app/src/utils/constants.dart';
import 'package:book_app/src/view/book_details/book_details_screen.dart';
import 'package:book_app/src/view/home/components/card_info.dart';
import 'package:book_app/src/view/home/components/row_favorites.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';

import '../../stores/home_store.dart';
import 'components/column_programming.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final BaseStore baseStore = GetIt.I<BaseStore>();
  HomeStore homeStore = HomeStore();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: SizedBox(
        height: size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                  height:
                      (appBarHeight / 2) + MediaQuery.of(context).padding.top),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Text(
                                AppLocalizations.of(context).hello,
                                style: Theme.of(context).textTheme.titleLarge,
                              ))
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Expanded(
                                  child: Text(
                                AppLocalizations.of(context).subtitle,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Observer(builder: (_) {
                    return PopupMenuButton<Locale>(
                      initialValue: baseStore.selectedLocale,
                      onSelected: (Locale v) => baseStore.setSelectedLocale(v),
                      itemBuilder: (BuildContext context) =>
                          <PopupMenuEntry<Locale>>[
                        PopupMenuItem<Locale>(
                          value: baseStore.listOfLocales[0],
                          child: Row(
                            children: [
                              Container(
                                height: 22,
                                width: 22,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(localeToFlag(
                                            locale: baseStore.listOfLocales[0]
                                                .languageCode)))),
                              ),
                              const SizedBox(width: 4),
                              const Text('Português')
                            ],
                          ),
                        ),
                        PopupMenuItem<Locale>(
                          value: baseStore.listOfLocales[1],
                          child: Row(
                            children: [
                              Container(
                                height: 22,
                                width: 22,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(localeToFlag(
                                            locale: baseStore.listOfLocales[1]
                                                .languageCode)))),
                              ),
                              const SizedBox(width: 4),
                              const Text('English')
                            ],
                          ),
                        ),
                      ],
                    );
                  }),
                ],
              ),

              // const PopupMenuItem<Locale>(
              //   value: Locale.itemOne,
              //   child: Text('Item 1'),
              // ),
              const SizedBox(height: 16),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Observer(
                    builder: (_) {
                      return CustomTextField(
                        onChanged: (v) => homeStore.setFilter(v),
                        controller: homeStore.filterController,
                        hintText: AppLocalizations.of(context).search,
                        onSubmitted: (v) {
                          homeStore.listBookModel.clear();
                          homeStore.setMaxResults(40);
                          homeStore.getBooks();
                        },
                        suffixIcon: homeStore.filter.isNotEmpty
                            ? SizedBox(
                                width: 22,
                                height: 22,
                                child: GestureDetector(
                                  child: const Center(child: Icon(Icons.close)),
                                  onTap: () {
                                    homeStore.filterController.clear();
                                    homeStore.setFilter('');
                                    homeStore.listBookModel.clear();
                                  },
                                ),
                              )
                            : Container(),
                      );
                    },
                  )),

              // i
              const SizedBox(height: 16),
              Observer(builder: (_) {
                if (homeStore.filter.isNotEmpty) {
                  switch (homeStore.getBooksStatus) {
                    case HttpStatus.none:
                      return Container();
                    case HttpStatus.loading:
                      return const CommonLoading();
                    case HttpStatus.success:
                      return SizedBox(
                        height: size.height - 250,
                        child: GridView.builder(
                            padding: const EdgeInsets.only(
                                left: 16, right: 16, bottom: 250),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    childAspectRatio: 2 / 4,
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 8),
                            itemCount: homeStore.listBookModel.length,
                            itemBuilder: (_, i) {
                              BookModel bookModel =
                                  homeStore.listBookModel.elementAt(i);
                              return CardInfo(
                                  bookModel: bookModel,
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                BookDetailsScreen(
                                                    bookModel: bookModel)));
                                  });
                            }),
                      );
                    case HttpStatus.error:
                      return const CommonError();
                    case HttpStatus.fail:
                      return const CommonFail();
                  }
                }

                return const Column(
                  children: [
                    RowFavorites(),
                    SizedBox(height: 16),
                    ColumnProgramming()
                  ],
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
