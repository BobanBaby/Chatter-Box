import 'package:auto_route/auto_route.dart';
import 'package:chatter_box/generated/i18n.dart';
import 'package:chatter_box/providers/connectivity_status_provider.dart';
import 'package:chatter_box/providers/data_provider.dart';
import 'package:chatter_box/providers/settings_provider.dart';
import 'package:chatter_box/repository/local/local_repository.dart';
import 'package:chatter_box/repository/server/server_repository.dart';
import 'package:chatter_box/routes/routes.gr.dart';
import 'package:chatter_box/theme/app_theme.dart';
import 'package:chatter_box/utils/enums.dart';

import 'package:flutter/material.dart' hide Router;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final i18n = I18n.delegate;
    I18n.onLocaleChanged = onLocaleChange;

    return MultiProvider(providers: [
      ChangeNotifierProvider(
          create: (_) => SettingsProvider(GetIt.I<LocalRepository>())),
      ChangeNotifierProvider(
          create: (_) => DataProvider(
              GetIt.I<ServerRepository>(), GetIt.I<LocalRepository>())),
      StreamProvider<ConnectivityStatus>(
        create: (context) =>
            ConnectivityService().connectionStatusController.stream,
      ),
    ], child: AppWidget(i18n: i18n));
  }

  void onLocaleChange(Locale locale) {
    I18n.locale = locale;
  }
}

class AppWidget extends StatelessWidget {
  const AppWidget({
    Key key,
    @required this.i18n,
  }) : super(key: key);

  final GeneratedLocalizationsDelegate i18n;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: appThemeData[Provider.of<SettingsProvider>(context).appTheme]
          .copyWith(
        primaryTextTheme:
            Provider.of<SettingsProvider>(context).textTheme(context),
        textTheme: Provider.of<SettingsProvider>(context).textTheme(context),
      ),
      locale: getCurrentLocale(context),
      localizationsDelegates: [
        i18n,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: i18n.supportedLocales,
      localeResolutionCallback: i18n.resolution(
        fallback: Locale('en', 'US'),
      ),
      builder: ExtendedNavigator<Router>(
        initialRoute: Routes.splashScreen,
        router: Router(),
      ),
    );
  }

  getCurrentLocale(context) {
    I18n.onLocaleChanged(Provider.of<SettingsProvider>(context).locale);
    return Provider.of<SettingsProvider>(context).locale;
  }
}
