import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/theme.dart';

// ignore: must_be_immutable
class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.title,
    this.controller,
    required this.onChanged,
    this.onSubmitted,
    this.labelText,
    this.keyboardType,
    this.errorText,
    this.inputFormatters,
    this.prefixIcon,
    this.datePicker,
    this.readOnly,
    this.hintText,
    this.onTap,
    this.mandatory,
    this.focusNode,
    this.suffixIcon,
  }) : super(key: key);

  final ValueChanged<String> onChanged;
  final String? title;
  final TextEditingController? controller;
  final ValueChanged<String>? onSubmitted;
  final String? labelText;
  final TextInputType? keyboardType;
  final String? errorText;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final VoidCallback? datePicker;
  final bool? readOnly;
  final String? hintText;
  final VoidCallback? onTap;
  final bool? mandatory;
  final FocusNode? focusNode;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            title != null
                ? Text(
                    title!,
                    style: Theme.of(context).textTheme.titleSmall,
                  )
                : Container(),
            const SizedBox(
              width: 8,
            ),
            mandatory == true
                ? const Text(
                    '*',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  )
                : Container()
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                onSubmitted: onSubmitted,
                onChanged: onChanged,
                onTap: onTap,
                readOnly: readOnly ?? false,
                controller: controller,
                keyboardType: keyboardType ?? TextInputType.text,
                inputFormatters: inputFormatters ?? [],
                focusNode: focusNode,
                decoration: InputDecoration(
                    filled: true,
                    isDense: true,
                    labelText: labelText,
                    hintText: hintText,
                    errorText: errorText,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16),
                    prefixIcon: prefixIcon,
                    suffixIcon: suffixIcon,
                    suffixIconConstraints:
                        const BoxConstraints(maxHeight: 22, maxWidth: 22),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: MyTheme.primary200,
                            width: 2,
                            style: BorderStyle.solid)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(style: BorderStyle.none)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: Colors.red, width: 2)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide:
                            const BorderSide(color: Colors.red, width: 2)),
                    isCollapsed: true),
              ),
            ),
          ],
        )
      ],
    );
  }
}
