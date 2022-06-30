import 'dart:convert';
import 'dart:ui';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mom_doctor/Helper/constant.dart';
import 'package:mom_doctor/Screens/Profile/bloc/profile_bloc.dart';
import 'package:mom_doctor/Screens/Profile/model/doctor_model.dart';
import 'package:mom_doctor/Screens/Profile/model/insur_model.dart';
import 'package:mom_doctor/Screens/Profile/model/medical_fields_model.dart';
import 'package:mom_doctor/Screens/Profile/repository/profile_repository.dart';
import 'package:mom_doctor/generated/l10n.dart';

class MedicalInformation extends StatefulWidget {
  String? dateOfBirth;
  String? address;
  String? email;
  String? description;
  String? officeNumber;
  String? bio;
  DoctorModel? doctorDetail;

  MedicalInformation({Key? key, this.dateOfBirth, this.address, this.email, this.description, this.officeNumber, this.bio, this.doctorDetail}) : super(key: key);

  @override
  State<MedicalInformation> createState() => _MedicalInformationState();
}

class _MedicalInformationState extends State<MedicalInformation> {
  //Object? radioFalse=0;
  int radioValue = 0;

  TextEditingController textEditingController = TextEditingController();

  late ProfileBloc _profileBloc;

  String? idRadio;

  List<String> trueIds = [];

  String value = "0";


  List<MedicalFieldModel> listSelectMedicalFields = [];
  List<MedicalFieldModel>? medicalFieldsList;


  List<InsurModel> listSelectInsur=[];
  List<InsurModel>? insursList;

  List<String> listMedicalFieldsApiId=[];

  List<String> listInsurApiId=[];

/*bool isSendOk=false;*/

  Future<void> getMediaclFields() async {
    var result=await ProfileRepository().getListMedicalFields();
    if(result!=null&&result.content!.isNotEmpty){
      medicalFieldsList=result.content;
      setState(() {
      });
    }
  }

  Future<void> getInsurs() async {
    var result=await ProfileRepository().getListinsur();
    if(result!=null&&result.content!.isNotEmpty){
      insursList=result.content!;
      setState(() {
      });
    }
  }

