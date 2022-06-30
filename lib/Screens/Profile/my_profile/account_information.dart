
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mom_doctor/Helper/constant.dart';
import 'package:mom_doctor/Helper/widgets/textInputProfile.dart';
import 'package:mom_doctor/Screens/Profile/bloc/profile_bloc.dart';
import 'package:mom_doctor/Screens/Profile/model/doctor_model.dart';
import 'package:mom_doctor/generated/l10n.dart';
import 'package:persian_modal_date_picker/button.dart';
import 'package:persian_modal_date_picker/persian_date_picker.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:shamsi_date/shamsi_date.dart';

class AccountInformation extends StatefulWidget {
  DoctorModel? doctorDetail;

  AccountInformation({this.doctorDetail});

  @override
  State<AccountInformation> createState() => _AccountInformationState();
}

class _AccountInformationState extends State<AccountInformation> {
  var genderValue;
  List gender = ["مرد", "زن"];

  String _datetime = '';
  String _format = 'dd-mm-yyyy';
  String _value = '';
  String _valuePiker = '';

  //Jalali? tempPickedDate;

  late ProfileBloc _profileBloc;

  String? email;

  String? address;

  Date? dateOfBirth;
  DateTime? dateOfBirthDateTime;

  Date? dateOfBirthGorgian;

  Jalali? jalal;

  Gregorian? dateOfBirthGregorian;

  String? officeNumber;

  String? bio;

  String? description;

  //Jalali? tempPickedDate;
  //Gregorian? birth;

