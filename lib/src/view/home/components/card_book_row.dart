import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../models/book_model.dart';
import '../../../utils/theme.dart';

class CardBookRow extends StatelessWidget {
  const CardBookRow({super.key, required this.bookModel, required this.onTap});

  final BookModel bookModel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        height: 100,
        decoration: BoxDecoration(
            color: MyTheme.bg100, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  image: DecorationImage(
                      image: NetworkImage(
                          bookModel.volumeInfo!.imageLinks!.thumbnail!),
                      fit: BoxFit.cover)),
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.all(8),
              child: SizedBox(
                height: 84,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: AutoSizeText(
                            bookModel.volumeInfo!.title!,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ),
                      ],
                    ),
                    Builder(builder: (_) {
                      String authors = '';

                      if (bookModel.volumeInfo!.authors != null &&
                          bookModel.volumeInfo!.authors!.isNotEmpty) {
                        for (var u in bookModel.volumeInfo!.authors!) {
                          authors += '$u, ';
                        }
                      }

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: AutoSizeText(
                              authors,
                              maxLines: 2,
                              style: Theme.of(context).textTheme.bodySmall,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      );
                    }),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
