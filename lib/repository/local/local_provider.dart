import 'package:chatter_box/utils/constants.dart';
import 'package:chatter_box/utils/enums.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalProvider {
  static Future<void> initialize(String env) async {
    // final appDocumentDirectory =
    //     await path_provider.getApplicationDocumentsDirectory();
    await Hive.initFlutter();
    await Hive.openBox(DataBoxes.kSettings);
  }

  Box getBox(String boxType) {
    return Hive.box(boxType);
  }

  String getAccessKey() {
    return getBox(DataBoxes.kSettings).get(DataBoxKey.kAccessKey);
  }

  String getUserId() {
    return getBox(DataBoxes.kSettings).get(DataBoxKey.kUserID);
  }

  AppTheme getAppTheme() {
    var theme = getBox(DataBoxes.kSettings).get(DataBoxKey.kTheme);
    AppTheme appTheme;
    theme == null
        ? appTheme = AppTheme.values[0]
        : appTheme = AppTheme.values[int.parse(theme)];
    return appTheme;
  }

  AppFont getAppFont() {
    var font = getBox(DataBoxes.kSettings).get(DataBoxKey.kFont);
    AppFont appFont;
    font == null
        ? appFont = AppFont.values[0]
        : appFont = AppFont.values[int.parse(font)];
    return appFont;
  }

  String getAppLanguage() {
    return getBox(DataBoxes.kSettings).get(DataBoxKey.kLanguage);
  }

  int getUserID() {
    return getBox(DataBoxes.kSettings).get(DataBoxKey.kUserID);
  }

  saveUserID(String data) {
    getBox(DataBoxes.kSettings).put(DataBoxKey.kUserID, data);
  }

  bool getLoginStatus() {
    return getBox(DataBoxes.kSettings).get(DataBoxKey.kLoginStatus);
  }

  saveLoginStatus(bool data) {
    getBox(DataBoxes.kSettings).put(DataBoxKey.kLoginStatus, data);
  }

  saveUserId(int data) {
    getBox(DataBoxes.kSettings).put(DataBoxKey.kUserID, data);
  }

  saveAppLanguage(String data) {
    getBox(DataBoxes.kSettings).put(DataBoxKey.kLanguage, data);
  }

  saveAppTheme(AppTheme data) {
    getBox(DataBoxes.kSettings).put(DataBoxKey.kTheme, data.index.toString());
  }

  saveAppFont(AppFont data) {
    getBox(DataBoxes.kSettings).put(DataBoxKey.kFont, data.index.toString());
  }

  clearUserData() {
    getBox(DataBoxes.kSettings).delete(DataBoxKey.kAccessKey);
    getBox(DataBoxes.kSettings).delete(DataBoxKey.kUserID);
    getBox(DataBoxes.kSettings).delete(DataBoxKey.kTheme);
    getBox(DataBoxes.kSettings).delete(DataBoxKey.kFont);
    getBox(DataBoxes.kSettings).delete(DataBoxKey.kLanguage);
    getBox(DataBoxes.kSettings).delete(DataBoxKey.kLoginStatus);
  }
}
