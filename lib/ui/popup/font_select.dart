import 'package:chatter_box/providers/settings_provider.dart';
import 'package:chatter_box/utils/enums.dart';
import 'package:chatter_box/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FontSelectPopup extends StatefulWidget {
  FontSelectPopup({Key key}) : super(key: key);

  @override
  _FontSelectPopup createState() => _FontSelectPopup();
}

class _FontSelectPopup extends State<FontSelectPopup> {
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
            height: MediaQuery.of(context).size.height * 0.60,
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(8),
              itemCount: AppFont.values.length,
              itemBuilder: (context, index) {
                final itemAppFont = AppFont.values[index];
                return ListTile(
                  title: Text(itemAppFont.toString().substring(8),
                      style: UtilFunctions.getTextStyle(itemAppFont, context)),
                  onTap: () {
                    Provider.of<SettingsProvider>(context, listen: false)
                        .saveAppFont(itemAppFont);
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
