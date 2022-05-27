// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../../ui/views/login/login_view.dart' as _i1;
import '../../ui/views/office_details.dart' as _i3;
import '../../ui/views/offices/offices_view.dart' as _i2;
import '../models/office.dart' as _i7;
import 'auth_guards.dart' as _i6;

class AppRouter extends _i4.RootStackRouter {
  AppRouter(
      {_i5.GlobalKey<_i5.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i6.AuthGuard authGuard;

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    LoginView.name: (routeData) {
      final args =
          routeData.argsAs<LoginViewArgs>(orElse: () => const LoginViewArgs());
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child:
              _i1.LoginView(key: args.key, onLoginResult: args.onLoginResult));
    },
    OfficesView.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.OfficesView());
    },
    OfficeDetails.name: (routeData) {
      final args = routeData.argsAs<OfficeDetailsArgs>();
      return _i4.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i3.OfficeDetails(key: args.key, office: args.office));
    }
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig('/#redirect',
            path: '/', redirectTo: 'offices', fullMatch: true),
        _i4.RouteConfig(LoginView.name, path: 'login'),
        _i4.RouteConfig(OfficesView.name, path: 'offices', guards: [authGuard]),
        _i4.RouteConfig(OfficeDetails.name,
            path: 'office_details', guards: [authGuard]),
        _i4.RouteConfig('*#redirect',
            path: '*', redirectTo: 'offices', fullMatch: true)
      ];
}

/// generated route for
/// [_i1.LoginView]
class LoginView extends _i4.PageRouteInfo<LoginViewArgs> {
  LoginView({_i5.Key? key, void Function(bool)? onLoginResult})
      : super(LoginView.name,
            path: 'login',
            args: LoginViewArgs(key: key, onLoginResult: onLoginResult));

  static const String name = 'LoginView';
}

class LoginViewArgs {
  const LoginViewArgs({this.key, this.onLoginResult});

  final _i5.Key? key;

  final void Function(bool)? onLoginResult;

  @override
  String toString() {
    return 'LoginViewArgs{key: $key, onLoginResult: $onLoginResult}';
  }
}

/// generated route for
/// [_i2.OfficesView]
class OfficesView extends _i4.PageRouteInfo<void> {
  const OfficesView() : super(OfficesView.name, path: 'offices');

  static const String name = 'OfficesView';
}

/// generated route for
/// [_i3.OfficeDetails]
class OfficeDetails extends _i4.PageRouteInfo<OfficeDetailsArgs> {
  OfficeDetails({_i5.Key? key, required _i7.Office office})
      : super(OfficeDetails.name,
            path: 'office_details',
            args: OfficeDetailsArgs(key: key, office: office));

  static const String name = 'OfficeDetails';
}

class OfficeDetailsArgs {
  const OfficeDetailsArgs({this.key, required this.office});

  final _i5.Key? key;

  final _i7.Office office;

  @override
  String toString() {
    return 'OfficeDetailsArgs{key: $key, office: $office}';
  }
}
