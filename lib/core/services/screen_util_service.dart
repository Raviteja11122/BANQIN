import 'dart:async';
import 'package:flutter/material.dart';

import '../models/screen.dart';

class ScreenUtilService{
  final StreamController<Screen> _screenController = StreamController<Screen>();

  Stream<Screen> get screen => _screenController.stream;

  setScreenObject(BuildContext context){
    Map<String, dynamic> screen = Map();
    screen["width"] = MediaQuery.of(context).size.width;
    screen["height"] = MediaQuery.of(context).size.height;
    screen["dpi"] = MediaQuery.of(context).devicePixelRatio;
    screen["orietation"] = MediaQuery.of(context).orientation;
    _screenController.add(Screen.fromJson(screen));
  }
}