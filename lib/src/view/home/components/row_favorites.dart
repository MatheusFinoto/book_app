import 'package:book_app/src/components/shared/components.dart';
import 'package:book_app/src/stores/base_store.dart';
import 'package:book_app/src/view/book_details/book_details_screen.dart';
import 'package:book_app/src/view/home/components/card_book_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../models/book_model.dart';

class RowFavorites extends StatelessWidget {
  const RowFavorites({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // HomeStore homeStore = HomeStore();
    // homeStore.setFilter('The Google story');
    // homeStore.getBooks();
    final BaseStore baseStore = GetIt.I<BaseStore>();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                  child: Text(AppLocalizations.of(context).favorite,
                      style: Theme.of(context).textTheme.bodyLarge))
            ],
          ),
        ),
        const SizedBox(height: 8),
        Observer(builder: (_) {
          if (baseStore.favoriteBookList.isEmpty) {
            return SizedBox(
              height: 250,
              child: CommonError(
                  texto: AppLocalizations.of(context).empty_favorites),
            );
          }
          return SizedBox(
            height: 250,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.zero,
                itemCount: baseStore.favoriteBookList.length,
                itemBuilder: (_, i) {
                  BookModel bookModel = baseStore.favoriteBookList.elementAt(i);
                  return CardBookColumn(
                    bookModel: bookModel,
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BookDetailsScreen(
                                bookModel: bookModel,
                              )));
                    },
                  );
                }),
          );
        }),
      ],
    );
  }
}
