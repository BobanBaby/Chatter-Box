import 'package:chatter_box/model/sign_in.dart';
import 'package:chatter_box/model/sign_up.dart';
import 'package:chatter_box/repository/local/local_repository.dart';
import 'package:chatter_box/repository/server/firebase_proider.dart';

class ServerRepository {
  FirebaseProvider _firebaseProvider;
  ServerRepository(String environment, LocalRepository localRepository) {
    _firebaseProvider = FirebaseProvider();
  }

  Future<SignInInfo> signInWithEmailAndPassword({email, password}) {
    return _firebaseProvider.emailSignIn(email: email, password: password);
  }

  Future<SignUpInfo> signUpWithEmailAndPassword({email, password}) {
    return _firebaseProvider.emailSignUp(email: email, password: password);
  }

  Future<SignInInfo> continueWithFacebook() {
    return _firebaseProvider.continueWithFacebook();
  }

  Future<SignInInfo> signOutFacebook() {
    return _firebaseProvider.signOutFacebook();
  }
}
