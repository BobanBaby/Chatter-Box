import 'package:chatter_box/model/sign_in.dart';
import 'package:chatter_box/model/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FirebaseProvider {
  Future<SignInInfo> emailSignIn({String email, String password}) async {
    final _auth = FirebaseAuth.instance;
    SignInInfo _signInInfo = SignInInfo();
    try {
      final _user = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      if (_user != null) {
        _signInInfo = SignInInfo(status: true, userName: _user.user.email);
      }
    } catch (e) {
      print(e);
    }

    return _signInInfo;
  }

  Future<SignUpInfo> emailSignUp({String email, String password}) async {
    final _auth = FirebaseAuth.instance;
    SignUpInfo _signUpInfo = SignUpInfo();
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (newUser != null) {
        _signUpInfo = SignUpInfo(status: true);
      }
    } catch (e) {
      print(e);
    }
    return _signUpInfo;
  }

  Future<SignInInfo> continueWithFacebook() async {
    SignInInfo _signInInfo = SignInInfo();

    try {
      // by default the login method has the next permissions ['email','public_profile']
      AccessToken accessToken = await FacebookAuth.instance.login();
      print(accessToken.toJson());
      // get the user data
      final userData = await FacebookAuth.instance.getUserData();
      if (userData != null) {
        if (userData.keys.contains("email")) {
          userData.forEach((key, value) {
            if ("email" == key) {
              _signInInfo = SignInInfo(status: true, userName: value);
            }
          });
        } else {
          userData.forEach((key, value) {
            if ("name" == key) {
              _signInInfo = SignInInfo(status: true, userName: value);
            }
          });
        }
      }
    } on FacebookAuthException catch (e) {
      switch (e.errorCode) {
        case FacebookAuthErrorCode.OPERATION_IN_PROGRESS:
          print("You have a previous login operation in progress");
          break;
        case FacebookAuthErrorCode.CANCELLED:
          print("login cancelled");
          break;
        case FacebookAuthErrorCode.FAILED:
          print("login failed");
          break;
      }
    }
    return _signInInfo;
  }

  Future<void> signOutFacebook() async {
    return await FacebookAuth.instance.logOut();
  }
}
