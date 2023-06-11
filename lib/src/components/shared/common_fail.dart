import 'package:flutter/material.dart';
import 'common_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CommonFail extends StatelessWidget {
  const CommonFail({Key? key, this.texto}) : super(key: key);
  final String? texto;
  @override
  Widget build(BuildContext context) {
    return CommonCard(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Row(),
        const SizedBox(
          height: 20,
        ),
        Icon(
          Icons.error_outline_outlined,
          color: Colors.red[300],
          size: 50,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          texto ?? AppLocalizations.of(context).fail,
          style: const TextStyle(
              fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black45),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    ));
  }
}
