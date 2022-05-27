
import 'package:flutter/cupertino.dart';

class Screen{
  double? width;
  double? height;
  double? dpi;
  Orientation? orientation;

  Screen({this.width, this.height, this.orientation, this.dpi});

  Screen.fromJson(Map<String, dynamic> data){
    width = double.tryParse("${data["width"]}");
    height = double.tryParse("${data["height"]}");
    dpi = double.tryParse("${data["dpi"]}");
    orientation = data["orientation"];
  }

  Map<String, dynamic> toJson(){
    //print("token from toJson: $token");
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["width"] = width;
    data["height"] = height;
    data["dpi"] = dpi;
    data["orientation"] = orientation;

    return data;
  }


}