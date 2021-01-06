import 'package:auto_route/auto_route.dart';
import 'package:chatter_box/providers/data_provider.dart';
import 'package:chatter_box/routes/routes.gr.dart';
import 'package:chatter_box/ui/common/custom_surfix_icon.dart';
import 'package:chatter_box/ui/common/default_button.dart';
import 'package:chatter_box/ui/common/form_error.dart';
import 'package:chatter_box/utils/constants.dart';
import 'package:chatter_box/utils/functions.dart';
import 'package:chatter_box/utils/keyboard.dart';
import 'package:chatter_box/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool remember = false;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            press: () async {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                // if all are valid then go to success screen
                KeyboardUtil.hideKeyboard(context);
                UtilFunctions.showLoaderDialog(context);
                Provider.of<DataProvider>(context, listen: false)
                    .signInWithEmailAndPassword(
                        email: email, password: password)
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
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: Strings.kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: Strings.kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: Strings.kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: Strings.kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: AppImages.kLock),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: Strings.kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: Strings.kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: Strings.kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: Strings.kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: AppImages.kMail),
      ),
    );
  }
}
