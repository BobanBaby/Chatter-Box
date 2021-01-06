import 'package:auto_route/auto_route.dart';
import 'package:chatter_box/providers/settings_provider.dart';
import 'package:chatter_box/routes/routes.gr.dart';
import 'package:chatter_box/ui/common/loader.dart';
import 'package:chatter_box/utils/constants.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';

import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BodyState();
  }
}

class BodyState extends State<Body> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  void setState(fn) {
    if (this.mounted) {
      super.setState(fn);
    }
  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 2), onDoneLoading);
  }

  onDoneLoading() async {
    if (!Provider.of<SettingsProvider>(context, listen: false).loginStatus) {
      ExtendedNavigator.of(context).popAndPush(Routes.signInScreen);
    } else {
      ExtendedNavigator.of(context).popAndPush(Routes.chatHomeScreen);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                AppImages.kLogo,
                height: 150,
              ),
              SizedBox(
                height: 100,
              ),
              Loader(
                color1: AppColors.kPrimaryColor,
                color2: AppColors.kAccentShade,
                color3: AppColors.kPrimaryColor,
              ),
              SizedBox(
                height: 50,
              ),
              Text('Demo chat app by Boban')
            ],
          ),
        ),
      ),
    );
  }
}
