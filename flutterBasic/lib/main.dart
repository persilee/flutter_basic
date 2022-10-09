import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_basic/model/language_model.dart';
import 'package:flutter_basic/routes/routes.dart';
import 'package:flutter_basic/utils/hive_store.dart';
import 'package:flutter_basic/utils/language.dart';
import 'package:flutter_basic/utils/screen_util.dart';
import 'package:flutter_basic/widgets/common_widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Boxes.openBoxes();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => LanguageModel()),
        ],
        child: const MyApp(),
      ),
    );
    configLoading();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
        WidgetsBinding.instance?.addPostFrameCallback((_) {
          String savedLang = Language.getSaveLanguage();
          context.read<LanguageModel>().selectLanguage(savedLang);
        });
      },
      supportedLocales: S.delegate.supportedLocales,
      navigatorKey: navigatorKey,
      builder: EasyLoading.init(
          builder: (context, child) => MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: Scaffold(
                  resizeToAvoidBottomInset: false,
                  body: GestureDetector(
                      onTap: () {
                        hideKeyboard(context);
                      },
                      child: child),
                ),
              )),
    );
  }

  void hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
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
