import 'package:flutter/material.dart';

import '../../../components/shared/components.dart';
import '../../../components/shared/custom_button_gradient.dart';
import '../../../utils/theme.dart';

class RowActionsBook extends StatelessWidget {
  const RowActionsBook(
      {super.key,
      required this.onFavorite,
      required this.isBookFavorite,
      this.haveBuyLink,
      required this.onShare,
      required this.onBuy});

  final VoidCallback onFavorite;
  final bool isBookFavorite;
  final bool? haveBuyLink;
  final VoidCallback onShare;
  final VoidCallback onBuy;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          CustomIconButton(
              onTap: onFavorite,
              iconData: isBookFavorite ? Icons.favorite : Icons.favorite_border,
              iconColor: isBookFavorite == true ? Colors.red : Colors.black54),
          const SizedBox(width: 8),
          if (haveBuyLink == null) ...[Expanded(child: Container())],
          CustomIconButton(onTap: onShare, iconData: Icons.share),
          const SizedBox(width: 8),
          if (haveBuyLink != null) ...[
            Expanded(
              child: CustomButton(
                  color: MyTheme.primary200,
                  onPressed: onBuy,
                  title: 'COMPRAR'),
            ),
          ]
        ],
      ),
    );
  }
}
