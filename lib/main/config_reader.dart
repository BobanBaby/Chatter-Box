import 'dart:convert';
import 'package:chatter_box/utils/enums.dart';
import 'package:flutter/services.dart';

abstract class ConfigReader {
  static Map<String, dynamic> _config;

  static Future<void> initialize(String env) async {
    String setting;
    switch (env) {
      case Environment.dev:
        setting = 'config/dev_config.json';
        break;
      case Environment.prod:
        setting = 'config/prod_config.json';
        break;
    }
    final configString = await rootBundle.loadString(setting);
    _config = json.decode(configString) as Map<String, dynamic>;
  }

  static String getBuildType() {
    return _config['build_type'] as String;
  }
}
