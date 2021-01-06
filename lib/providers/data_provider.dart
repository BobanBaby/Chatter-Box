import 'package:chatter_box/model/sign_in.dart';
import 'package:chatter_box/model/sign_up.dart';
import 'package:chatter_box/repository/local/local_repository.dart';
import 'package:chatter_box/repository/server/server_repository.dart';

import 'package:flutter/cupertino.dart';

class DataProvider with ChangeNotifier {
  ServerRepository _serverRepository;
  LocalRepository _localRepository;

  DataProvider(
      ServerRepository serverRepository, LocalRepository localRepository) {
    _localRepository = localRepository;
    _serverRepository = serverRepository;
  }

  String get userId => _localRepository.userId.toString();

  Future<SignUpInfo> signUpWithEmailAndPassword({email, password}) {
    return _serverRepository.signUpWithEmailAndPassword(
        email: email, password: password);
  }

  Future<SignInInfo> signInWithEmailAndPassword({email, password}) async {
    SignInInfo _signInInfo = await _serverRepository.signInWithEmailAndPassword(
        email: email, password: password);
    _localRepository.saveLoginStatus(_signInInfo.status);
    if (_signInInfo.status) _localRepository.saveUserID(_signInInfo.userName);
    return _signInInfo;
  }

  Future<SignInInfo> continueWithFacebook() async {
    SignInInfo _signInInfo = await _serverRepository.continueWithFacebook();
    _localRepository.saveLoginStatus(_signInInfo.status);
    if (_signInInfo.status) _localRepository.saveUserID(_signInInfo.userName);
    return _signInInfo;
  }

  Future<void> logoutFacebook() async {
    return await _serverRepository.signOutFacebook();
  }
}
