import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mom_doctor/Helper/constant.dart';
import 'package:mom_doctor/Screens/Profile/bloc/profile_bloc.dart';
import 'package:mom_doctor/Screens/Profile/model/doctor_model.dart';
import 'package:mom_doctor/Screens/Profile/my_profile/account_information.dart';
import 'package:mom_doctor/Screens/Profile/my_profile/financial_information.dart';
import 'package:mom_doctor/Screens/Profile/my_profile/medical_information.dart';

class CompleteProfileMain extends StatefulWidget {
  String? title;
  DoctorModel? doctorDetail;

  CompleteProfileMain({Key? key, this.title, this.doctorDetail}) : super(key: key);

  @override
  State<CompleteProfileMain> createState() => _completeProfileState();
}

class _completeProfileState extends State<CompleteProfileMain> {
  late ProfileBloc _ProfileBloc;

  ProfileState? _ProfileState;

  int selectedPageNum = 0;

  @override
  void initState() {
    _ProfileBloc = BlocProvider.of<ProfileBloc>(context);
    _ProfileBloc.add(AccountInformationEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_ProfileBloc.state is IsNotAccountInformationState) {
          Navigator.pop(context);
        } else if (_ProfileBloc.state is IsNotMedicalInformationState) {
          _ProfileBloc.add(AccountInformationEvent());
        } else if (_ProfileBloc.state is IsNotFinancialInformationState){
          _ProfileBloc.add(MedicalInformationEvent(doctorDetail: widget.doctorDetail));
        }else{
          Navigator.pop(context);
        }
        setState(() {});
        return false;
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: const Color(0xff000000).withOpacity(0.1),
                offset: const Offset(0, 2.0),
                blurRadius: 10.0,
              )
            ]),
            child: AppBar(
              leadingWidth: 30,
              elevation: 0.0,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title!,
                    style: const TextStyle(fontSize: 16, fontFamily: danaMedium, color: textColor),
                  ),
                  Text(
                    "$selectedPageNum/3",
                    style: const TextStyle(fontSize: 12, fontFamily: danaMedium, color: textColor),
                  )
                ],
              ),
            ),
          ),
        ),
        body: BlocConsumer<ProfileBloc, ProfileState>(listener: (context, state) {
          if (state is LoadingState) {
          } else if (state is IsNotAccountInformationState) {
            selectedPageNum = 1;
          } else if (state is IsNotMedicalInformationState) {
            selectedPageNum = 2;
          }else if(state is IsNotFinancialInformationState){
            selectedPageNum= 3;
          }

          if (state is SavedChangesState) {
            Navigator.pop(context, (route) => false);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: const Duration(seconds: 2),
                margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                behavior: SnackBarBehavior.floating,
                content: const Text(
                  'تغییرات با موفقیت ذخیره شد',
                  style: TextStyle(fontFamily: danaMedium),
                ),
              ),
            );
          }
          setState(() {});
        }, builder: (context, state) {
          if (state is LoadingState) {
            return Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height,
                child: const CircularProgressIndicator(
                  color: greenMainColor,
                ));
          } else if (state is IsNotAccountInformationState) {
            return AccountInformation(doctorDetail: widget.doctorDetail);
          }
          /*else if(state is IsNotCompleteProfile2State){
                return CompleteProfile2(questionTitles:state.questions,dateOfBirth:state.dateOfBirth,gender:state.gender,address:state.address,email:state.email);
              }*/
          else if (state is IsNotMedicalInformationState) {
            return MedicalInformation(
                doctorDetail:state.doctorDetail,
                dateOfBirth: state.dateOfBirth,
                address: state.address,
                email: state.email,
                officeNumber: state.officeNumber,
                description: state.description,
                bio: state.bio);
          }else if(state is IsNotFinancialInformationState){
            return FinancialInformation(
                doctorDetail:state.doctorDetail,
                dateOfBirth: state.dateOfBirth,
                address: state.address,
                email: state.email,
                officeNumber: state.officeNumber,
                description: state.description,
                bio: state.bio,
                listMedicalFields: state.listMedicalFields,
                listInsurList: state.listInsurList
            );
          }
          return _noContent();
        }),
      ),
    );
  }

  Widget _noContent() {
    return const Text("بدون محتوا");
  }
}
