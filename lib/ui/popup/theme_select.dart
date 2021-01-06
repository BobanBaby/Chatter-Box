import 'package:chatter_box/providers/settings_provider.dart';
import 'package:chatter_box/theme/app_theme.dart';
import 'package:chatter_box/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeSelectPopup extends StatefulWidget {
  ThemeSelectPopup({Key key}) : super(key: key);

  @override
  _ThemeSelectPopup createState() => _ThemeSelectPopup();
}

class _ThemeSelectPopup extends State<ThemeSelectPopup> {
  @override
  void setState(fn) {
    if (this.mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(8),
              itemCount: AppTheme.values.length,
              itemBuilder: (context, index) {
                final itemAppTheme = AppTheme.values[index];
                return Card(
                  color: appThemeData[itemAppTheme].primaryColor,
                  child: ListTile(
                    title: Text(
                      itemAppTheme.toString().substring(9),
                      style: appThemeData[itemAppTheme].textTheme.bodyText2,
                    ),
                    onTap: () {
                      Provider.of<SettingsProvider>(context, listen: false)
                          .saveAppTheme(itemAppTheme);
                      Navigator.of(context).pop();
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
