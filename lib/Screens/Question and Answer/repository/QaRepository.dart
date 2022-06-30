

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mom_doctor/Screens/Question%20and%20Answer/model/my_qas_model.dart';
import 'package:mom_doctor/Screens/Question%20and%20Answer/model/qa_answer_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Helper/constant.dart';

class MyQasRepository{
  Future<MyQasModel> getAllMyQas() async {

    String url=allQasUrl(direction: "DESC",pageNo: 0,pageSize: 100,sortBy: "created",status: "VERIFIED");
    Dio dio=Dio(BaseOptions(
        baseUrl: baseUrl,
    ));
    var result=await dio.get(url);
    return MyQasModel.fromJson(result.data);
  }

  Future<MyQasModel> myQasWaitingForAnAnswer() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token= await prefs.getString('token');
    String? docId= await prefs.getString('docId');

    String url=myQasWaitingForAnAnswerUrl(docId: docId,direction: "ASC",pageNo: 0,pageSize: 100,sortBy: "id");

    Dio dio=Dio(BaseOptions(
      baseUrl: baseUrl,
    ));
    var result=await dio.get(url);
    return MyQasModel.fromJson(result.data);
  }

  Future<QaAnswerModel> myQasHasBeenAnswered() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? docId= await prefs.getString('docId');

    String url=myQasHasBeenAnsweredUrl(docId: docId,direction: "ASC",pageNo: 0,pageSize: 100,sortBy: "id");

    Dio dio=Dio(BaseOptions(
      baseUrl: baseUrl,
    ));
    var result=await dio.get(url);
    return QaAnswerModel.fromJson(result.data);
  }

  Future<QaModel> SingleQa({required String qaId}) async {

    String url=singleQaUrl(qaId: qaId);

    Dio dio=Dio(BaseOptions(
      baseUrl: baseUrl,
    ));
    var result=await dio.get(url);
    return QaModel.fromJson(result.data);
  }

  Future<List<AnswerModel>> answersByQaId({required String qaId}) async {

    String url=answersByQaIdUrl(qaId: qaId);

    Dio dio=Dio(BaseOptions(
      baseUrl: baseUrl,
    ));
    var result=await dio.get(url);
    return List<AnswerModel>.from(
        result.data
            .map((data) => AnswerModel.fromJson(data))
    );
  }

  Future<int?> answerToQuestion({required String qaId,required String answer}) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token= await prefs.getString('token');
    String? docId= await prefs.getString('docId');

    String url=answersToQuestionUrl();

    var param=<String,dynamic>{
      "answer": answer,
      "docId": docId,
      "qaId": qaId
    };

    Dio dio=Dio(BaseOptions(
      baseUrl: baseUrl,
        headers: {
          "Authorization": "Bearer $token",
          "Content-Type": "application/json"
        }
    ));

    Response response=await dio.post(url,queryParameters: param,data: jsonEncode(param));
    return response.statusCode;
  }
}