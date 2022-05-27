import 'dart:convert';

import 'package:bank_genie_task/core/models/user_details.dart';
import 'package:bank_genie_task/core/services/user_service.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../router/router.gr.dart';
import '../services/api.dart';
import '../services/shared_preferences.dart';

class LoginViewModel extends BaseViewModel {
  final Api _api = Api();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? _errorText;
  final void Function(bool isLoggedIn)? onLoginResult;
  final UserService userService;

  LoginViewModel(this.onLoginResult, this.userService);

  GlobalKey<FormState> get formKey => _formKey;
  String? get errorText => _errorText;
  TextEditingController get userNameController => _userNameController;
  TextEditingController get passwordController => _passwordController;

  login() async{
    if(_formKey.currentState!.validate()){
      setBusy(true);
      Map<String, dynamic> _body = {
        "username": _userNameController.text.trim(),
        "password": _passwordController.text.trim()
      };
      UserDetailsModel? res = await _api.login(_body);
      setBusy(false);
      if(res != null){
        userService.saveDetails(res);
        SharedPref().setString("user_details", jsonEncode(res.toJson()));
        SharedPref().setBoolean("Login", true);
        onLoginResult!.call(true);
      }else{
        _errorText = "Invalid username or password";
        notifyListeners();
      }
    }
  }
}
