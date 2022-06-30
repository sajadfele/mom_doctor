import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:mom_doctor/Screens/Login/model/register_model.dart';
import 'package:mom_doctor/Screens/Login/model/token_model.dart';
import 'package:mom_doctor/Screens/Login/repository/login_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

//////Event

class EnterPhoneEvent extends LoginEvent {
  String? phoneNumber;

  EnterPhoneEvent({this.phoneNumber});

  @override
  List<Object?> get props => [phoneNumber];
}

class StartLoginEvent extends LoginEvent {
  @override
  List<Object?> get props => [];
}

class VerifyCodeEvent extends LoginEvent {
  String? numberPhone;
  String? verifyCode;

  VerifyCodeEvent({this.numberPhone, this.verifyCode});

  @override
  List<Object?> get props => [numberPhone,verifyCode];
}

class RegisterEvent extends LoginEvent {
  String? firstName;
  String? lastName;
  String? docId;

  RegisterEvent({this.firstName, this.lastName, this.docId});

  @override
  List<Object?> get props => [firstName,lastName,docId];
}

//////State

class LoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingState extends LoginState {}

class ErrorState extends LoginState {
  @override
  List<Object?> get props => [];
}

class IsNotEnterPhoneState extends LoginState {
  @override
  List<Object?> get props => [];
}

class IsNotVerifyCodeState extends LoginState {
  String? numberPhone;

  IsNotVerifyCodeState({this.numberPhone});

  @override
  List<Object?> get props => [numberPhone];
}

class IsNotRegisterState extends LoginState {
  String? userId;

  IsNotRegisterState({this.userId});

  @override
  List<Object?> get props => [userId];
}

class IsRegisterState extends LoginState {
  String? userId;

  IsRegisterState({this.userId});

  @override
  List<Object?> get props => [userId];
}

//////Bloc

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(LoginState initialState) : super(initialState);

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    yield LoadingState();
    if (event is EnterPhoneEvent) {
      try{
        yield IsNotVerifyCodeState(numberPhone: event.phoneNumber);
        var result= await EnterPhoneRepository().enterPhone(numberPhone: event.phoneNumber);

      }catch (e) {}

    } else if (event is VerifyCodeEvent) {
      try{
        TokenModel result=await OtpCodeRepository().getToken(numberPhone: event.numberPhone,otpCode: event.verifyCode);
        if(result.token!=null){
          saveToken(result.token!);
        }
        if(result.isSignedUp==false){
          yield IsNotRegisterState(userId:result.user!.id);
        }else {
          saveDoctorId(result.user!.id!);
          yield IsRegisterState();
        }
      }on DioError catch(e){
        if(e.response!.statusCode==406){

        }
      }

    } else if (event is RegisterEvent) {
      RegisterModel result= await RegisterRepository().register(firstName: event.firstName,lastName: event.lastName,docId: event.docId);
      if(result!=null){
        saveDoctorId(result.id!);
        yield IsRegisterState();
      }
    } else if (event is StartLoginEvent) {}
  }
}
saveToken(String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);
}
saveDoctorId(String docId) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('docId', docId);
}
