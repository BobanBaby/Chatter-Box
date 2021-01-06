import 'package:auto_route/auto_route.dart';
import 'package:chatter_box/routes/routes.gr.dart';
import 'package:chatter_box/utils/constants.dart';
import 'package:chatter_box/utils/size_config.dart';
import 'package:flutter/material.dart';

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account? ",
          style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () {
            ExtendedNavigator.of(context).push(Routes.signUpScreen);
          },
          child: Text(
            "Sign Up",
            style: TextStyle(
                fontSize: getProportionateScreenWidth(16),
                color: AppColors.kPrimaryColor),
          ),
        ),
      ],
    );
  }
}
