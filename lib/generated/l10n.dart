// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `my patients`
  String get MyPatients {
    return Intl.message(
      'my patients',
      name: 'MyPatients',
      desc: '',
      args: [],
    );
  }

  /// `Question and Answer`
  String get QuestionAndAnswer {
    return Intl.message(
      'Question and Answer',
      name: 'QuestionAndAnswer',
      desc: '',
      args: [],
    );
  }

  /// `profile`
  String get Profile {
    return Intl.message(
      'profile',
      name: 'Profile',
      desc: '',
      args: [],
    );
  }

  /// `????????/ ?????? ??????`
  String get loginRegister {
    return Intl.message(
      '????????/ ?????? ??????',
      name: 'loginRegister',
      desc: '',
      args: [],
    );
  }

  /// `????????! ?????????? ???????????? ???????????? ???? ???????? ????????`
  String get EnterYourMobileNumber {
    return Intl.message(
      '????????! ?????????? ???????????? ???????????? ???? ???????? ????????',
      name: 'EnterYourMobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `09123456789`
  String get HintEnterNumberPhone {
    return Intl.message(
      '09123456789',
      name: 'HintEnterNumberPhone',
      desc: '',
      args: [],
    );
  }

  /// `?????????? ????????????`
  String get LabelNumberPhone {
    return Intl.message(
      '?????????? ????????????',
      name: 'LabelNumberPhone',
      desc: '',
      args: [],
    );
  }

  /// `?????????? ???? ??????????`
  String get SendVerificationCode {
    return Intl.message(
      '?????????? ???? ??????????',
      name: 'SendVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `???? ???????? ???? ???????????`
  String get ByEnteringMam {
    return Intl.message(
      '???? ???????? ???? ???????????',
      name: 'ByEnteringMam',
      desc: '',
      args: [],
    );
  }

  /// ` ?????????? ?? ???????? ??????????`
  String get TermsAndConditions {
    return Intl.message(
      ' ?????????? ?? ???????? ??????????',
      name: 'TermsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `?????? ???? ????????????????? .`
  String get IAcceptMam {
    return Intl.message(
      '?????? ???? ????????????????? .',
      name: 'IAcceptMam',
      desc: '',
      args: [],
    );
  }

  /// `???????? ?????????? ???????? ?????? ???? ???????? ????????!`
  String get PleaseEnterYourPhoneNumber {
    return Intl.message(
      '???????? ?????????? ???????? ?????? ???? ???????? ????????!',
      name: 'PleaseEnterYourPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `?????????? ?????????? ???????? ???? ???? ???????? ??????!`
  String get MobileNumberMustStartWith09 {
    return Intl.message(
      '?????????? ?????????? ???????? ???? ???? ???????? ??????!',
      name: 'MobileNumberMustStartWith09',
      desc: '',
      args: [],
    );
  }

  /// `?????????? ???????? ???????? ???? ?????? ????????!`
  String get PhoneNumberMustBe11Digits {
    return Intl.message(
      '?????????? ???????? ???????? ???? ?????? ????????!',
      name: 'PhoneNumberMustBe11Digits',
      desc: '',
      args: [],
    );
  }

  /// `???? ?????????? ???? ???????? ????????`
  String get EnterAuthCode {
    return Intl.message(
      '???? ?????????? ???? ???????? ????????',
      name: 'EnterAuthCode',
      desc: '',
      args: [],
    );
  }

  /// `???? ?????????? ???????? ??????????`
  String get ConfirmationCodeWas {
    return Intl.message(
      '???? ?????????? ???????? ??????????',
      name: 'ConfirmationCodeWas',
      desc: '',
      args: [],
    );
  }

  /// `?????????? ????`
  String get SentTo {
    return Intl.message(
      '?????????? ????',
      name: 'SentTo',
      desc: '',
      args: [],
    );
  }

  /// `??????????`
  String get Change {
    return Intl.message(
      '??????????',
      name: 'Change',
      desc: '',
      args: [],
    );
  }

  /// `???? ?????????? ?? ????????`
  String get DigitVerificationCode {
    return Intl.message(
      '???? ?????????? ?? ????????',
      name: 'DigitVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `???????? ???? ???????? ???? ???????? ????????!`
  String get PleaseEnterTheLoginCode {
    return Intl.message(
      '???????? ???? ???????? ???? ???????? ????????!',
      name: 'PleaseEnterTheLoginCode',
      desc: '',
      args: [],
    );
  }

  /// `???? ???????? ???????? ?? ?????? ????????!`
  String get TheLoginCodeMustBe4Digits {
    return Intl.message(
      '???? ???????? ???????? ?? ?????? ????????!',
      name: 'TheLoginCodeMustBe4Digits',
      desc: '',
      args: [],
    );
  }

  /// `???? ?????????? ?? ????????`
  String get LabelVerifyCode {
    return Intl.message(
      '???? ?????????? ?? ????????',
      name: 'LabelVerifyCode',
      desc: '',
      args: [],
    );
  }

  /// ` ???? ?????????? ???????????? ????`
  String get SendVerifyCode {
    return Intl.message(
      ' ???? ?????????? ???????????? ????',
      name: 'SendVerifyCode',
      desc: '',
      args: [],
    );
  }

  /// `?????????? ???????????? ????`
  String get SendVerifyCode2 {
    return Intl.message(
      '?????????? ???????????? ????',
      name: 'SendVerifyCode2',
      desc: '',
      args: [],
    );
  }

  /// `??????????`
  String get Confirmation {
    return Intl.message(
      '??????????',
      name: 'Confirmation',
      desc: '',
      args: [],
    );
  }

  /// `?????? ??????`
  String get Register {
    return Intl.message(
      '?????? ??????',
      name: 'Register',
      desc: '',
      args: [],
    );
  }

  /// `???????? ???????? ?????????? ?????????? ???????????? ??????`
  String get ItIsMandatoryMoEnterAllItems {
    return Intl.message(
      '???????? ???????? ?????????? ?????????? ???????????? ??????',
      name: 'ItIsMandatoryMoEnterAllItems',
      desc: '',
      args: [],
    );
  }

  /// `?????? ?????? ???? ???????? ????????`
  String get EnterYourName {
    return Intl.message(
      '?????? ?????? ???? ???????? ????????',
      name: 'EnterYourName',
      desc: '',
      args: [],
    );
  }

  /// `?????? ???????????????? ?????? ???? ???????? ????????`
  String get EnterYourLastName {
    return Intl.message(
      '?????? ???????????????? ?????? ???? ???????? ????????',
      name: 'EnterYourLastName',
      desc: '',
      args: [],
    );
  }

  /// `??????`
  String get FirstName {
    return Intl.message(
      '??????',
      name: 'FirstName',
      desc: '',
      args: [],
    );
  }

  /// `?????? ????????????????`
  String get LastName {
    return Intl.message(
      '?????? ????????????????',
      name: 'LastName',
      desc: '',
      args: [],
    );
  }

  /// `?????????????? ???????? ????????????`
  String get AccountInformation {
    return Intl.message(
      '?????????????? ???????? ????????????',
      name: 'AccountInformation',
      desc: '',
      args: [],
    );
  }

  /// `?????????????? ????`
  String get MyProfile {
    return Intl.message(
      '?????????????? ????',
      name: 'MyProfile',
      desc: '',
      args: [],
    );
  }

  /// `?????? ???????? ????????`
  String get RecordWorkingHours {
    return Intl.message(
      '?????? ???????? ????????',
      name: 'RecordWorkingHours',
      desc: '',
      args: [],
    );
  }

  /// `???????????? ????????`
  String get InsuranceManagement {
    return Intl.message(
      '???????????? ????????',
      name: 'InsuranceManagement',
      desc: '',
      args: [],
    );
  }

  /// `???????????? ????????`
  String get SpecialtyManagement {
    return Intl.message(
      '???????????? ????????',
      name: 'SpecialtyManagement',
      desc: '',
      args: [],
    );
  }

  /// `???????????????????`
  String get Transactions {
    return Intl.message(
      '???????????????????',
      name: 'Transactions',
      desc: '',
      args: [],
    );
  }

  /// `??????????????`
  String get Setting {
    return Intl.message(
      '??????????????',
      name: 'Setting',
      desc: '',
      args: [],
    );
  }

  /// `?????????? ?????? ????????`
  String get TakeANewPhoto {
    return Intl.message(
      '?????????? ?????? ????????',
      name: 'TakeANewPhoto',
      desc: '',
      args: [],
    );
  }

  /// `???????????? ???? ??????????`
  String get SelectionFromGallery {
    return Intl.message(
      '???????????? ???? ??????????',
      name: 'SelectionFromGallery',
      desc: '',
      args: [],
    );
  }

  /// `?????? ?????? ????????`
  String get DeleteCurrentPhoto {
    return Intl.message(
      '?????? ?????? ????????',
      name: 'DeleteCurrentPhoto',
      desc: '',
      args: [],
    );
  }

  /// `?????? ??????`
  String get ImageCrop {
    return Intl.message(
      '?????? ??????',
      name: 'ImageCrop',
      desc: '',
      args: [],
    );
  }

  /// `?????? ?????????????? ???? ??????????????????? ?????? ???????? ?????? ???? ???????? ???????? ???????????? ?????? ???????? ?? ???? ???????? ?????????? ?????????? ???????? .`
  String get DescriptionCallToActionLogin {
    return Intl.message(
      '?????? ?????????????? ???? ??????????????????? ?????? ???????? ?????? ???? ???????? ???????? ???????????? ?????? ???????? ?? ???? ???????? ?????????? ?????????? ???????? .',
      name: 'DescriptionCallToActionLogin',
      desc: '',
      args: [],
    );
  }

  /// `???????? ???? ????????`
  String get LoginToAccount {
    return Intl.message(
      '???????? ???? ????????',
      name: 'LoginToAccount',
      desc: '',
      args: [],
    );
  }

  /// `?????? ???? ?????????????? ????????????`
  String get CommunicationError {
    return Intl.message(
      '?????? ???? ?????????????? ????????????',
      name: 'CommunicationError',
      desc: '',
      args: [],
    );
  }

  /// `???????? ????????`
  String get Retry {
    return Intl.message(
      '???????? ????????',
      name: 'Retry',
      desc: '',
      args: [],
    );
  }

  /// `???????? ??????????`
  String get Privacy {
    return Intl.message(
      '???????? ??????????',
      name: 'Privacy',
      desc: '',
      args: [],
    );
  }

  /// `???????? ???? ????`
  String get contactUs {
    return Intl.message(
      '???????? ???? ????',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `???????????? ????`
  String get aboutUs {
    return Intl.message(
      '???????????? ????',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `?????????? ??????????????`
  String get TermsOfUse {
    return Intl.message(
      '?????????? ??????????????',
      name: 'TermsOfUse',
      desc: '',
      args: [],
    );
  }

  /// `???????????? ?????????? ???? ????????????`
  String get ShareWithFriends {
    return Intl.message(
      '???????????? ?????????? ???? ????????????',
      name: 'ShareWithFriends',
      desc: '',
      args: [],
    );
  }

  /// `???????? ???? ???????? ????????????`
  String get LogOut {
    return Intl.message(
      '???????? ???? ???????? ????????????',
      name: 'LogOut',
      desc: '',
      args: [],
    );
  }

  /// `???????? ???? ????????`
  String get Exit {
    return Intl.message(
      '???????? ???? ????????',
      name: 'Exit',
      desc: '',
      args: [],
    );
  }

  /// `????????????`
  String get Back {
    return Intl.message(
      '????????????',
      name: 'Back',
      desc: '',
      args: [],
    );
  }

  /// `?????? ???????? ???????? ???? ???????? ???????????? ?????? ?????????? ????????????`
  String get AreYouSureYouWantToLogOutOfYourAccount {
    return Intl.message(
      '?????? ???????? ???????? ???? ???????? ???????????? ?????? ?????????? ????????????',
      name: 'AreYouSureYouWantToLogOutOfYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `????????????`
  String get Cancel {
    return Intl.message(
      '????????????',
      name: 'Cancel',
      desc: '',
      args: [],
    );
  }

  /// `???????????? ????????`
  String get Select {
    return Intl.message(
      '???????????? ????????',
      name: 'Select',
      desc: '',
      args: [],
    );
  }

  /// `?????????? ??????????????`
  String get CompleteProfile {
    return Intl.message(
      '?????????? ??????????????',
      name: 'CompleteProfile',
      desc: '',
      args: [],
    );
  }

  /// `?????????? ????????`
  String get DateOfBirth {
    return Intl.message(
      '?????????? ????????',
      name: 'DateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `??????????`
  String get Gender {
    return Intl.message(
      '??????????',
      name: 'Gender',
      desc: '',
      args: [],
    );
  }

  /// `????????`
  String get Address {
    return Intl.message(
      '????????',
      name: 'Address',
      desc: '',
      args: [],
    );
  }

  /// `??????????`
  String get Imail {
    return Intl.message(
      '??????????',
      name: 'Imail',
      desc: '',
      args: [],
    );
  }

  /// `?????????? ??????`
  String get NextLevel {
    return Intl.message(
      '?????????? ??????',
      name: 'NextLevel',
      desc: '',
      args: [],
    );
  }

  /// `?????????? ??????????????`
  String get SaveChanges {
    return Intl.message(
      '?????????? ??????????????',
      name: 'SaveChanges',
      desc: '',
      args: [],
    );
  }

  /// `?????????? ??????`
  String get OfficeNumber {
    return Intl.message(
      '?????????? ??????',
      name: 'OfficeNumber',
      desc: '',
      args: [],
    );
  }

  /// `????????????????`
  String get Biography {
    return Intl.message(
      '????????????????',
      name: 'Biography',
      desc: '',
      args: [],
    );
  }

  /// `?????????????? ????????`
  String get PhysicianDescription {
    return Intl.message(
      '?????????????? ????????',
      name: 'PhysicianDescription',
      desc: '',
      args: [],
    );
  }

  /// `???????? ???? ???????? ????????`
  String get EnterTheAddress {
    return Intl.message(
      '???????? ???? ???????? ????????',
      name: 'EnterTheAddress',
      desc: '',
      args: [],
    );
  }

  /// `?????????? ???? ???????? ????????`
  String get EnterTheEmail {
    return Intl.message(
      '?????????? ???? ???????? ????????',
      name: 'EnterTheEmail',
      desc: '',
      args: [],
    );
  }

  /// `?????????? ?????? ???? ???????? ????????`
  String get EnterTheOfficeNumber {
    return Intl.message(
      '?????????? ?????? ???? ???????? ????????',
      name: 'EnterTheOfficeNumber',
      desc: '',
      args: [],
    );
  }

  /// `???????????? ?????? ??????????????`
  String get WriteAboutYourself {
    return Intl.message(
      '???????????? ?????? ??????????????',
      name: 'WriteAboutYourself',
      desc: '',
      args: [],
    );
  }

  /// `?????? ???????????????? ?????????? ?????? ????????`
  String get IfYouHaveADescriptionStateIt {
    return Intl.message(
      '?????? ???????????????? ?????????? ?????? ????????',
      name: 'IfYouHaveADescriptionStateIt',
      desc: '',
      args: [],
    );
  }

  /// `????????`
  String get Specialty {
    return Intl.message(
      '????????',
      name: 'Specialty',
      desc: '',
      args: [],
    );
  }

  /// `?????????????? ??????????`
  String get MedicalInformation {
    return Intl.message(
      '?????????????? ??????????',
      name: 'MedicalInformation',
      desc: '',
      args: [],
    );
  }

  /// `????????????????? ?????? ????????`
  String get CoveredInsurance {
    return Intl.message(
      '????????????????? ?????? ????????',
      name: 'CoveredInsurance',
      desc: '',
      args: [],
    );
  }

  /// `?????????????? ????????`
  String get FinancialInformation {
    return Intl.message(
      '?????????????? ????????',
      name: 'FinancialInformation',
      desc: '',
      args: [],
    );
  }

  /// `?????????? ?????????? ??????????`
  String get TheCostOfAAttendanceVisit {
    return Intl.message(
      '?????????? ?????????? ??????????',
      name: 'TheCostOfAAttendanceVisit',
      desc: '',
      args: [],
    );
  }

  /// `?????????? ?????????? ????????????`
  String get OnlineVisitFee {
    return Intl.message(
      '?????????? ?????????? ????????????',
      name: 'OnlineVisitFee',
      desc: '',
      args: [],
    );
  }

  /// `?????????? ??????`
  String get ShabaNumber {
    return Intl.message(
      '?????????? ??????',
      name: 'ShabaNumber',
      desc: '',
      args: [],
    );
  }

  /// `???????? ?? ????????????????? ????`
  String get MyQuestionsAndAnswers {
    return Intl.message(
      '???????? ?? ????????????????? ????',
      name: 'MyQuestionsAndAnswers',
      desc: '',
      args: [],
    );
  }

  /// `???????????????? ????????`
  String get waitingForAnAnswer {
    return Intl.message(
      '???????????????? ????????',
      name: 'waitingForAnAnswer',
      desc: '',
      args: [],
    );
  }

  /// `???????? ???????? ??????`
  String get HasBeenAnswered {
    return Intl.message(
      '???????? ???????? ??????',
      name: 'HasBeenAnswered',
      desc: '',
      args: [],
    );
  }

  /// `??????`
  String get All {
    return Intl.message(
      '??????',
      name: 'All',
      desc: '',
      args: [],
    );
  }

  /// `???? ????????`
  String get QuestionCode {
    return Intl.message(
      '???? ????????',
      name: 'QuestionCode',
      desc: '',
      args: [],
    );
  }

  /// `??????????`
  String get History {
    return Intl.message(
      '??????????',
      name: 'History',
      desc: '',
      args: [],
    );
  }

  /// `??????????`
  String get Topic {
    return Intl.message(
      '??????????',
      name: 'Topic',
      desc: '',
      args: [],
    );
  }

  /// `?????????? ???????? ??????!`
  String get NothingFound {
    return Intl.message(
      '?????????? ???????? ??????!',
      name: 'NothingFound',
      desc: '',
      args: [],
    );
  }

  /// `???????????? ????????`
  String get QuestionDetail {
    return Intl.message(
      '???????????? ????????',
      name: 'QuestionDetail',
      desc: '',
      args: [],
    );
  }

  /// `???????? ???? ?????? ????????`
  String get TheAnswerToThisQuestion {
    return Intl.message(
      '???????? ???? ?????? ????????',
      name: 'TheAnswerToThisQuestion',
      desc: '',
      args: [],
    );
  }

  /// `?????? ????????`
  String get RecordTheAnswer {
    return Intl.message(
      '?????? ????????',
      name: 'RecordTheAnswer',
      desc: '',
      args: [],
    );
  }

  /// `???? ???????? ???????????? ???????? ?????????? ???? ???????????? ?????? ???????? ???????? ????????.`
  String get YouAreAllowedToTypeUpTo2500CharactersForThisQuestion {
    return Intl.message(
      '???? ???????? ???????????? ???????? ?????????? ???? ???????????? ?????? ???????? ???????? ????????.',
      name: 'YouAreAllowedToTypeUpTo2500CharactersForThisQuestion',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'fa'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
