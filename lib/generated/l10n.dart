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

  /// `ورود/ ثبت نام`
  String get loginRegister {
    return Intl.message(
      'ورود/ ثبت نام',
      name: 'loginRegister',
      desc: '',
      args: [],
    );
  }

  /// `سلام! شماره موبایل خودتون رو وارد کنید`
  String get EnterYourMobileNumber {
    return Intl.message(
      'سلام! شماره موبایل خودتون رو وارد کنید',
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

  /// `شماره موبایل`
  String get LabelNumberPhone {
    return Intl.message(
      'شماره موبایل',
      name: 'LabelNumberPhone',
      desc: '',
      args: [],
    );
  }

  /// `ارسال کد تایید`
  String get SendVerificationCode {
    return Intl.message(
      'ارسال کد تایید',
      name: 'SendVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `با ورود به مام‌،`
  String get ByEnteringMam {
    return Intl.message(
      'با ورود به مام‌،',
      name: 'ByEnteringMam',
      desc: '',
      args: [],
    );
  }

  /// ` شرایط و حریم خصوصی`
  String get TermsAndConditions {
    return Intl.message(
      ' شرایط و حریم خصوصی',
      name: 'TermsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `مام را می‌پذیرم .`
  String get IAcceptMam {
    return Intl.message(
      'مام را می‌پذیرم .',
      name: 'IAcceptMam',
      desc: '',
      args: [],
    );
  }

  /// `لطفا شماره تلفن خود را وارد کنید!`
  String get PleaseEnterYourPhoneNumber {
    return Intl.message(
      'لطفا شماره تلفن خود را وارد کنید!',
      name: 'PleaseEnterYourPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `شماره همراه باید با ۰۹ شروع شود!`
  String get MobileNumberMustStartWith09 {
    return Intl.message(
      'شماره همراه باید با ۰۹ شروع شود!',
      name: 'MobileNumberMustStartWith09',
      desc: '',
      args: [],
    );
  }

  /// `شماره تلفن باید ۱۱ رقم باشد!`
  String get PhoneNumberMustBe11Digits {
    return Intl.message(
      'شماره تلفن باید ۱۱ رقم باشد!',
      name: 'PhoneNumberMustBe11Digits',
      desc: '',
      args: [],
    );
  }

  /// `کد تایید را وارد کنید`
  String get EnterAuthCode {
    return Intl.message(
      'کد تایید را وارد کنید',
      name: 'EnterAuthCode',
      desc: '',
      args: [],
    );
  }

  /// `کد تایید برای شماره`
  String get ConfirmationCodeWas {
    return Intl.message(
      'کد تایید برای شماره',
      name: 'ConfirmationCodeWas',
      desc: '',
      args: [],
    );
  }

  /// `ارسال شد`
  String get SentTo {
    return Intl.message(
      'ارسال شد',
      name: 'SentTo',
      desc: '',
      args: [],
    );
  }

  /// `تغییر`
  String get Change {
    return Intl.message(
      'تغییر',
      name: 'Change',
      desc: '',
      args: [],
    );
  }

  /// `کد تایید ۴ رقمی`
  String get DigitVerificationCode {
    return Intl.message(
      'کد تایید ۴ رقمی',
      name: 'DigitVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `لطفا کد ورود را وارد کنید!`
  String get PleaseEnterTheLoginCode {
    return Intl.message(
      'لطفا کد ورود را وارد کنید!',
      name: 'PleaseEnterTheLoginCode',
      desc: '',
      args: [],
    );
  }

  /// `کد ورود باید ۴ رقم باشد!`
  String get TheLoginCodeMustBe4Digits {
    return Intl.message(
      'کد ورود باید ۴ رقم باشد!',
      name: 'TheLoginCodeMustBe4Digits',
      desc: '',
      args: [],
    );
  }

  /// `کد تایید ۴ رقمی`
  String get LabelVerifyCode {
    return Intl.message(
      'کد تایید ۴ رقمی',
      name: 'LabelVerifyCode',
      desc: '',
      args: [],
    );
  }

  /// ` تا ارسال دوباره کد`
  String get SendVerifyCode {
    return Intl.message(
      ' تا ارسال دوباره کد',
      name: 'SendVerifyCode',
      desc: '',
      args: [],
    );
  }

  /// `ارسال دوباره کد`
  String get SendVerifyCode2 {
    return Intl.message(
      'ارسال دوباره کد',
      name: 'SendVerifyCode2',
      desc: '',
      args: [],
    );
  }

  /// `تایید`
  String get Confirmation {
    return Intl.message(
      'تایید',
      name: 'Confirmation',
      desc: '',
      args: [],
    );
  }

  /// `ثبت نام`
  String get Register {
    return Intl.message(
      'ثبت نام',
      name: 'Register',
      desc: '',
      args: [],
    );
  }

  /// `وارد کردن تمامی موارد اجباری است`
  String get ItIsMandatoryMoEnterAllItems {
    return Intl.message(
      'وارد کردن تمامی موارد اجباری است',
      name: 'ItIsMandatoryMoEnterAllItems',
      desc: '',
      args: [],
    );
  }

  /// `نام خود را وارد کنید`
  String get EnterYourName {
    return Intl.message(
      'نام خود را وارد کنید',
      name: 'EnterYourName',
      desc: '',
      args: [],
    );
  }

  /// `نام خانوادگی خود را وارد کنید`
  String get EnterYourLastName {
    return Intl.message(
      'نام خانوادگی خود را وارد کنید',
      name: 'EnterYourLastName',
      desc: '',
      args: [],
    );
  }

  /// `نام`
  String get FirstName {
    return Intl.message(
      'نام',
      name: 'FirstName',
      desc: '',
      args: [],
    );
  }

  /// `نام خانوادگی`
  String get LastName {
    return Intl.message(
      'نام خانوادگی',
      name: 'LastName',
      desc: '',
      args: [],
    );
  }

  /// `اطلاعات حساب کاربری`
  String get AccountInformation {
    return Intl.message(
      'اطلاعات حساب کاربری',
      name: 'AccountInformation',
      desc: '',
      args: [],
    );
  }

  /// `پروفایل من`
  String get MyProfile {
    return Intl.message(
      'پروفایل من',
      name: 'MyProfile',
      desc: '',
      args: [],
    );
  }

  /// `ثبت ساعت کاری`
  String get RecordWorkingHours {
    return Intl.message(
      'ثبت ساعت کاری',
      name: 'RecordWorkingHours',
      desc: '',
      args: [],
    );
  }

  /// `مدیریت بیمه`
  String get InsuranceManagement {
    return Intl.message(
      'مدیریت بیمه',
      name: 'InsuranceManagement',
      desc: '',
      args: [],
    );
  }

  /// `مدیریت تخصص`
  String get SpecialtyManagement {
    return Intl.message(
      'مدیریت تخصص',
      name: 'SpecialtyManagement',
      desc: '',
      args: [],
    );
  }

  /// `تراکنش‌ها`
  String get Transactions {
    return Intl.message(
      'تراکنش‌ها',
      name: 'Transactions',
      desc: '',
      args: [],
    );
  }

  /// `تنظیمات`
  String get Setting {
    return Intl.message(
      'تنظیمات',
      name: 'Setting',
      desc: '',
      args: [],
    );
  }

  /// `گرفتن عکس جدید`
  String get TakeANewPhoto {
    return Intl.message(
      'گرفتن عکس جدید',
      name: 'TakeANewPhoto',
      desc: '',
      args: [],
    );
  }

  /// `انتخاب از گالری`
  String get SelectionFromGallery {
    return Intl.message(
      'انتخاب از گالری',
      name: 'SelectionFromGallery',
      desc: '',
      args: [],
    );
  }

  /// `حدف عکس فعلی`
  String get DeleteCurrentPhoto {
    return Intl.message(
      'حدف عکس فعلی',
      name: 'DeleteCurrentPhoto',
      desc: '',
      args: [],
    );
  }

  /// `برش عکس`
  String get ImageCrop {
    return Intl.message(
      'برش عکس',
      name: 'ImageCrop',
      desc: '',
      args: [],
    );
  }

  /// `جهت استفاده از سرویس‌های مام لازم است تا وارد حساب کاربری خود شوید و یا حساب جدیدی ایجاد کنید .`
  String get DescriptionCallToActionLogin {
    return Intl.message(
      'جهت استفاده از سرویس‌های مام لازم است تا وارد حساب کاربری خود شوید و یا حساب جدیدی ایجاد کنید .',
      name: 'DescriptionCallToActionLogin',
      desc: '',
      args: [],
    );
  }

  /// `ورود به حساب`
  String get LoginToAccount {
    return Intl.message(
      'ورود به حساب',
      name: 'LoginToAccount',
      desc: '',
      args: [],
    );
  }

  /// `خطا در برقراری ارتباط`
  String get CommunicationError {
    return Intl.message(
      'خطا در برقراری ارتباط',
      name: 'CommunicationError',
      desc: '',
      args: [],
    );
  }

  /// `تلاش مجدد`
  String get Retry {
    return Intl.message(
      'تلاش مجدد',
      name: 'Retry',
      desc: '',
      args: [],
    );
  }

  /// `حریم خصوصی`
  String get Privacy {
    return Intl.message(
      'حریم خصوصی',
      name: 'Privacy',
      desc: '',
      args: [],
    );
  }

  /// `تماس با ما`
  String get contactUs {
    return Intl.message(
      'تماس با ما',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `درباره ما`
  String get aboutUs {
    return Intl.message(
      'درباره ما',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `شرایط استفاده`
  String get TermsOfUse {
    return Intl.message(
      'شرایط استفاده',
      name: 'TermsOfUse',
      desc: '',
      args: [],
    );
  }

  /// `اشتراک گذاری با دوستان`
  String get ShareWithFriends {
    return Intl.message(
      'اشتراک گذاری با دوستان',
      name: 'ShareWithFriends',
      desc: '',
      args: [],
    );
  }

  /// `خروج از حساب کاربری`
  String get LogOut {
    return Intl.message(
      'خروج از حساب کاربری',
      name: 'LogOut',
      desc: '',
      args: [],
    );
  }

  /// `خروج از حساب`
  String get Exit {
    return Intl.message(
      'خروج از حساب',
      name: 'Exit',
      desc: '',
      args: [],
    );
  }

  /// `بازگشت`
  String get Back {
    return Intl.message(
      'بازگشت',
      name: 'Back',
      desc: '',
      args: [],
    );
  }

  /// `آیا برای خروج از حساب کاربری خود مطمئن هستید؟`
  String get AreYouSureYouWantToLogOutOfYourAccount {
    return Intl.message(
      'آیا برای خروج از حساب کاربری خود مطمئن هستید؟',
      name: 'AreYouSureYouWantToLogOutOfYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `انصراف`
  String get Cancel {
    return Intl.message(
      'انصراف',
      name: 'Cancel',
      desc: '',
      args: [],
    );
  }

  /// `انتخاب کنید`
  String get Select {
    return Intl.message(
      'انتخاب کنید',
      name: 'Select',
      desc: '',
      args: [],
    );
  }

  /// `تکمیل پروفایل`
  String get CompleteProfile {
    return Intl.message(
      'تکمیل پروفایل',
      name: 'CompleteProfile',
      desc: '',
      args: [],
    );
  }

  /// `تاریخ تولد`
  String get DateOfBirth {
    return Intl.message(
      'تاریخ تولد',
      name: 'DateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `جنسیت`
  String get Gender {
    return Intl.message(
      'جنسیت',
      name: 'Gender',
      desc: '',
      args: [],
    );
  }

  /// `آدرس`
  String get Address {
    return Intl.message(
      'آدرس',
      name: 'Address',
      desc: '',
      args: [],
    );
  }

  /// `ایمیل`
  String get Imail {
    return Intl.message(
      'ایمیل',
      name: 'Imail',
      desc: '',
      args: [],
    );
  }

  /// `مرحله بعد`
  String get NextLevel {
    return Intl.message(
      'مرحله بعد',
      name: 'NextLevel',
      desc: '',
      args: [],
    );
  }

  /// `ذخیره تغییرات`
  String get SaveChanges {
    return Intl.message(
      'ذخیره تغییرات',
      name: 'SaveChanges',
      desc: '',
      args: [],
    );
  }

  /// `شماره مطب`
  String get OfficeNumber {
    return Intl.message(
      'شماره مطب',
      name: 'OfficeNumber',
      desc: '',
      args: [],
    );
  }

  /// `بیوگرافی`
  String get Biography {
    return Intl.message(
      'بیوگرافی',
      name: 'Biography',
      desc: '',
      args: [],
    );
  }

  /// `توضیحات پزشک`
  String get PhysicianDescription {
    return Intl.message(
      'توضیحات پزشک',
      name: 'PhysicianDescription',
      desc: '',
      args: [],
    );
  }

  /// `آدرس را وارد کنید`
  String get EnterTheAddress {
    return Intl.message(
      'آدرس را وارد کنید',
      name: 'EnterTheAddress',
      desc: '',
      args: [],
    );
  }

  /// `ایمیل را وارد کنید`
  String get EnterTheEmail {
    return Intl.message(
      'ایمیل را وارد کنید',
      name: 'EnterTheEmail',
      desc: '',
      args: [],
    );
  }

  /// `شماره مطب را وارد کنید`
  String get EnterTheOfficeNumber {
    return Intl.message(
      'شماره مطب را وارد کنید',
      name: 'EnterTheOfficeNumber',
      desc: '',
      args: [],
    );
  }

  /// `درمورد خود بنویسید`
  String get WriteAboutYourself {
    return Intl.message(
      'درمورد خود بنویسید',
      name: 'WriteAboutYourself',
      desc: '',
      args: [],
    );
  }

  /// `اگر توضیحاتی دارید قید کنید`
  String get IfYouHaveADescriptionStateIt {
    return Intl.message(
      'اگر توضیحاتی دارید قید کنید',
      name: 'IfYouHaveADescriptionStateIt',
      desc: '',
      args: [],
    );
  }

  /// `تخصص`
  String get Specialty {
    return Intl.message(
      'تخصص',
      name: 'Specialty',
      desc: '',
      args: [],
    );
  }

  /// `اطلاعات پزشکی`
  String get MedicalInformation {
    return Intl.message(
      'اطلاعات پزشکی',
      name: 'MedicalInformation',
      desc: '',
      args: [],
    );
  }

  /// `بیمه‌های تحت پوشش`
  String get CoveredInsurance {
    return Intl.message(
      'بیمه‌های تحت پوشش',
      name: 'CoveredInsurance',
      desc: '',
      args: [],
    );
  }

  /// `اطلاعات مالی`
  String get FinancialInformation {
    return Intl.message(
      'اطلاعات مالی',
      name: 'FinancialInformation',
      desc: '',
      args: [],
    );
  }

  /// `هزینه ویزیت حضوری`
  String get TheCostOfAAttendanceVisit {
    return Intl.message(
      'هزینه ویزیت حضوری',
      name: 'TheCostOfAAttendanceVisit',
      desc: '',
      args: [],
    );
  }

  /// `هزینه ویزیت آنلاین`
  String get OnlineVisitFee {
    return Intl.message(
      'هزینه ویزیت آنلاین',
      name: 'OnlineVisitFee',
      desc: '',
      args: [],
    );
  }

  /// `شماره شبا`
  String get ShabaNumber {
    return Intl.message(
      'شماره شبا',
      name: 'ShabaNumber',
      desc: '',
      args: [],
    );
  }

  /// `پرسش و پاسخ‌های من`
  String get MyQuestionsAndAnswers {
    return Intl.message(
      'پرسش و پاسخ‌های من',
      name: 'MyQuestionsAndAnswers',
      desc: '',
      args: [],
    );
  }

  /// `درانتظار پاسخ`
  String get waitingForAnAnswer {
    return Intl.message(
      'درانتظار پاسخ',
      name: 'waitingForAnAnswer',
      desc: '',
      args: [],
    );
  }

  /// `پاسخ داده شده`
  String get HasBeenAnswered {
    return Intl.message(
      'پاسخ داده شده',
      name: 'HasBeenAnswered',
      desc: '',
      args: [],
    );
  }

  /// `همه`
  String get All {
    return Intl.message(
      'همه',
      name: 'All',
      desc: '',
      args: [],
    );
  }

  /// `کد پرسش`
  String get QuestionCode {
    return Intl.message(
      'کد پرسش',
      name: 'QuestionCode',
      desc: '',
      args: [],
    );
  }

  /// `تاریخ`
  String get History {
    return Intl.message(
      'تاریخ',
      name: 'History',
      desc: '',
      args: [],
    );
  }

  /// `موضوع`
  String get Topic {
    return Intl.message(
      'موضوع',
      name: 'Topic',
      desc: '',
      args: [],
    );
  }

  /// `موردی یافت نشد!`
  String get NothingFound {
    return Intl.message(
      'موردی یافت نشد!',
      name: 'NothingFound',
      desc: '',
      args: [],
    );
  }

  /// `جزئیات پرسش`
  String get QuestionDetail {
    return Intl.message(
      'جزئیات پرسش',
      name: 'QuestionDetail',
      desc: '',
      args: [],
    );
  }

  /// `پاسخ به این پرسش`
  String get TheAnswerToThisQuestion {
    return Intl.message(
      'پاسخ به این پرسش',
      name: 'TheAnswerToThisQuestion',
      desc: '',
      args: [],
    );
  }

  /// `ثبت پاسخ`
  String get RecordTheAnswer {
    return Intl.message(
      'ثبت پاسخ',
      name: 'RecordTheAnswer',
      desc: '',
      args: [],
    );
  }

  /// `تا ۲۵۰۰ کارکتر مجاز هستید که درمورد این پرسش تایپ کنید.`
  String get YouAreAllowedToTypeUpTo2500CharactersForThisQuestion {
    return Intl.message(
      'تا ۲۵۰۰ کارکتر مجاز هستید که درمورد این پرسش تایپ کنید.',
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
