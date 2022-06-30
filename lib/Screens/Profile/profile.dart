import 'dart:io';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mom_doctor/Helper/constant.dart';
import 'package:mom_doctor/Screens/Login/login_page.dart';
import 'package:mom_doctor/Screens/Profile/image_crop.dart';
import 'package:mom_doctor/Screens/Profile/model/doctor_model.dart';
import 'package:mom_doctor/Screens/Profile/my_profile/complete_profile_main.dart';
import 'package:mom_doctor/Screens/Profile/repository/profile_repository.dart';
import 'package:mom_doctor/generated/l10n.dart';
import 'package:mom_doctor/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Setting/setting.dart';

class Profile extends StatefulWidget {
  final VoidCallback goToMainPage;

  Profile({Key? key, required this.goToMainPage}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isLoding = false;

  //UserDetailModel? userDetail;

  bool imageDelete = false;

  //late LoginBloc _loginBloc;

  bool? callToActionLogin = false;

  bool errorConnection = false;
  bool imageIsSend = false;

  Future<void> _galleryImage() async {
    final ImagePicker imagePicker = new ImagePicker();
    final XFile? pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final File? imageFile = File(pickedFile.path);
      final imageIsSend = await Navigator.push(
          context,
          CupertinoPageRoute(
              builder: (context) => ImageCropper(
                    imageFile: imageFile,
                  )));
      if (imageIsSend) {
        //await getDoctorDetail();
        MyApp.mainPageController.jumpToPage(2);
        MyApp.mainPageController.jumpToPage(3);
      }
    }
    setState(() {});
  }

