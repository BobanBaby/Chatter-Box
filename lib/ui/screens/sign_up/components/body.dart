import 'package:auto_route/auto_route.dart';
import 'package:chatter_box/providers/data_provider.dart';
import 'package:chatter_box/routes/routes.gr.dart';
import 'package:chatter_box/ui/common/socal_card.dart';
import 'package:chatter_box/utils/constants.dart';
import 'package:chatter_box/utils/functions.dart';
import 'package:chatter_box/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'sign_up_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                SvgPicture.asset(
                  AppImages.kLogo,
                  height: 100,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text("Register Account", style: headingStyle),
                Text(
                  "Complete your details or continue \nwith social media",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignUpForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocalCard(
                      icon: AppImages.kFB,
                      press: () {
                        UtilFunctions.showLoaderDialog(context);
                        Provider.of<DataProvider>(context, listen: false)
                            .continueWithFacebook()
                            .then((_signInInfo) {
                          Navigator.pop(context);
                          if (_signInInfo.status) {
                            ExtendedNavigator.of(context)
                                .popAndPush(Routes.chatHomeScreen);
                          } else {
                            UtilFunctions.showMessage(context,
                                title: "Failed", message: "Signin failed");
                          }
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                Text(
                  'By continuing your confirm that you agree \nwith our Term and Condition',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
