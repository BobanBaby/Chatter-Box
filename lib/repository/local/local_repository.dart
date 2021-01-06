import 'package:chatter_box/utils/enums.dart';

import 'local_provider.dart';

class LocalRepository {
  LocalProvider _provider;
  LocalRepository(String environment) {
    _provider = LocalProvider();
  }

  String get accessKey => _provider.getAccessKey();
  String get userId => _provider.getUserId().toString();
  String get appLanguage => _provider.getAppLanguage();
  AppTheme get appTheme => _provider.getAppTheme();
  AppFont get appFont => _provider.getAppFont();
  bool get loginStatus => _provider.getLoginStatus();
  String get clearUserData => _provider.clearUserData();

  saveLoginStatus(bool data) {
    _provider.saveLoginStatus(data);
  }

  saveUserID(String data) {
    _provider.saveUserID(data);
  }

  saveAppLanguage(String data) {
    _provider.saveAppLanguage(data);
  }

  saveAppTheme(AppTheme data) {
    _provider.saveAppTheme(data);
  }

  saveAppFont(AppFont data) {
    _provider.saveAppFont(data);
  }
}
