import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'src/stores/base_store.dart';

import 'src/utils/environment.dart';
import 'src/utils/theme.dart';
import 'src/view/home/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupManager();
  await dotenv.load(fileName: Environment.fileName);
  runApp(const MyApp());
}

void setupManager() async {
  GetIt.I.registerSingleton(BaseStore());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final BaseStore baseStore = GetIt.I<BaseStore>();
    return Observer(builder: (_) {
      return MaterialApp(
        title: 'Book App',
        theme: MyTheme.lightTheme,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        locale: baseStore.selectedLocale,
        home: const HomeScreen(),
      );
    });
  }
}
