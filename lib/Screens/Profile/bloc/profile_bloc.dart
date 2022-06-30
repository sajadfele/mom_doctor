import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mom_doctor/Screens/Profile/model/doctor_model.dart';
import 'package:mom_doctor/Screens/Profile/model/insur_model.dart';
import 'package:mom_doctor/Screens/Profile/repository/profile_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

////Event

class ProfileEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AccountInformationEvent extends ProfileEvent {
  @override
  List<Object?> get props => [];
}

class MedicalInformationEvent extends ProfileEvent {
  String? dateOfBirth;
  String? gender;
  String? address;
  String? email;
  String? officeNumber;
  String? bio;
  String? description;
  DoctorModel? doctorDetail;

  MedicalInformationEvent({this.dateOfBirth, this.gender, this.address, this.email, this.officeNumber, this.bio, this.description, this.doctorDetail});

  @override
  List<Object?> get props => [dateOfBirth, gender, address, email, officeNumber, bio, description];
}

class FinancialInformationEvent extends ProfileEvent {
  String? dateOfBirth;
  String? address;
  String? email;
  String? officeNumber;
  String? bio;
  String? description;
  DoctorModel? doctorDetail;
  List<dynamic>? listMedicalFields;
  List<dynamic>? listInsurList;

  FinancialInformationEvent(
      {this.dateOfBirth, this.address, this.email, this.officeNumber, this.bio, this.description, this.doctorDetail, this.listMedicalFields, this.listInsurList});

  @override
  List<Object?> get props => [dateOfBirth, address, email, officeNumber, bio, description];
}

class SaveChangeEvent extends ProfileEvent {
  String? dateOfBirth;
  String? address;
  String? email;
  String? officeNumber;
  String? bio;
  String? description;
  List<dynamic>? listMedicalFields;
  List<dynamic>? listInsurList;
  String? offlineVisit;
  String? onlineVisit;
  String? shabaNumber;

  SaveChangeEvent(
      {this.dateOfBirth,
      this.address,
      this.email,
      this.officeNumber,
      this.description,
      this.bio,
      this.listMedicalFields,
      this.listInsurList,
      this.offlineVisit,
      this.onlineVisit,
      this.shabaNumber});

  @override
  List<Object?> get props => [dateOfBirth, address, email, listInsurList, listMedicalFields, bio, description, officeNumber, onlineVisit, offlineVisit, shabaNumber];
}

////State

class ProfileState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingState extends ProfileState {
  @override
  List<Object?> get props => [];
}

class ErrorState extends ProfileState {
  @override
  List<Object?> get props => [];
}

class IsNotAccountInformationState extends ProfileState {
  @override
  List<Object?> get props => [];
}

class IsNotMedicalInformationState extends ProfileState {
  String? dateOfBirth;
  String? gender;
  String? address;
  String? email;
  String? officeNumber;
  String? bio;
  String? description;
  DoctorModel? doctorDetail;

  IsNotMedicalInformationState({this.dateOfBirth, this.address, this.gender, this.email, this.officeNumber, this.description, this.bio, this.doctorDetail});

  @override
  List<Object?> get props => [];
}

class IsNotFinancialInformationState extends ProfileState {
  String? dateOfBirth;
  String? address;
  String? email;
  String? officeNumber;
  String? bio;
  String? description;
  DoctorModel? doctorDetail;
  List<dynamic>? listMedicalFields;
  List<dynamic>? listInsurList;

  IsNotFinancialInformationState(
      {this.dateOfBirth, this.address, this.email, this.officeNumber, this.description, this.bio, this.doctorDetail, this.listMedicalFields, this.listInsurList});

  @override
  List<Object?> get props => [];
}

class SavedChangesState extends ProfileState {
  SavedChangesState();

  @override
  List<Object?> get props => [];
}

////Bloc

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc(ProfileState initialState) : super(initialState);

  /* String? dateOfBirth;
  String? gender;
  String? address;
  String? email;*/

  @override
  Stream<ProfileState> mapEventToState(ProfileEvent event) async* {
    yield LoadingState();
    if (event is AccountInformationEvent) {
      yield IsNotAccountInformationState();
    } else if (event is MedicalInformationEvent) {
      yield IsNotMedicalInformationState(
          doctorDetail: event.doctorDetail,
          dateOfBirth: event.dateOfBirth,
          gender: event.gender,
          address: event.address,
          email: event.email,
          officeNumber: event.officeNumber,
          description: event.description,
          bio: event.bio);
    } else if (event is FinancialInformationEvent) {
      yield IsNotFinancialInformationState(
          dateOfBirth: event.dateOfBirth,
          address: event.address,
          email: event.email,
          officeNumber: event.officeNumber,
          description: event.description,
          bio: event.bio,
          listInsurList: event.listInsurList,
          listMedicalFields: event.listMedicalFields,
          doctorDetail: event.doctorDetail);
    } else if (event is SaveChangeEvent) {
      var result = await ProfileRepository().updateDoctorDetail(
        address: event.address,
        email: event.email,
        officeNumber: event.officeNumber,
        description: event.description,
        bio: event.bio,
        bdate: event.dateOfBirth,
        shebaNumber: event.shabaNumber,
        onlinePrice: event.onlineVisit,
        offlinePrice: event.offlineVisit,
        insurList: event.listInsurList,
        medicalList: event.listMedicalFields
      );
      if(result==200){
        yield SavedChangesState();
      }
    }
  }
}
