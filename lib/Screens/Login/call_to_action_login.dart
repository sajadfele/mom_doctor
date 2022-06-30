import 'package:flutter/material.dart';
import 'package:mom_doctor/generated/l10n.dart';

class CallToActionLogin extends StatefulWidget {
  const CallToActionLogin({Key? key}) : super(key: key);

  @override
  State<CallToActionLogin> createState() => _CallToActionLoginState();
}

class _CallToActionLoginState extends State<CallToActionLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Icon(Icons.settings_outlined),
              ),
              
              Container(
                child: Image.asset("assets/images/callToActionLogin.png"),
              ),

              Container(
                child: Text(S.of(context).loginRegister+"مام"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
