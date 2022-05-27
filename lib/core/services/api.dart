import 'dart:io';

import 'package:bank_genie_task/core/models/office.dart';
import 'package:bank_genie_task/core/models/user_details.dart';
import 'package:dio/dio.dart';

import '../utils/app_interceptors.dart';

class Api{

  Dio dio = createDio();

  static Dio createDio() {
    var _dio = Dio(BaseOptions(
      baseUrl: "http://banqindev.eastus.cloudapp.azure.com:8080/banqin-provider/api/v1",
      responseType: ResponseType.json,
    ));

    _dio.interceptors.addAll({
      AppInterceptors(_dio),
    });

    return _dio;
  }

  Future<UserDetailsModel?> login(Map<String, dynamic> body)async{
    try{
      Response response = await dioPostJson("/authentication", body);
      if(response.statusCode == 200){
        return UserDetailsModel.fromJson(response.data);
      }
      return null;
    } catch(e){
      return null;
    }
  }

  Future<List<Office>?> listOfOffices(Map<String, dynamic> headers)async{
    Response response = await dioGetJson("/offices", headers: headers);
    if(response.statusCode == 200){
      return List<Office>.from(response.data.map((e) => Office.fromJson(e)));
    }
    return null;
  }

  /// Api helper methods
  Future<Response> dioGetJson(String url, {Map<String, dynamic>? headers}) async{
    return await dio.get(
      url,
      options: Options(
        headers: headers
      )
    );
  }

  Future<Response> dioPostJson(String url, dynamic body, {Map<String, dynamic>? headers}) async{
    return await dio.post(
        url,
        options: Options(
          headers: headers
        ),
        data: body
    );
  }
}