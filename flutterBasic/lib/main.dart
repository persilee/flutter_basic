import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_basic/model/language_model.dart';
import 'package:flutter_basic/pages/utils/hive_store.dart';
import 'package:flutter_basic/pages/utils/language.dart';
import 'package:flutter_basic/pages/utils/screen_util.dart';
import 'package:flutter_basic/routes/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Boxes.openBoxes();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LanguageModel()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(width: 360, height: 920, allowFontScaling: true);
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: createMaterialColor(const Color(0xff3161CE)),
      ),
      initialRoute: pageWelcome,
      routes: appRoutes,
      onGenerateRoute: (settings) => onGenerateRoute(settings),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        _initLang(locale);
      },
      supportedLocales: S.delegate.supportedLocales,
    );
  }

  _initLang(Locale? deviceLocale) {
    print(deviceLocale?.languageCode);
    String lang = 'en';
    switch (deviceLocale?.languageCode) {
      case 'zh':
        lang = 'zh_CN';
        break;
      case 'km':
        lang = 'km_KH';
        break;
    }
    String savedLang = Language.getSaveLanguage();
  }

  MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    final swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}
