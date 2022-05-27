import 'package:auto_route/annotations.dart';
import 'package:bank_genie_task/core/router/auth_guards.dart';
import 'package:bank_genie_task/ui/views/login/login_view.dart';
import 'package:bank_genie_task/ui/views/office_details.dart';

import '../../ui/views/offices/offices_view.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    MaterialRoute(page: LoginView, path: "login"),
    MaterialRoute(page: OfficesView, path: "offices", initial: true, guards: [AuthGuard]),
    MaterialRoute(page: OfficeDetails, path: "office_details", guards: [AuthGuard]),
    RedirectRoute(path: '*', redirectTo: 'offices')
  ]
)
class $AppRouter {}