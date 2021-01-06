import 'package:auto_route/auto_route.dart';
import 'package:chatter_box/providers/data_provider.dart';
import 'package:chatter_box/providers/settings_provider.dart';
import 'package:chatter_box/routes/routes.gr.dart';
import 'package:chatter_box/ui/popup/font_select.dart';
import 'package:chatter_box/ui/popup/theme_select.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/body.dart';

class ChatHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            icon: Icon(
              Icons.brightness_4,
              color: Colors.white,
            ),
            onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) => ThemeSelectPopup()),
          ),
          IconButton(
            icon: Icon(
              Icons.font_download,
              color: Colors.white,
            ),
            onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) => FontSelectPopup()),
          ),
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                        content: Text('Do you wanted to logout ?'),
                        actions: [
                          FlatButton(
                            child: Text('Yes'),
                            onPressed: () {
                              Provider.of<DataProvider>(context, listen: false)
                                  .logoutFacebook();
                              Provider.of<SettingsProvider>(context,
                                      listen: false)
                                  .resetApp();
                              ExtendedNavigator.of(context).pushAndRemoveUntil(
                                  Routes.signInScreen,
                                  ModalRoute.withName(Routes.signInScreen));
                            },
                          ),
                          FlatButton(
                            child: Text('No'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ));
            },
          ),
        ],
      ),
      body: Body(),
    );
  }
}
