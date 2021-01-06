import 'dart:ui';

import 'package:chatter_box/utils/size_config.dart';
import 'package:flutter/material.dart';

class DataBoxes {
  static const String kSettings = "settings";
}

class DataBoxKey {
  static const String kData = "data";
  static const String kUserID = "user_id";
  static const String kAccessKey = "access_key";
  static const String kLanguage = "language";
  static const String kTheme = "theme";
  static const String kFont = "font";
  static const String kLoginStatus = "login_Status";
}

class Strings {
  static const String kUserID = "user-id";
  static const String kEmailNullError = "Please Enter your email";
  static const String kInvalidEmailError = "Please Enter Valid Email";
  static const String kPassNullError = "Please Enter your password";
  static const String kShortPassError = "Password is too short";
  static const String kMatchPassError = "Passwords don't match";
  static const String kNamelNullError = "Please Enter your name";
  static const String kPhoneNumberNullError = "Please Enter your phone number";
  static const String kAddressNullError = "Please Enter your address";
}

class Paddings {
  static const kPopUp = 24.0;
  static const kTinySpacing = 15;
  static const kSmallSpacing = 30;
  static const kMediumSpacing = 45.0;
  static const kLargeSpacing = 60;
}

class WidgetSizes {
  static const kFabLogo = 250;
}

class AppColors {
  static const Color kPrimaryColor = const Color.fromRGBO(98, 225, 251, 1);
  static const Color kAccentShade = const Color.fromRGBO(137, 232, 183, 1);
  static const Color kDarkThemeBackground = const Color.fromRGBO(36, 36, 36, 1);
  static const Color kLightThemeBackground =
      const Color.fromRGBO(223, 236, 247, 1);
  static const Color kButtonColorBlue = const Color.fromRGBO(16, 79, 174, 1);
}

class AppImages {
  static const String kLogo = 'assets/svg/chat_logo.svg';
  static const String kError = 'assets/svg/error.svg';
  static const String kMail = 'assets/svg/mail.svg';
  static const String kLock = 'assets/svg/lock.svg';
  static const String kFB = 'assets/svg/fb.svg';
  static const String kGoogle = 'assets/svg/google.svg';
}

final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

class APIUrls {}
