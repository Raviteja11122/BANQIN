import 'package:bank_genie_task/core/models/user_details.dart';
import 'package:bank_genie_task/core/services/user_service.dart';
import 'package:bank_genie_task/core/view_models/offices_view_model.dart';
import 'package:bank_genie_task/ui/views/offices/offices_desktop.dart';
import 'package:bank_genie_task/ui/views/offices/offices_mobile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

import '../../../core/services/screen_util_service.dart';
import '../../widgets/responsive/orientaion_layout.dart';
import '../../widgets/responsive/screen_type_layout.dart';

class OfficesView extends StatelessWidget {
  const OfficesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<ScreenUtilService>(context, listen: false).setScreenObject(context);
    return ViewModelBuilder<OfficesViewModel>.nonReactive(
      viewModelBuilder: () => OfficesViewModel(user: Provider.of<UserDetailsModel>(context), userService: Provider.of<UserService>(context)),
      builder: (context, model, _) => Scaffold(
        body: ScreenTypeLayout(
          mobile: OrientationLayout(
            portrait: (context) => OfficesMobileView(),
          ),
          tablet: OrientationLayout(
            portrait: (context) => OfficesMobileView(),
            landscape: (context) => const OfficesDesktop(),
          ),
          desktop: const OfficesDesktop(),
        ),
      ),
      onModelReady: (model) => model.getOffices(),
    );
  }
}