  @override
  void initState() {
    _profileBloc = BlocProvider.of<ProfileBloc>(context);
    getMediaclFields();
    getInsurs();

    widget.doctorDetail!.medicalFields!.forEach((element) {
      listSelectMedicalFields.add(element);
    });
    widget.doctorDetail!.insurList!.forEach((element) {
      listSelectInsur.add(element);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 27, left: 12, right: 12),
            decoration: boxDecoration,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 16, right: 16, top: 40),
                      padding: EdgeInsets.only(left: 12, right: 18, top: 4, bottom: 4),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), border: Border.all(width: 1, color: grayMainColor)),
                      child: Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2<dynamic>(
                                isExpanded: false,
                                hint: Align(
                                  alignment: AlignmentDirectional.center,
                                  child: Text(
                                    (medicalFieldsList!=null && medicalFieldsList!.isEmpty) ?   S.of(context).Select:"",
                                    style: TextStyle(fontSize: 16, color: grayMainColor, fontFamily: danaMedium),
                                  ),
                                ),
                                items: (medicalFieldsList!=null)?medicalFieldsList!.map((medical) {
                                  return DropdownMenuItem(
                                    value: medical,
                                    enabled: false,
                                    child: StatefulBuilder(
                                      builder: (context, menuSetState) {
                                        final _isSelected = listSelectMedicalFields.contains(medical);
                                        return InkWell(
                                          onTap: () {
                                            _isSelected ? listSelectMedicalFields.remove(medical) : listSelectMedicalFields.add(medical);
                                            setState(() {});
                                            menuSetState(() {});
                                          },
                                          child: Container(
                                            height: double.infinity,
                                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                            child: Row(
                                              children: [
                                                Checkbox(
                                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                                    activeColor: greenMainColor,
                                                    value: _isSelected,
                                                    onChanged: (value) {
                                                      _isSelected ? listSelectMedicalFields.remove(medical) : listSelectMedicalFields.add(medical);
                                                      setState(() {});
                                                      menuSetState(() {});
                                                    }),
                                                const SizedBox(width: 16),
                                                Text(
                                                  medical.name.toString(),
                                                  style: const TextStyle(fontSize: 14, fontFamily: danaMedium, color: textColor),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                }).toList():[],
                                value: listSelectMedicalFields.isEmpty ? null : null,
                                onChanged: (value) {},
                                buttonHeight: 40,
                                icon: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: grayMainColor,
                                ),
                                itemHeight: 40,
                                itemPadding: EdgeInsets.zero,
                                selectedItemBuilder: (context) {
                                  return (medicalFieldsList!=null)?medicalFieldsList!.map(
                                    (topic) {
                                      return Container(
                                        alignment: AlignmentDirectional.center,
                                        //margin: const EdgeInsets.symmetric(horizontal: 16.0),
                                        child: Text(
                                          listSelectMedicalFields.join(', '),
                                          style: const TextStyle(fontSize: 4, overflow: TextOverflow.ellipsis, fontFamily: danaMedium),
                                        ),
                                      );
                                    },
                                  ).toList():[];
                                },
                              ),
                            ),
                          ),
                          if (listSelectMedicalFields.isNotEmpty)
                            Wrap(
                              direction: Axis.horizontal,
                              children:
                              listSelectMedicalFields.map((itemm) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      listSelectMedicalFields.remove(itemm);
                                    });
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width / 3,
                                    height: 36,
                                    margin: EdgeInsets.only(right: 5, top: 10),
                                    decoration: BoxDecoration(color: shadowColor, borderRadius: BorderRadius.circular(28)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          width: MediaQuery.of(context).size.width / 4.8,
                                          child: Text(
                                            itemm.name.toString(),
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(fontSize: 14, fontFamily: danaLight, color: textColor,overflow: TextOverflow.ellipsis),
                                          ),
                                        ),
                                        Container(
                                            margin: EdgeInsets.all(10),
                                            height: 17,
                                            width: 17,
                                            decoration: BoxDecoration(color: grayMainColor, borderRadius: BorderRadius.circular(15)),
                                            child: Icon(
                                              Icons.clear,
                                              size: 13,
                                              color: shadowColor,
                                            )),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      alignment: Alignment.center,
                      width: 50,
                      margin: const EdgeInsets.only(top: 30, right: 36),
                      child: Text(
                        S.of(context).Specialty,
                        style: TextStyle(fontSize: 12, fontFamily: danaMedium, color: textColor),
                      ),
                    )
                  ],
                ),
                Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 16, right: 16, top: 24, bottom: 32),
                      padding: EdgeInsets.only(left: 12, right: 18, top: 4, bottom: 4),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), border: Border.all(width: 1, color: grayMainColor)),
                      child: Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2<dynamic>(
                                isExpanded: false,
                                hint: Align(
                                  alignment: AlignmentDirectional.center,
                                  child: Text(
                                    (insursList!=null && insursList!.isEmpty) ?  S.of(context).Select:"",
                                    style: TextStyle(fontSize: 16, color: grayMainColor, fontFamily: danaMedium),
                                  ),
                                ),
                                items: (insursList!=null)?insursList!.map((insur) {
                                  return DropdownMenuItem(
                                    value: insur,
                                    //disable default onTap to avoid closing menu when selecting an item
                                    enabled: false,
                                    child: StatefulBuilder(
                                      builder: (context, menuSetState) {
                                        final _isSelected = listSelectInsur.contains(insur);
                                        return InkWell(
                                          onTap: () {
                                            _isSelected ? listSelectInsur.remove(insur) : listSelectInsur.add(insur);
                                            //This rebuilds the StatefulWidget to update the button's text
                                            setState(() {});
                                            //This rebuilds the dropdownMenu Widget to update the check mark
                                            menuSetState(() {});
                                          },
                                          child: Container(
                                            height: double.infinity,
                                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                            child: Row(
                                              children: [
                                                // _isSelected ? Checkbox(value: false, onChanged: (value)=>value=true) : const Icon(Icons.check_box_outline_blank),
                                                Checkbox(
                                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                                                    activeColor: greenMainColor,
                                                    value: _isSelected,
                                                    onChanged: (value) {
                                                      _isSelected ? listSelectInsur.remove(insur) : listSelectInsur.add(insur);
                                                      setState(() {});
                                                      menuSetState(() {});
                                                    }),
                                                const SizedBox(width: 16),
                                                Text(
                                                  insur.name.toString(),
                                                  style: const TextStyle(fontSize: 14, fontFamily: danaMedium, color: textColor),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                }).toList():[],
                                value: (insursList!=null&&insursList!.isNotEmpty) ? null : null,
                                onChanged: (value) {},
                                buttonHeight: 40,
                                icon: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: grayMainColor,
                                ),
                                itemHeight: 40,
                                itemPadding: EdgeInsets.zero,
                                selectedItemBuilder: (context) {
                                  return (insursList!=null)?insursList!.map(
                                    (topic) {
                                      return Container(
                                        alignment: AlignmentDirectional.center,
                                        //margin: const EdgeInsets.symmetric(horizontal: 16.0),
                                        child: Text(
                                          listSelectInsur.join(', '),
                                          style: const TextStyle(fontSize: 4, overflow: TextOverflow.ellipsis, fontFamily: danaMedium),
                                        ),
                                      );
                                    },
                                  ).toList():[];
                                },
                              ),
                            ),
                          ),
                          if (listSelectInsur.isNotEmpty)
                            Wrap(
                              direction: Axis.horizontal,
                              children: (listSelectInsur.isNotEmpty)?listSelectInsur.map((itemm) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      listSelectInsur.remove(itemm);
                                    });
                                  },
                                  child: Container(
                                    width: MediaQuery.of(context).size.width / 3,
                                    height: 36,
                                    margin: EdgeInsets.only(right: 5, top: 10),
                                    decoration: BoxDecoration(color: shadowColor, borderRadius: BorderRadius.circular(28)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 5),
                                          alignment: Alignment.center,
                                          width: MediaQuery.of(context).size.width / 4.8,
                                          child: Text(
                                            itemm.name.toString(),
                                            overflow: TextOverflow.ellipsis,softWrap: true,
                                            style: const TextStyle(fontSize: 14, fontFamily: danaLight, color: textColor,overflow: TextOverflow.ellipsis),
                                          ),
                                        ),
                                        Container(
                                            margin: EdgeInsets.all(10),
                                            height: 17,
                                            width: 17,
                                            decoration: BoxDecoration(color: grayMainColor, borderRadius: BorderRadius.circular(15)),
                                            child: Icon(
                                              Icons.clear,
                                              size: 13,
                                              color: shadowColor,
                                            )),
                                      ],
                                    ),
                                  ),
                                );
                              }).toList():[],
                            ),
                        ],
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      alignment: Alignment.center,
                      width: 120,
                      margin: const EdgeInsets.only(top: 15, right: 36),
                      child: Text(
                        S.of(context).CoveredInsurance,
                        style: TextStyle(fontSize: 12, fontFamily: danaMedium, color: textColor),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            alignment: Alignment.center,
            width: 100,
            margin: const EdgeInsets.only(top: 15, right: 36),
            child: Text(
              S.of(context).MedicalInformation,
              style: TextStyle(fontSize: 14, fontFamily: danaBold, color: purpleMainColor),
            ),
          )
        ],
      )),
      bottomNavigationBar: Container(
        height: 72,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: const Color(0xff000000).withOpacity(0.2), blurRadius: 4)]),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            listSelectMedicalFields.forEach((element) {
              listMedicalFieldsApiId.add(element.id!);
            });
            listSelectInsur.forEach((element) {
              listInsurApiId.add(element.id!);
            });
            setState(() {

            });

            _profileBloc.add(FinancialInformationEvent(
                dateOfBirth: widget.dateOfBirth,
                address: widget.address,
                email: widget.email,
                bio: widget.bio,
                description: widget.description,
                officeNumber: widget.officeNumber,
                doctorDetail: widget.doctorDetail,
                listMedicalFields: listMedicalFieldsApiId,
                listInsurList:listInsurApiId));
          },
          child: Container(
            margin: const EdgeInsets.all(12),
            height: 48,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), border: Border.all(color: purpleMainColor, width: 1)),
            child: Text(
              S.of(context).NextLevel,
              style: const TextStyle(fontSize: 16, fontFamily: danaMedium, color: purpleMainColor),
            ),
          ),
        ),
      ),
    );
  }
}
