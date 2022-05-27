/*import 'dart:async';
import 'dart:convert';

import 'package:bank_genie_task/core/models/office.dart';
import 'package:bank_genie_task/core/models/user_details.dart';
import 'package:bank_genie_task/core/services/user_service.dart';
import 'package:stacked/stacked.dart';

import '../services/api.dart';
import '../services/shared_preferences.dart';

class OfficesViewModel extends BaseViewModel{
  final Api _api = Api();
  final StreamController<List<Office>> _officesStreamController = StreamController<List<Office>>.broadcast();
  UserDetailsModel _user;
  final UserService _userService;
  List<Office> _offices = [];

  OfficesViewModel({
    required UserDetailsModel user,
    required UserService userService
  }): _user = user, _userService = userService;

  Stream<List<Office>> get offices => _officesStreamController.stream;

  getOffices()async{
    _user = UserDetailsModel.fromJson(jsonDecode(SharedPref().getString("user_details")));
    _userService.saveDetails(_user);
    if(_offices.isEmpty) {
      try {
        _offices = await _api.listOfOffices({"Authorization": "Basic ${_user.base64EncodedAuthenticationKey}"}) ?? [];
        _officesStreamController.add(_offices);
      } catch (e) {
        _offices = [];
        _officesStreamController.addError(e);
      }
    }else{
      _officesStreamController.add(_offices);
    }
  }
}*/


import 'dart:async';
import 'dart:convert';

import 'package:bank_genie_task/core/models/office.dart';
import 'package:bank_genie_task/core/models/user_details.dart';
import 'package:bank_genie_task/core/services/user_service.dart';
import 'package:stacked/stacked.dart';

import '../services/api.dart';
import '../services/shared_preferences.dart';

class OfficesViewModel extends BaseViewModel{
  final Api _api = Api();
  UserDetailsModel _user;
  final UserService _userService;
  List<Office> _offices = [];

  OfficesViewModel({
    required UserDetailsModel user,
    required UserService userService
  }): _user = user, _userService = userService;

  List<Office> get offices => _offices;

  getOffices()async{
    _user = UserDetailsModel.fromJson(jsonDecode(SharedPref().getString("user_details")));
    _userService.saveDetails(_user);
    setBusy(true);
    try{
      _offices = await _api.listOfOffices({"Authorization": "Basic ${_user.base64EncodedAuthenticationKey}"}) ?? [];
    } catch(e){
      _offices = [];
    }
    setBusy(false);
  }
}
