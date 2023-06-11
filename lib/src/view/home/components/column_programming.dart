import 'package:book_app/src/components/shared/components.dart';
import 'package:book_app/src/stores/home_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../components/shared/common_loading.dart';
import '../../../models/book_model.dart';
import '../../../utils/constants.dart';
import '../../book_details/book_details_screen.dart';
import 'card_book_row.dart';

class ColumnProgramming extends StatelessWidget {
  const ColumnProgramming({super.key});

  @override
  Widget build(BuildContext context) {
    HomeStore homeStore = HomeStore();
    homeStore.setFilter('flutter');
    homeStore.getBooks();
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                  child: Text('Flutter',
                      style: Theme.of(context).textTheme.bodyLarge))
            ],
          ),
        ),
        const SizedBox(height: 8),
        Observer(builder: (_) {
          switch (homeStore.getBooksStatus) {
            case HttpStatus.none:
              return Container();
            case HttpStatus.loading:
              return const CommonLoading();
            case HttpStatus.success:
              return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  itemCount: homeStore.listBookModel.length,
                  itemBuilder: (_, i) {
                    BookModel bookModel = homeStore.listBookModel.elementAt(i);
                    return CardBookRow(
                      bookModel: bookModel,
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BookDetailsScreen(
                                  bookModel: bookModel,
                                )));
                      },
                    );
                  });
            case HttpStatus.error:
              return const CommonError();
            case HttpStatus.fail:
              return const CommonFail();
          }
        }),
      ],
    );
  }
}
