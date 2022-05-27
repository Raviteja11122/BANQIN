import 'dart:async';
import 'package:bank_genie_task/core/models/user_details.dart';

class UserService{

  StreamController<UserDetailsModel> userController = StreamController<UserDetailsModel>();

  Stream<UserDetailsModel> get user => userController.stream;

  saveDetails(UserDetailsModel user){
    userController.add(user);
  }

}