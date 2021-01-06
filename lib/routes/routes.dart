import 'package:auto_route/auto_route_annotations.dart';
import 'package:chatter_box/ui/screens/home/chat_home.dart';
import 'package:chatter_box/ui/screens/sign_in/sign_in_screen.dart';
import 'package:chatter_box/ui/screens/sign_up/sign_up_screen.dart';
import 'package:chatter_box/ui/screens/spalsh/spalsh.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute(page: SplashScreen, initial: true),
    MaterialRoute(page: SignInScreen),
    MaterialRoute(page: SignUpScreen),
    MaterialRoute(page: ChatHomeScreen),
  ],
)
class $Router {}
