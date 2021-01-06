import 'package:chatter_box/generated/i18n.dart';
import 'package:chatter_box/repository/local/local_repository.dart';
import 'package:chatter_box/utils/enums.dart';
import 'package:chatter_box/utils/functions.dart';
import 'package:flutter/material.dart';

class SettingsProvider with ChangeNotifier {
  final LocalRepository localRepository;

  SettingsProvider(this.localRepository);

  String get language {
    String _appLanguage = "";
    if (localRepository.appLanguage == null) {
      _appLanguage = UtilFunctions.supportedLanguages.elementAt(0);
    } else {
      _appLanguage = localRepository.appLanguage;
    }
    return _appLanguage;
  }

  String get appFont {
    return localRepository.appFont.toString();
  }

  Locale get locale {
    Locale _locale;
    if (localRepository.appLanguage == null) {
      _locale = I18n.delegate.supportedLocales.elementAt(0);
    } else {
      _locale = I18n.delegate.supportedLocales.elementAt(UtilFunctions
          .supportedLanguages
          .indexWhere((element) => element == localRepository.appLanguage));
    }
    return _locale;
  }

  bool get loginStatus {
    if (localRepository.loginStatus != null) {
      return localRepository.loginStatus;
    } else {
      return false;
    }
  }

  TextTheme textTheme(context) {
    return UtilFunctions.getTextTheme(localRepository.appFont, context);
  }

  AppTheme get appTheme => localRepository.appTheme;

  saveAppLanguage(String lang) {
    localRepository.saveAppLanguage(lang);
    notifyListeners();
  }

  saveAppTheme(AppTheme appTheme) {
    localRepository.saveAppTheme(appTheme);
    notifyListeners();
  }

  saveAppFont(AppFont appFont) {
    localRepository.saveAppFont(appFont);
    notifyListeners();
  }

  resetApp() {
    localRepository.clearUserData;

    notifyListeners();
  }
}
