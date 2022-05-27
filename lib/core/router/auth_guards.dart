import 'package:auto_route/auto_route.dart';
import 'package:bank_genie_task/core/services/shared_preferences.dart';

import 'router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    // the navigation is paused until resolver.next() is called with either
    // true to resume/continue navigation or false to abort navigation
    if(SharedPref().getBoolean("Login")){
      // if user is authenticated we continue
      resolver.next();
    }else{
      // we redirect the user to our login page
      router.push(LoginView(onLoginResult: (success){
        // we can't pop the bottom page in the navigator's stack
        // so we just remove it from our local stack
        resolver.next();
        router.removeLast();
      }));
    }
  }
}