import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CustomButtonDefault extends StatelessWidget {
  const CustomButtonDefault(
      {super.key,
      required this.onPressed,
      required this.title,
      this.color,
      this.height,
      this.fontSize,
      this.textColor,
      this.borderColor,
      this.child});

  final VoidCallback? onPressed;
  final String title;
  final double? fontSize;
  final double? height;
  final Color? color;
  final Color? borderColor;
  final Color? textColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height ?? 50,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: borderColor ?? Colors.black54),
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: onPressed,
              child: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: child ??
                      AutoSizeText(
                        maxLines: 1,
                        title,
                        style: TextStyle(
                          color: textColor ?? Colors.black87,
                          fontSize: fontSize ?? 16,
                        ),
                      ),
                ),
              )),
        ));
  }
}
