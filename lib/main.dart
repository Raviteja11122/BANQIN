import 'package:bank_genie_task/core/router/auth_guards.dart';
import 'package:bank_genie_task/core/services/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:provider/provider.dart';

import 'core/router/router.gr.dart';
import 'provider_setup.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
  await SharedPref().init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final ThemeData theme = ThemeData.light();
  final _appRouter = AppRouter(authGuard: AuthGuard());

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: multiProviders,
      child: MaterialApp.router(
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        title: 'Flutter Demo',
        theme: theme.copyWith(
          iconTheme: theme.iconTheme.copyWith(
            color: Colors.white
          ),
          textTheme: theme.textTheme.copyWith(

            headline5: theme.textTheme.headline5!.copyWith(
                fontFamily: 'Hk_Grotesk',
                color: Colors.white
            ),
            bodyText2: theme.textTheme.bodyText2!.copyWith(
                fontFamily: 'Hk_Grotesk',
                color: Colors.white
            ),
            subtitle1: theme.textTheme.subtitle1!.copyWith(
                fontFamily: 'Hk_Grotesk',
                color: Colors.white
            ),
            caption: theme.textTheme.caption!.copyWith(
                fontFamily: 'Hk_Grotesk',
                color: Colors.white
            ),
          ),
          scaffoldBackgroundColor: const Color(0xFF1C1C1E)
        )
      ),
    );
  }
}
