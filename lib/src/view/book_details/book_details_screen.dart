import 'package:auto_size_text/auto_size_text.dart';
import 'package:book_app/src/components/shared/components.dart';
import 'package:book_app/src/models/book_model.dart';
import 'package:book_app/src/stores/base_store.dart';
import 'package:book_app/src/stores/book_store.dart';
import 'package:book_app/src/utils/theme.dart';
import 'package:book_app/src/view/book_details/components/row_actions_book.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../utils/constants.dart';
import 'components/book_simple_info.dart';

class BookDetailsScreen extends StatefulWidget {
  const BookDetailsScreen({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  final BaseStore baseStore = GetIt.I<BaseStore>();
  BookStore bookStore = BookStore();

  @override
  void initState() {
    bookStore.setSelectedBookModel(widget.bookModel);
    super.initState();
  }

  void handleFavorite() {
    setState(() {
      bookStore.selectedBookModel!.favorite =
          !bookStore.selectedBookModel!.favorite!;
    });

    if (bookStore.selectedBookModel!.favorite == true) {
      baseStore.addFavorite(bookModel: bookStore.selectedBookModel!);
    } else {
      baseStore.removeFavorite(bookModel: bookStore.selectedBookModel!);
    }
  }

  void handleShare() async {
    final box = context.findRenderObject() as RenderBox?;

    await Share.share(
      bookStore.selectedBookModel!.saleInfo!.buyLink!,
      subject: bookStore.selectedBookModel!.volumeInfo!.title!,
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    );
  }

  void handleBuy() {
    urlLaunch(url: bookStore.selectedBookModel!.saleInfo!.buyLink!);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: CustomIconButton(
                onTap: () => Navigator.of(context).pop(),
                iconData: Icons.adaptive.arrow_back)),
        body: SizedBox(
          height: size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: size.width,
                  height: 200,
                  decoration: BoxDecoration(
                      image:
                          bookStore.selectedBookModel!.volumeInfo!.imageLinks !=
                                  null
                              ? DecorationImage(
                                  image: NetworkImage(
                                      bookStore.selectedBookModel!.volumeInfo!
                                          .imageLinks!.thumbnail!,
                                      scale: 0.5))
                              : null),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        bookStore.selectedBookModel!.volumeInfo!.title!,
                        style: Theme.of(context).textTheme.titleLarge,
                        textAlign: TextAlign.center,
                      )),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Builder(builder: (_) {
                  String authors = '';

                  if (bookStore.selectedBookModel!.volumeInfo!.authors !=
                          null &&
                      bookStore
                          .selectedBookModel!.volumeInfo!.authors!.isNotEmpty) {
                    for (var u
                        in bookStore.selectedBookModel!.volumeInfo!.authors!) {
                      authors += '$u, ';
                    }
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: AutoSizeText(
                            authors,
                            maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: MyTheme.accent200),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                const SizedBox(height: 8),
                if (bookStore.selectedBookModel!.volumeInfo!.categories !=
                    null) ...[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.center,
                      children: bookStore
                          .selectedBookModel!.volumeInfo!.categories!
                          .map((e) {
                        return Chip(
                          backgroundColor: MyTheme.accent100,
                          label: Text(
                            e,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ],
                Observer(builder: (_) {
                  return RowActionsBook(
                      onFavorite: handleFavorite,
                      isBookFavorite: bookStore.isBookFavorite,
                      onShare: handleShare,
                      onBuy: handleBuy);
                }),
                const Divider(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        AppLocalizations.of(context).book_details,
                        style: Theme.of(context).textTheme.titleMedium,
                        textAlign: TextAlign.start,
                      )),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                          child: Text(
                        bookStore.selectedBookModel!.volumeInfo!.description ??
                           AppLocalizations.of(context).no_description,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontWeight: FontWeight.w500),
                        textAlign: TextAlign.start,
                      )),
                    ],
                  ),
                ),
                const Divider(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      BookSimpleInfoItem(
                        title: AppLocalizations.of(context).publisher,
                        description:
                            bookStore.selectedBookModel!.volumeInfo!.publisher,
                      ),
                      BookSimpleInfoItem(
                        title: AppLocalizations.of(context).pages,
                        description: bookStore
                                    .selectedBookModel!.volumeInfo?.pageCount ==
                                null
                            ? null
                            : bookStore.selectedBookModel!.volumeInfo!.pageCount
                                .toString(),
                      ),
                      BookSimpleInfoItem(
                        title: AppLocalizations.of(context).rating,
                        description: bookStore.selectedBookModel!.volumeInfo
                                    ?.ratingsCount ==
                                null
                            ? null
                            : bookStore
                                .selectedBookModel!.volumeInfo!.ratingsCount!
                                .toString(),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: appBarHeight)
              ],
            ),
          ),
        ));
  }
}