  @override
  void initState() {
    address = widget.doctorDetail!.address.toString();
    email = widget.doctorDetail!.email.toString();
    officeNumber = widget.doctorDetail!.officeNumber.toString();
    bio = widget.doctorDetail!.bio.toString();
    bio = widget.doctorDetail!.bio.toString();
    description=widget.doctorDetail!.description.toString();

    _profileBloc = BlocProvider.of<ProfileBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 12, right: 12, top: 27),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), border: Border.all(width: 1, color: borderColor)),
                  child: Column(
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () async {
                          await showPersianDatePicker(
                            context,
                            (context, Date date) async {
                              setState(() {
                                dateOfBirth=date;
                                 jalal = Jalali.fromDateTime(dateOfBirth!.toDateTime());
                                 dateOfBirthGregorian=jalal!.toGregorian();
                                print(dateOfBirthGregorian);
                              });
                              Navigator.of(context).pop();
                            },
                            cancelButtonStyle: ButtonsStyle(radius: 10,text: S.of(context).Cancel, textColor: textColor, backgroundColor: borderLightColor),
                            yearDirection: YearDirection.both,
                            border: const BorderRadius.only(topRight: const Radius.circular(15), topLeft: const Radius.circular(15)),
                            validate: (ctx, date) {
                              return date.year < 1402;
                            },
                            submitButtonStyle: defaultButtonsStyle.copyWith(text: S.of(context).Select, backgroundColor: greenMainColor, radius: 10, textColor: Colors.white),
                          );
                        },
                        child: Stack(
                          children: [
                            Container(
                                margin: const EdgeInsets.only(top: 41, left: 16, right: 16),
                                padding: const EdgeInsets.only(right: 18),
                                height: 48,
                                alignment: Alignment.centerRight,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), border: Border.all(width: 1, color: textColor)),
                                child: Text(
                                       (dateOfBirth != null)
                                          ? dateOfBirth!.formatter.yyyy + "-" + dateOfBirth!.formatter.mm + "-" + dateOfBirth!.formatter.dd
                                         :(widget.doctorDetail != null && widget.doctorDetail!.bdate != null && widget.doctorDetail!.bdate!.isNotEmpty)
                                           ? widget.doctorDetail!.bdate!.toPersianDate(): S.of(context).Select,
                                  style: TextStyle(fontSize: 15, fontFamily: danaMedium, color: (widget.doctorDetail != null || dateOfBirth != null) ? textMainColor : grayMainColor),
                                )),
                            Container(
                              margin: const EdgeInsets.only(top: 32, right: 35),
                              padding: const EdgeInsets.only(right: 8, left: 6),
                              color: Colors.white,
                              child: Text.rich(
                                TextSpan(text: S.of(context).DateOfBirth, style: const TextStyle(fontSize: 12, fontFamily: danaMedium, color: textColor), children: const [
                                  TextSpan(
                                    text: " *",
                                    style: TextStyle(fontSize: 12, fontFamily: danaMedium, color: errorColor),
                                  )
                                ]),
                              ),
                            )
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 33, left: 16, right: 16),
                            child: TextInputProfile(
                              textAlign: TextAlign.right,
                              hint: S.of(context).EnterTheAddress,
                              textStyle: const TextStyle(color: textMainColor, fontFamily: danaMedium, fontSize: 16),
                              initialValue: (widget.doctorDetail != null && widget.doctorDetail!.address != null) ? widget.doctorDetail!.address.toString() : "",
                              label: S.of(context).Address,
                              onFieldSubmitted: (text) {
                                setState(() {
                                  address = text;
                                });
                              },
                              onFieldChanged: (text) {
                                setState(() {
                                  address = text;
                                });
                              },
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 25, right: 70),
                            child: const Text(
                              " *",
                              style: const TextStyle(fontSize: 12, fontFamily: danaMedium, color: errorColor),
                            ),
                          )
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 33, left: 16, right: 16),
                            child: TextInputProfile(
                              textAlign: TextAlign.right,
                                hint: S.of(context).EnterTheEmail,
                              textStyle: TextStyle(color: (widget.doctorDetail != null) ? textMainColor : grayMainColor, fontFamily: danaMedium, fontSize: 16),
                              initialValue: (widget.doctorDetail != null) ? widget.doctorDetail!.email : "",
                              labelStyle: TextStyle(color: (widget.doctorDetail != null) ? textMainColor : grayMainColor, fontFamily: danaMedium, fontSize: 16),
                              label: "ایمیل",
                              type: TextInputType.emailAddress,
                              onFieldSubmitted: (text) {
                                setState(() {
                                  email = text;
                                });
                              },
                              onFieldChanged: (text) {
                                setState(() {
                                  email = text;
                                });
                              },
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 25, right: 70),
                            child: const Text(
                              " *",
                              style: TextStyle(fontSize: 12, fontFamily: danaMedium, color: errorColor),
                            ),
                          )
                        ],
                      ),

                      Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 33, left: 16, right: 16),
                            child: TextInputProfile(
                              textAlign: TextAlign.right,
                                hint: S.of(context).EnterTheOfficeNumber,
                              textStyle: TextStyle(color: (widget.doctorDetail != null) ? textMainColor : grayMainColor, fontFamily: danaMedium, fontSize: 16),
                              initialValue: (widget.doctorDetail != null) ? widget.doctorDetail!.officeNumber : "",
                              labelStyle: TextStyle(color: (widget.doctorDetail != null) ? textMainColor : grayMainColor, fontFamily: danaMedium, fontSize: 16),
                              label: S.of(context).OfficeNumber,
                              type: TextInputType.emailAddress,
                              onFieldSubmitted: (text) {
                                setState(() {
                                  officeNumber = text;
                                });
                              },
                              onFieldChanged: (text) {
                                setState(() {
                                  officeNumber = text;
                                });
                              },
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 25, right: 100),
                            child: const Text(
                              " *",
                              style: TextStyle(fontSize: 12, fontFamily: danaMedium, color: errorColor),
                            ),
                          )
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 33, left: 16, right: 16),
                            child: TextInputProfile(
                              textAlign: TextAlign.right,
                                hint: S.of(context).WriteAboutYourself,
                              textStyle: TextStyle(color: (widget.doctorDetail != null) ? textMainColor : grayMainColor, fontFamily: danaMedium, fontSize: 16),
                              initialValue: (widget.doctorDetail != null) ? widget.doctorDetail!.bio : "",
                              labelStyle: TextStyle(color: (widget.doctorDetail != null) ? textMainColor : grayMainColor, fontFamily: danaMedium, fontSize: 16),
                              label: S.of(context).Biography,
                              type: TextInputType.emailAddress,
                              onFieldSubmitted: (text) {
                                setState(() {
                                  bio = text;
                                });
                              },
                              onFieldChanged: (text) {
                                setState(() {
                                  bio = text;
                                });
                              },
                              minLines: 4,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 25, right: 84),
                            child: const Text(
                              " *",
                              style: TextStyle(fontSize: 12, fontFamily: danaMedium, color: errorColor),
                            ),
                          )
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 33, left: 16, right: 16, bottom: 33),
                            child: TextInputProfile(
                              textAlign: TextAlign.right,
                                hint: S.of(context).IfYouHaveADescriptionStateIt,
                              textStyle: TextStyle(color: (widget.doctorDetail != null) ? textMainColor : grayMainColor, fontFamily: danaMedium, fontSize: 16),
                              initialValue: (widget.doctorDetail != null) ? widget.doctorDetail!.description : "",
                              labelStyle: TextStyle(color: (widget.doctorDetail != null) ? textMainColor : grayMainColor, fontFamily: danaMedium, fontSize: 16),
                              label: S.of(context).PhysicianDescription,
                              type: TextInputType.emailAddress,
                              onFieldSubmitted: (text) {
                                setState(() {
                                  description = text;
                                });
                              },
                              onFieldChanged: (text) {
                                setState(() {
                                  description = text;
                                });
                              },
                              minLines: 4,
                            ),

                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 25, right: 123),
                            child: const Text(
                              " *",
                              style: TextStyle(fontSize: 12, fontFamily: danaMedium, color: errorColor),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 17, right: 30),
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  color: Colors.white,
                  child: Text(
                    S.of(context).AccountInformation,
                    style: const TextStyle(fontSize: 14, fontFamily: danaBold, color: greenMainColor),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 72,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: const Color(0xff000000).withOpacity(0.2), blurRadius: 4)]),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            _profileBloc.add(MedicalInformationEvent(
              doctorDetail:widget.doctorDetail,
                dateOfBirth: (dateOfBirthGregorian != null)
                    ?   dateOfBirthGregorian!.formatter.yyyy + "-" + dateOfBirthGregorian!.formatter.mm + "-" + dateOfBirthGregorian!.formatter.dd
                    : (widget.doctorDetail!.bdate != null)
                        ? widget.doctorDetail!.bdate.toString()
                        : "",
                address: (address!=null || address!.isNotEmpty)?address:widget.doctorDetail!.address,
                email: (email!=null || email!.isNotEmpty)?email:widget.doctorDetail!.email,
              officeNumber:(officeNumber!=null||officeNumber!.isNotEmpty)?officeNumber:widget.doctorDetail!.officeNumber,
              bio:(bio!=null||bio!.isNotEmpty)?bio:widget.doctorDetail!.bio,
              description:(description!=null||description!.isNotEmpty)?description:widget.doctorDetail!.description,),
            );
          },
          child: Container(
            margin: const EdgeInsets.all(12),
            height: 48,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), border: Border.all(width: 1, color:purpleMainColor)),
            child: Text(
              S.of(context).NextLevel,
              style: const TextStyle(fontSize: 16, fontFamily: danaMedium, color: purpleMainColor),
            ),
          ),
        ),
      ),
    );
  }

  void showSheetChangePictureProfile(context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        //isScrollControlled: true,
        builder: (BuildContext bc) {
          return Container(
            height: 450,
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
              ],
            ),
          );
        });
  }
}
