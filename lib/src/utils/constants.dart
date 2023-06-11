// import 'package:another_flushbar/flushbar.dart';
// ignore_for_file: unused_local_variable

import 'dart:developer';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

enum HttpStatus { none, loading, success, fail, error }

double appBarHeight = AppBar().preferredSize.height;

Future<void> customFlushBar(
    {required String title,
    required String message,
    required Color color,
    required BuildContext context}) async {
  // ignore: avoid_single_cascade_in_expression_statements
  Flushbar(
    maxWidth: 350,
    margin: const EdgeInsets.all(8),
    borderRadius: BorderRadius.circular(10),
    titleText: Text(
      title,
      style: const TextStyle(color: Colors.white),
    ),
    messageText: Text(
      message,
      style: const TextStyle(color: Colors.white),
    ),
    duration: const Duration(seconds: 2),
    backgroundColor: color,
  )..show(context);
}

String formatPhone({required String phone}) {
  if (phone.substring(0, 2) != "55" || phone.substring(0, 3) != "+55") {
    return "55$phone";
  }

  return phone;
}

void nPrint(message) {
  if (kDebugMode) {
    log(message.toString());
  }
}

Future<void> urlLaunch({required String url}) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri)) {
    throw Exception('Could not launch $uri');
  }
}

String localeToFlag({required String locale}) {
  switch (locale) {
    case "pt":
      return "assets/brasil.png";
    case "en":
      return "assets/eua.png";
    default:
      return '';
  }
}
