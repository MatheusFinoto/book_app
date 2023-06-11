import 'package:flutter/material.dart';

class BookSimpleInfoItem extends StatelessWidget {
  const BookSimpleInfoItem({super.key, required this.title, this.description});

  final String title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          Text(
            description ?? ' --- ',
            style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
