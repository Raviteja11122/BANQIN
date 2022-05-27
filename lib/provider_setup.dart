
import 'package:bank_genie_task/core/models/user_details.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'core/models/screen.dart';
import 'core/services/screen_util_service.dart';
import 'core/services/user_service.dart';

List<SingleChildWidget> multiProviders = [
  ...independentServices,
  ...uiConsumables
];

List<SingleChildWidget> independentServices = [
  Provider.value(value: UserService()),
  Provider.value(value: ScreenUtilService())
];

List<SingleChildWidget> uiConsumables = [
  StreamProvider<UserDetailsModel>(
    initialData: UserDetailsModel(
      username: "",
      userId: -1,
      base64EncodedAuthenticationKey: "base64EncodedAuthenticationKey",
      authenticated: false,
      officeId: -1,
      officeName: "",
      roles: [],
      permissions: [],
      shouldRenewPassword: false,
      isTwoFactorAuthenticationRequired: false
    ),
    lazy: false,
    create: (context) => Provider.of<UserService>(context, listen: false).user,
  ),
  StreamProvider<Screen>(
    initialData: Screen(),
    lazy: false,
    create: (context) => Provider.of<ScreenUtilService>(context, listen: false).screen,
  ),
];

