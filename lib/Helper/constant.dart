
import 'package:flutter/material.dart';

const String danaBold = "DanaBold";
const String danaLight = "DanaLight";
const String danaMedium = "DanaMedium";
const String baseUrl = "https://momapi.cyberoxi.com/v1";

const Color greenMainColor = Color(0xff00AA7E);
const Color purpleMainColor = Color(0xff9F39C1);
const Color grayMainColor = Color(0xff979797);
const Color errorColor = Color(0xffDB0049);
const Color textMainColor = Color(0xff404040);
const Color textColor = Color(0xff333333);
const Color borderColor = Color(0xffc2c2c2);
const Color borderLightColor = Color(0xffEEEEEE);
const pendingColor = Color(0xffF6A036);
const shadowColor = Color(0xffd8d8d8);


BoxDecoration boxDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(14),
    border: Border.all(width: 1, color: borderColor),
    color: Colors.white
);


String enterPhoneUrl(){
  return "$baseUrl/panel/doctors/login";
}
String otpCodeUrl(){
  return "$baseUrl/panel/doctors/otpCode";
}
String registerUrl({String? docId}){
  return "$baseUrl/panel/doctors/register/$docId";
}
String doctorDetailUrl({String? docId}){
  return "$baseUrl/panel/doctors/$docId";
}
String updateImageDoctorUrl({String? docId}){
  return "$baseUrl/panel/doctors/update/image/$docId";
}
String dynamicFormsUrl(){
  return "$baseUrl/panel/configs/dynaform";
}
String updateProfileUrl({String? docId}){
  return "$baseUrl/panel/doctors/update/$docId";
}
String updateDoctorDetailUrl({String? docId}){
  return "$baseUrl/panel/doctors/update/$docId/total";
}
String medicalFieldsUrl({String? direction,int?pageNo,int?pageSize,String?sortBy}){
  return "$baseUrl/panel/medical_field?direction=$direction&pageNo=$pageNo&pageSize=$pageSize&sortBy=$sortBy";
}
String insurUrl({String? direction,int?pageNo,int?pageSize,String?sortBy}){
  return "$baseUrl/panel/insur?direction=$direction&pageNo=$pageNo&pageSize=$pageSize&sortBy=$sortBy";
}
String allQasUrl({String? direction,int?pageNo,int?pageSize,String?sortBy,String?status}){
  return "$baseUrl/panel/qa?direction=$direction&pageNo=$pageNo&pageSize=$pageSize&sortBy=$sortBy&status=$status";
}
String myQasWaitingForAnAnswerUrl({String?docId,String? direction,int?pageNo,int?pageSize,String?sortBy}){
  return "$baseUrl/panel/qa/all/$docId?direction=$direction&pageNo=$pageNo&pageSize=$pageSize&sortBy=$sortBy";
}
String myQasHasBeenAnsweredUrl({String?docId,String? direction,int?pageNo,int?pageSize,String?sortBy}){
  return "$baseUrl/panel/qa/answer/doctor/$docId?direction=$direction&pageNo=$pageNo&pageSize=$pageSize&sortBy=$sortBy";

}
String singleQaUrl({String?qaId}){
  return "$baseUrl/panel/qa/$qaId";
}
String answersByQaIdUrl({String?qaId}){
  return "$baseUrl/panel/qa/answer/$qaId";
}
String answersToQuestionUrl({String?qaId}){
  return "$baseUrl/panel/qa/answer";
}