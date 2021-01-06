import 'dart:math';

import 'package:chatter_box/providers/settings_provider.dart';
import 'package:chatter_box/ui/common/loader.dart';
import 'package:chatter_box/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recase/recase.dart';

import 'enums.dart';

class UtilFunctions {
  static List<String> get supportedLanguages {
    return const <String>[
      'English',
      ' हिन्दी',
      'ಕನ್ನಡ',
    ];
  }

  static String changeCase(String value) {
    return ReCase(value.toLowerCase()).titleCase;
  }

  static bool checkAPIStatus(String status) {
    if (status == 'success') {
      return true;
    } else {
      return false;
    }
  }

  static showLoaderDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      backgroundColor: Colors.transparent,
      content: Center(
        child: Loader(
          color1: AppColors.kPrimaryColor,
          color2: AppColors.kAccentShade,
          color3: AppColors.kPrimaryColor,
        ),
      ),
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  static String getRandomImage(context) {
    return 'assets/random/pic(' + nextInt(1, 24).toString() + ').svg';
  }

  static int nextInt(int min, int max) =>
      min + Random().nextInt((max + 1) - min);

  static showMessage(
    context, {
    String title,
    String message,
  }) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title != null ? title : ""),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message != null ? message : ""),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static TextTheme getTextTheme(AppFont appFont, context) {
    TextTheme textTheme = UtilFunctions.isDarkModeEnabled(context)
        ? ThemeData.dark().textTheme
        : ThemeData.light().textTheme;
    switch (appFont) {
      case AppFont.Montserrat:
        return GoogleFonts.montserratTextTheme(textTheme);
        break;
      case AppFont.Oswald:
        return GoogleFonts.oswaldTextTheme(textTheme);
        break;
      case AppFont.ZillaSlab:
        return GoogleFonts.zillaSlabTextTheme(textTheme);
        break;
      case AppFont.OpenSans:
        return GoogleFonts.openSansTextTheme(textTheme);
        break;
      case AppFont.Bitter:
        return GoogleFonts.bitterTextTheme(textTheme);
        break;
      case AppFont.Raleway:
        return GoogleFonts.ralewayTextTheme(textTheme);
        break;
      case AppFont.NunitoSans:
        return GoogleFonts.nunitoSansTextTheme(textTheme);
        break;
      case AppFont.JosefinSans:
        return GoogleFonts.josefinSansTextTheme(textTheme);
        break;
      case AppFont.Lato:
        return GoogleFonts.latoTextTheme(textTheme);
        break;
      case AppFont.Vollkorn:
        return GoogleFonts.vollkornTextTheme(textTheme);
        break;
      case AppFont.PlayfairDisplay:
        return GoogleFonts.playfairDisplayTextTheme(textTheme);
        break;
      case AppFont.Roboto:
        return GoogleFonts.robotoTextTheme(textTheme);
        break;
      case AppFont.SourceSansPro:
        return GoogleFonts.sourceSansProTextTheme(textTheme);
        break;
      case AppFont.PTSans:
        return GoogleFonts.ptSansTextTheme(textTheme);
        break;
      case AppFont.Merriweather:
        return GoogleFonts.merriweatherTextTheme(textTheme);
        break;
      case AppFont.Oxygen:
        return GoogleFonts.oxygenTextTheme(textTheme);
        break;
      case AppFont.MavenPro:
        return GoogleFonts.mavenProTextTheme(textTheme);
        break;
      case AppFont.Lora:
        return GoogleFonts.loraTextTheme(textTheme);
        break;
      case AppFont.Lobster:
        return GoogleFonts.lobsterTextTheme(textTheme);
        break;
      default:
        return GoogleFonts.robotoTextTheme(textTheme);
    }
  }

  static bool isDarkModeEnabled(context) {
    return Provider.of<SettingsProvider>(context)
            .appTheme
            .toString()
            .toLowerCase()
            .contains("dark")
        ? true
        : false;
  }

  static TextStyle getTextStyle(AppFont appFont, context) {
    switch (appFont) {
      case AppFont.Montserrat:
        return GoogleFonts.montserrat();
        break;
      case AppFont.Oswald:
        return GoogleFonts.oswald();
        break;
      case AppFont.ZillaSlab:
        return GoogleFonts.zillaSlab();
        break;
      case AppFont.OpenSans:
        return GoogleFonts.openSans();
        break;
      case AppFont.Bitter:
        return GoogleFonts.bitter();
        break;
      case AppFont.Raleway:
        return GoogleFonts.raleway();
        break;
      case AppFont.NunitoSans:
        return GoogleFonts.nunitoSans();
        break;
      case AppFont.JosefinSans:
        return GoogleFonts.josefinSans();
        break;
      case AppFont.Lato:
        return GoogleFonts.lato();
        break;
      case AppFont.Vollkorn:
        return GoogleFonts.vollkorn();
        break;
      case AppFont.PlayfairDisplay:
        return GoogleFonts.playfairDisplay();
        break;
      case AppFont.Roboto:
        return GoogleFonts.roboto();
        break;
      case AppFont.SourceSansPro:
        return GoogleFonts.sourceSansPro();
        break;
      case AppFont.PTSans:
        return GoogleFonts.ptSans();
        break;
      case AppFont.Merriweather:
        return GoogleFonts.merriweather();
        break;
      case AppFont.Oxygen:
        return GoogleFonts.oxygen();
        break;
      case AppFont.MavenPro:
        return GoogleFonts.mavenPro();
        break;
      case AppFont.Lora:
        return GoogleFonts.lora();
        break;
      case AppFont.Lobster:
        return GoogleFonts.lobster();
        break;
      default:
        return GoogleFonts.roboto();
    }
  }
}
