import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mom_doctor/Helper/constant.dart';
import 'package:mom_doctor/Helper/widgets/TextInput.dart';
import 'package:mom_doctor/Screens/Login/bolc/login_bloc.dart';
import 'package:mom_doctor/generated/l10n.dart';

class Register extends StatefulWidget {
  String? userId;
   Register({Key? key, this.userId}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String? firstName;
  String? lastName;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  late LoginBloc _loginBloc;

  @override
  void initState() {
    _loginBloc=BlocProvider.of<LoginBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 60, left: 102, right: 102),
            child: Image.asset("assets/images/logo-mom.png"),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(top: 48, right: 14),
            child: Text(
              S.of(context).Register,
              style: const TextStyle(fontSize: 18, color: purpleMainColor, fontFamily: danaBold),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(top: 12, right: 14),
            child: Text(
              S.of(context).ItIsMandatoryMoEnterAllItems,
              style: const TextStyle(fontSize: 14, color: grayMainColor, fontFamily: danaMedium),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 32, right: 12, left: 12),
            child: MyTextInput(
              hint: S.of(context).EnterYourName,
              label: S.of(context).FirstName,
              controller: firstNameController,
              textAlign: TextAlign.start,
              onFieldSubmitted: (text) {
                setState(() {
                  firstName = text;
                 /* if (firstName != null) {
                    *//* Route newRoute=CupertinoPageRoute(builder: (context)=>const VerifyPhone());
                      Navigator.pushReplacement(context, newRoute);
                       _loginBloc.add(EnterPhone(phoneNumber: enteredNumber!));*//*
                  } else {
                    print("phone is null");
                  }*/
                });
              },
              onFieldChanged: (text) {
                setState(() {
                  firstName = text;
                });
              },
              type: TextInputType.text,
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 32, right: 12, left: 12, bottom: 10),
            child: MyTextInput(
              hint: S.of(context).EnterYourLastName,
              label: S.of(context).LastName,
              controller: lastNameController,
              textAlign: TextAlign.start,
              onFieldSubmitted: (text) {
                setState(() {
                  lastName = text;
                  if (lastName != null) {
                       _loginBloc.add(RegisterEvent(firstName:firstName,lastName:lastName,docId:widget.userId));
                  } else {
                    print("phone is null");
                  }
                });
              },
              onFieldChanged: (text) {
                setState(() {
                  lastName = text;
                });
              },
              type: TextInputType.text,
            ),
          ),
          Spacer(),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              if (firstName != null && lastName != null && widget.userId!=null) {
                _loginBloc.add(RegisterEvent(firstName:firstName,lastName:lastName,docId:widget.userId));
              } else {
                print("phone is null");
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 12, left: 12, bottom: 24),
              child: Container(
                alignment: Alignment.center,
                height: 48,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: (firstName != null && firstName!.isNotEmpty && lastName != null && lastName!.isNotEmpty) ? purpleMainColor : Color(0xffD8D8D8),
                    borderRadius: BorderRadius.circular(14)),
                child: Text(
                  S.of(context).Confirmation,
                  style: const TextStyle(fontSize: 16, color: Color(0xffffffff), fontFamily: danaMedium),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    ;
  }
}
