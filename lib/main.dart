import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mom_doctor/Helper/constant.dart';
import 'package:mom_doctor/Screens/Login/bolc/login_bloc.dart';
import 'package:mom_doctor/Screens/Profile/bloc/profile_bloc.dart';
import 'package:mom_doctor/Screens/splash_screen.dart';
import 'package:mom_doctor/generated/l10n.dart';

void main() {
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>LoginBloc(IsNotEnterPhoneState()),child: const MyApp(),),
        BlocProvider(create: (context)=>ProfileBloc(IsNotAccountInformationState()),child: const MyApp(),),
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static PageController mainPageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale("fa") /*Provider.of<LanguageChangeProvider>(context,listen: true).currentLocale*/,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'Mom Doctor',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          fontFamily: danaMedium,
          appBarTheme: const AppBarTheme(backgroundColor: Colors.white, iconTheme: IconThemeData(color: Colors.black)),
          backgroundColor: Colors.white),
      home: SplashScreen(),
    );
  }
}

