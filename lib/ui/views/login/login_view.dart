import 'package:bank_genie_task/core/services/screen_util_service.dart';
import 'package:bank_genie_task/core/services/user_service.dart';
import 'package:bank_genie_task/core/view_models/login_view_model.dart';
import 'package:bank_genie_task/ui/views/login/login.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:provider/provider.dart';

import '../../widgets/responsive/orientaion_layout.dart';
import '../../widgets/responsive/screen_type_layout.dart';

import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  final void Function(bool isLoggedIn)? onLoginResult;

  const LoginView({Key? key, this.onLoginResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.nonReactive(
      viewModelBuilder: () => LoginViewModel(onLoginResult, Provider.of<UserService>(context)),
      builder: (context, model, _) => Scaffold(
        body: ScreenTypeLayout(
          mobile: OrientationLayout(
            portrait: (context) => const Login(),
          ),
          tablet: OrientationLayout(
            portrait: (context) => const Login(),
            landscape: (context) => Row(
              children: const [
                Expanded(flex: 1, child: SizedBox()),
                Expanded(flex: 1, child: Login()),
              ],
            ),
          ),
          desktop: Row(
            children: const [
              Expanded(flex: 1, child: SizedBox()),
              Expanded(flex: 1, child: Login()),
            ],
          ),
        ),
      )
    );
  }
}