  Future<void> _cameraImage() async {
    final ImagePicker imagePicker = new ImagePicker();
    final XFile? photo = await imagePicker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      final File? imageFile = File(photo.path);
      final imageIsSend = await Navigator.push(
          context,
          CupertinoPageRoute(
              builder: (context) => ImageCropper(
                    imageFile: imageFile,
                  )));
      if (imageIsSend) {
         //await getDoctorDetail();
       MyApp.mainPageController.jumpToPage(2);
       MyApp.mainPageController.jumpToPage(3);
      }
      setState(() {

      });
    }
  }

  @override
  void initState() {
    //_loginBloc = BlocProvider.of<LoginBloc>(context);
    //checkLogin();
    getDoctorDetail();
    super.initState();
  }


  Future<void> deleteImageProfile() async {
    var result = await ProfileRepository().deleteImageProfile();
    if (result == 200) {
      imageDelete = true;
      setState(() {});
    }
  }

  DoctorModel? doctorDetail;

  bool isLogin=false;

  Future<void> getDoctorDetail() async {
    DoctorModel result = await ProfileRepository().getDoctorDetail();
    if (result != null) {
      setState(() {
        doctorDetail = result;
      });
    }
  }

  bool uploadImage = false;
  bool deleteImage = false;

  TextEditingController _mobileController = TextEditingController();
  String? enteredNumber;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    if (uploadImage || deleteImage) {
      getDoctorDetail();
    }
    return WillPopScope(
      onWillPop: () async {
        widget.goToMainPage();
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: (doctorDetail != null)
                ?
            Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 360,
                            width: MediaQuery.of(context).size.width,
                            child: (doctorDetail != null)
                                ? Image.network(
                              doctorDetail!.profileImage.toString(),
                                    fit: BoxFit.fitWidth,
                                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) return child;
                                      return Center(
                                        child: CircularProgressIndicator(
                                          color: purpleMainColor,
                                          value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes! : null,
                                        ),
                                      );
                                    },
                                  )
                                : Container(
                                    alignment: Alignment.center,
                                    height: MediaQuery.of(context).size.height,
                                    child: const CircularProgressIndicator(
                                      color: purpleMainColor,
                                    ))
                           ,
                          ),
                          Container(
                            height: 360,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                              colors: [const Color(0xff000000).withOpacity(0.7), const Color(0xff979797).withOpacity(0)],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              stops: [0, 0.6],
                            )),
                          ),
                          Container(
                              padding: const EdgeInsets.only(bottom: 24, right: 24),
                              alignment: Alignment.bottomRight,
                              height: 360,
                              child: Text(
                                (doctorDetail != null) ? doctorDetail!.firstName.toString() + " " + doctorDetail!.lastName.toString() : "",
                                style: const TextStyle(fontSize: 22, fontFamily: danaBold, color: Colors.white),
                              )),
                          GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () {
                              showSheetChangePictureProfile(context);
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 336, right: MediaQuery.of(context).size.width - 72),
                              alignment: Alignment.center,
                              height: 48,
                              width: 48,
                              /*transform: Matrix4.translationValues(0, -24, 0),*/
                              decoration: BoxDecoration(color: purpleMainColor, borderRadius: BorderRadius.circular(14)),
                              child: const Icon(
                                Icons.add_photo_alternate_outlined,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 12, right: 12, top: 27),
                            decoration: boxDecoration,
                            child: Column(
                              children: [
                                Container(
                                  margin: const EdgeInsets.only(left: 16, right: 16, top: 24),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        S.of(context).FirstName + " و " + S.of(context).LastName,
                                        style: const TextStyle(fontSize: 12, fontFamily: danaMedium, color: grayMainColor),
                                      ),
                                      Text(
                                        (doctorDetail != null) ? doctorDetail!.firstName.toString() + " " + doctorDetail!.lastName.toString() : "",
                                        style: const TextStyle(fontSize: 14, fontFamily: danaMedium, color: purpleMainColor),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        S.of(context).LabelNumberPhone,
                                        style: const TextStyle(fontSize: 12, fontFamily: danaMedium, color: grayMainColor),
                                      ),
                                      Text(
                                        (doctorDetail != null) ? doctorDetail!.mobile.toString() : "",
                                        style: const TextStyle(fontSize: 14, fontFamily: danaMedium, color: purpleMainColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 30, top: 17),
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            color: Colors.white,
                            child: Text(
                              S.of(context).AccountInformation,
                              style: const TextStyle(fontSize: 14, fontFamily: danaBold, color: purpleMainColor),
                            ),
                          )
                        ],
                      ),
                      //پروفایل من
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () async {
                         // await getDoctorDetail();
                          if (doctorDetail != null) {
                            Route newRoute = CupertinoPageRoute(builder: (context) => CompleteProfileMain(title: S.of(context).CompleteProfile, doctorDetail: doctorDetail));
                            Navigator.push(context, newRoute);
                          }
                          setState(() {

                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 12, right: 16, top: 26,bottom: 16),
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Image.asset("assets/images/myProfile.png", height: 18, width: 18),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      S.of(context).MyProfile,
                                      style: const TextStyle(fontSize: 14, fontFamily: danaLight, color: textColor),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 12),
                                child: Image.asset("assets/images/dropRight.png",height: 10.25,width: 5.5,),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 1,
                        color: borderLightColor,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                      ),
                      //ثبت ساعت کاری
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                         /* if (userDetail != null) {
                            Route newRoute = CupertinoPageRoute(
                                builder: (context) => MyTurns(
                                      title: S.of(context).MyTurn,
                                    ));
                            Navigator.push(context, newRoute);
                          }*/
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 12, right: 16,top: 16,bottom: 16),
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Image.asset("assets/images/RecordWorkingHours.png", height: 18, width: 18),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      S.of(context).RecordWorkingHours,
                                      style: const TextStyle(fontSize: 14, fontFamily: danaLight, color: textColor),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 12),
                                child: Image.asset("assets/images/dropRight.png",height: 10.25,width: 5.5,),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 1,
                        color: borderLightColor,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                      ),
                      //مدیریت بیمه
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          //Navigator.push(context, CupertinoPageRoute(builder: (context) => const MyQuestionsAndAnswers()));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 12, right: 16,top: 16,bottom: 16),
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Image.asset("assets/images/InsuranceManagement.png", height: 18, width: 18),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      S.of(context).InsuranceManagement,
                                      style: const TextStyle(fontSize: 14, fontFamily: danaLight, color: textColor),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 12),
                                child: Image.asset("assets/images/dropRight.png",height: 10.25,width: 5.5,),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 1,
                        color: borderLightColor,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                      ),
                      //مدیریت تخصص
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          //Navigator.push(context, CupertinoPageRoute(builder: (context) => const BookMarks()));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 12, right: 16,bottom: 16,top: 16),
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Image.asset("assets/images/SpecialtyManagement.png", height: 18, width: 18),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      S.of(context).SpecialtyManagement,
                                      style: const TextStyle(fontSize: 14, fontFamily: danaLight, color: textColor),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 12),
                                child: Image.asset("assets/images/dropRight.png",height: 10.25,width: 5.5,),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 1,
                        color: borderLightColor,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                      ),
                      //تراکنش‌ها
                      GestureDetector(
                        onTap: () {
                          //Navigator.push(context, CupertinoPageRoute(builder: (context) => Transactions()));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 12, right: 16,bottom: 16,top: 16),
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Image.asset("assets/images/Transactions.png", height: 18, width: 18),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      S.of(context).Transactions,
                                      style: const TextStyle(fontSize: 14, fontFamily: danaLight, color: textColor),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 12),
                                child: Image.asset("assets/images/dropRight.png",height: 10.25,width: 5.5,),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 1,
                        color: borderLightColor,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 16),
                      ),
                      //تنظیمات
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () async {
                          Route newRoute = CupertinoPageRoute(builder: (context) => const Setting());
                          Navigator.push(context, newRoute);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 16, right: 16, bottom: 26,top: 16),
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/setting.png",
                                      height: 18,
                                      width: 18,
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    Text(
                                      S.of(context).Setting,
                                      style: const TextStyle(fontSize: 14, fontFamily: danaLight, color: textColor),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 12),
                                child: Image.asset("assets/images/dropRight.png",height: 10.25,width: 5.5,),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                :  (errorConnection == false)
                        ? Container(
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height,
                            child: const CircularProgressIndicator(
                              color: purpleMainColor,
                            ))
                        : _errorConnect(),
          ),
        ),
      ),
    );
  }

  _errorConnect() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 52, right: 52, top: MediaQuery.of(context).size.height / 6),
              child: Image.asset("assets/images/ConnectError.png")),
          Container(
              margin: const EdgeInsets.only(top: 16, bottom: 24),
              child: Text(
                S.of(context).CommunicationError,
                style: const TextStyle(fontSize: 14, fontFamily: danaMedium, color: textColor),
              )),
          GestureDetector(
            onTap: () async {
              await getDoctorDetail();
              setState(() {});
            },
            child: Container(
              alignment: Alignment.center,
              height: 48,
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 12, right: 12),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: greenMainColor),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(
                S.of(context).Retry,
                style: const TextStyle(fontSize: 16, fontFamily: danaMedium, color: greenMainColor),
              ),
            ),
          )
        ],
      ),
    );
  }

  void showSheetChangePictureProfile(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        //isScrollControlled: true,
        builder: (BuildContext bc) {
          return Container(
            height: 175,
            decoration: const BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(24), topLeft: Radius.circular(24)), color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 25),
                  height: 4,
                  width: 72,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: const Color(0xffd8d8d8)),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () async {
                    uploadImage = true;
                    Navigator.pop(context);
                    await _cameraImage();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 16),
                    child: Row(
                      children: [
                        Image.asset("assets/images/takeImage.png",height: 19,width: 19,),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          S.of(context).TakeANewPhoto,
                          style: const TextStyle(fontSize: 14, fontFamily: danaMedium, color: textColor),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width,
                  color: borderLightColor,
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () async {
                    uploadImage = true;
                    Navigator.pop(context);
                    await _galleryImage();
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 16),
                    child: Row(
                      children: [
                        Image.asset("assets/images/choiseForGallery.png",height: 19,width: 19,),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          S.of(context).SelectionFromGallery,
                          style: const TextStyle(fontSize: 14, fontFamily: danaMedium, color: textColor),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width,
                  color: borderLightColor,
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                ),
                InkWell(
                  onTap: () async {
                    await deleteImageProfile();
                    if (imageDelete) {
                     deleteImage = true;
                     await getDoctorDetail();
                     Navigator.pop(context);
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 16),
                    child: Row(
                      children: [
                        Image.asset("assets/images/deletePicture.png",height: 17,width: 15,),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          S.of(context).DeleteCurrentPhoto,
                          style: const TextStyle(fontSize: 14, fontFamily: danaMedium, color: errorColor),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
