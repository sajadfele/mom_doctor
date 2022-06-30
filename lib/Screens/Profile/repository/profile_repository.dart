
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:mom_doctor/Helper/constant.dart';
import 'package:mom_doctor/Screens/Profile/model/doctor_model.dart';
import 'package:mom_doctor/Screens/Profile/model/dynamic_forms_model.dart';
import 'package:mom_doctor/Screens/Profile/model/insur_model.dart';
import 'package:mom_doctor/Screens/Profile/model/medical_fields_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileRepository{
  Future<DoctorModel> getDoctorDetail() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? docId = await prefs.getString('docId');
    String url=doctorDetailUrl(docId: docId);
    Dio dio=Dio(BaseOptions(
      baseUrl: baseUrl
    ));
    var result=await dio.get(url);
    return DoctorModel.fromJson(result.data);
  }

  Future <int?> updateImageDoctor({File? file}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token=await prefs.getString("token");
    String? docId = await prefs.getString('docId');

    String url=updateImageDoctorUrl(docId:docId );

    String fileName = file!.path.split('/').last;

    FormData data = FormData.fromMap({
      "image": await MultipartFile.fromFile(file.path, filename: fileName,),
    });

    Dio dio=Dio(BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 5000,
        receiveTimeout: 3000,
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json"
        }
    ));
    Response response= await dio.patch(url,data:data );
    return response.statusCode;


  }

  Future<int?> deleteImageProfile() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token= await prefs.getString('token');
    String? docId= await prefs.getString('docId');

    String url = updateImageDoctorUrl(docId: docId);

    FormData data = FormData.fromMap({
      "image": null
    });

    Dio dio=Dio(BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 5000,
        receiveTimeout: 3000,
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "multipart/form-data"
        }
    ));
    Response response= await dio.patch(url,data:data );
    return response.statusCode;
  }

  Future<List<DynamicFormsModel>> getDynamicForms() async {
    String url=dynamicFormsUrl();
    Dio dio=Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ));
    var result=await dio.get(url);
    return List<DynamicFormsModel>.from(
        result.data.map((data)=>DynamicFormsModel.fromJson(data))
    );
  }


  /*Future<int?> updateProfile({String?address,String?bdate,String? bio,String? description,String?email,String?firstName,String?lastName,String?mobile,String?officeNumber,String?shebaNumber}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token= await prefs.getString('token');
    String? docId= await prefs.getString('docId');

    String? url=updateProfileUrl(docId: docId);

    var param=<String,dynamic>{
      "address": address,
      "bdate": bdate,
      "bio": bio,
      "description": description,
      "email": email,
      "firstName": firstName,
      "lastName": lastName,
      "mobile": mobile,
      "officeNumber": officeNumber,
      "shebaNumber": shebaNumber
    };
    Dio dio=Dio(BaseOptions(
      baseUrl: baseUrl,
    ));
    Response response=await dio.put(url,queryParameters: param,data: jsonEncode(param));
    return response.statusCode;
  }*/

  Future<int?> updateDoctorDetail({String?address,String?bdate,List?insurList,List? medicalList,String?offlinePrice,String?onlinePrice,String? bio,String? description,String?email,String?officeNumber,String?shebaNumber}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token= await prefs.getString('token');
    String? docId= await prefs.getString('docId');

    String url=updateDoctorDetailUrl(docId: docId);
    var param=<String,dynamic>{
      "address": address,
      "bdate": bdate,
      "bio": bio,
      "description": description,
      "email": email,
      "insurList":insurList ,
      "medicalList":medicalList,
      "officeNumber": officeNumber,
      "offlinePrice": offlinePrice,
      "onlinePrice": onlinePrice,
      "shebaNumber": shebaNumber
    };
    Dio dio=Dio(BaseOptions(
      baseUrl: baseUrl,
     /* connectTimeout: 5000,
      receiveTimeout: 3000,*/
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json"
        }
    ));
    Response response=await dio.put(url,queryParameters: param,data: jsonEncode(param));
    return response.statusCode;

  }


  Future<MedicalFieldsModel> getListMedicalFields() async {
    String url=medicalFieldsUrl(direction: "ASC",pageNo: 0,pageSize: 100,sortBy: "id");
    Dio dio=Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ));
    var result=await dio.get(url);
    return MedicalFieldsModel.fromJson(result.data);
  }
  Future<InsursModel> getListinsur() async {
    String url=insurUrl(direction: "ASC",pageNo: 0,pageSize: 100,sortBy: "id");
    Dio dio=Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
    ));
    var result=await dio.get(url);
    return InsursModel.fromJson(result.data);
  }
}