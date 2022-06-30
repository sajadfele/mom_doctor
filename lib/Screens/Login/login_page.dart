import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mom_doctor/Helper/constant.dart';
import 'package:mom_doctor/Screens/BottomNavigatorBar/bottom_navigator_bar.dart';
import 'package:mom_doctor/Screens/Login/bolc/login_bloc.dart';
import 'package:mom_doctor/Screens/Login/enter_phone.dart';
import 'package:mom_doctor/Screens/Login/register.dart';
import 'package:mom_doctor/Screens/Login/verify_phone.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginBloc _LoginBloc;

  @override
  void initState() {
    _LoginBloc = BlocProvider.of<LoginBloc>(context);
    _LoginBloc.emit(IsNotEnterPhoneState());
    //_LoginBloc.add(EnterPhoneEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {
        if (state is IsRegisterState) {
          //Navigator.pop(context);
          Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => BottomNavigatorBar()));
          // Navigator.pop(context);
          setState(() {

          });
        }
      }, builder: (context, state) {
        if (state is LoadingState) {
          return Container(
              alignment: Alignment.center,
              height: MediaQuery.of(context).size.height,
              child: CircularProgressIndicator(
                color: purpleMainColor,
              ));
        } else if (state is IsNotEnterPhoneState) {
          return EnterPhone();
        } else if (state is IsNotVerifyCodeState) {
          return VerifyPhone(numberPhone: state.numberPhone);
        } else if (state is IsNotRegisterState) {
          return Register(userId:state.userId);
        }/*else if(state is IsRegisterState){
          print("two");
          return BottomNavigatorBar();
        }*/
        return Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height,
            child: CircularProgressIndicator(
              color: purpleMainColor,
            ));
      }),
    );
  }

  Widget _noContent() {
    return Text("بدون محتوا");
  }
}
