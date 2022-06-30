import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mom_doctor/Helper/constant.dart';
import 'package:mom_doctor/Screens/Login/model/register_model.dart';
import 'package:mom_doctor/Screens/Login/model/token_model.dart';

class EnterPhoneRepository {
  Future<int?> enterPhone({String? numberPhone}) async {
    String url = enterPhoneUrl();
    Dio dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
        headers : {
    'Content-Type': 'application/json'
    },
    ));

    try {
      Response response = await dio.post(url,data: numberPhone );
      print(response.statusCode); // 500
      print(response.data);// Contains a Dio Error object
      return response.statusCode;
    } on DioError catch (e) {
      print(e);
    }

  }
}

class OtpCodeRepository {
  Future<TokenModel> getToken({String? numberPhone, String? otpCode}) async {
    String url = otpCodeUrl();
    var param = <String, dynamic>{
    "otpCode": otpCode,
    "phoneNumber": "$numberPhone"
    };
    Dio dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
      headers: {"Content-Type": "application/json"},
    ));
    var result = await dio.post(url,queryParameters: param,data: jsonEncode(param));
    return TokenModel.fromJson(result.data);
  }
}

class RegisterRepository{

  Future<RegisterModel> register({String? firstName,String? lastName,String? docId}) async {
    String url=registerUrl(docId:docId);
    var param = <String, dynamic>{
      "firstName": "$firstName",
      "lastName": "$lastName",
    };
    Dio dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
      headers: {"Content-Type": "application/json"},
    ));
    var result= await dio.post(url,queryParameters: param,data: jsonEncode(param));
    return RegisterModel.fromJson(result.data);
  }
}
