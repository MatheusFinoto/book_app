import 'package:book_app/src/models/book_model.dart';
import 'package:flutter/material.dart';

import '../../../utils/theme.dart';

class CardInfo extends StatelessWidget {
  const CardInfo({super.key, required this.bookModel, required this.onTap});

  final BookModel bookModel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: MyTheme.bg100,
                  image: bookModel.volumeInfo!.imageLinks != null
                      ? DecorationImage(
                          image: NetworkImage(
                              bookModel.volumeInfo!.imageLinks!.thumbnail!),
                          fit: BoxFit.cover)
                      : null,
                  borderRadius: BorderRadius.circular(10)),
              child: bookModel.volumeInfo!.imageLinks == null
                  ? const Center(child: Icon(Icons.broken_image))
                  : Container(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4),
            child: Text(
              bookModel.volumeInfo!.title!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ],
      ),
    );
  }
}
