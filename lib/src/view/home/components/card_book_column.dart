import 'package:auto_size_text/auto_size_text.dart';
import 'package:book_app/src/utils/theme.dart';
import 'package:flutter/material.dart';

import '../../../models/book_model.dart';

class CardBookColumn extends StatelessWidget {
  const CardBookColumn(
      {super.key, required this.bookModel, required this.onTap});

  final BookModel bookModel;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          // margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          height: 250,
          width: 150,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Container(
                width: 150,
                height: 200,
                decoration: BoxDecoration(
                    color: MyTheme.bg100,
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(
                            bookModel.volumeInfo!.imageLinks!.thumbnail!),
                        fit: BoxFit.cover)),
              ),
              const SizedBox(height: 4),
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
            ],
          ),
        ),
      ),
    );
  }
}
