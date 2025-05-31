import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';

void main() {
  runApp(  EasyLocalization(
    supportedLocales: const [Locale('fr'), Locale('ar')],
    path: "assets/translations",
    fallbackLocale: const Locale('ar'),
    startLocale:  const Locale('ar'),
    child: App(),
  ),);
}

