import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mom_doctor/Helper/constant.dart';
import 'package:mom_doctor/generated/l10n.dart';

import 'bolc/login_bloc.dart';


class EnterPhone extends StatefulWidget {
  const EnterPhone({Key? key}) : super(key: key);

  @override
  State<EnterPhone> createState() => _EnterPhoneState();
}

class _EnterPhoneState extends State<EnterPhone> {
  TextEditingController _mobileController = TextEditingController();
  String enteredNumber = "";
  final _formKey = GlobalKey<FormState>();

  late LoginBloc _loginBloc;

  bool error = false;

  @override
  void initState() {
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    _focus.addListener(_onFocusChange);
    super.initState();
  }

  @override
  void dispose() {
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
    super.dispose();
  }

  FocusNode _focus = FocusNode();
  bool isClicked = false;

  void _onFocusChange() {
    setState(() {
      isClicked = _focus.hasFocus;
      isClicked = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 60, left: 102, right: 102),
              child: Image.asset("assets/images/logo-mom.png"),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(top: 48, right: 14),
              child: Text(
                S.of(context).loginRegister,
                style: const TextStyle(fontSize: 18, color: purpleMainColor, fontFamily: danaBold),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(top: 12, right: 14),
              child: Text(
                S.of(context).EnterYourMobileNumber,
                style: const TextStyle(fontSize: 14, color: grayMainColor, fontFamily: danaMedium),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(top: 32, right: 12, left: 12, bottom: 10),
              child: Stack(
                children: [
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      textAlign: TextAlign.end,
                      focusNode: _focus,
                      cursorColor: purpleMainColor,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(fontFamily: danaMedium, fontSize: 16, color: grayMainColor),
                        hintText: S.of(context).HintEnterNumberPhone,
                        contentPadding: const EdgeInsets.only(top: 5, bottom: 5, left: 18, right: 18),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: purpleMainColor, width: 1)),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: grayMainColor, width: 1)),
                        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: errorColor, width: 1)),
                        focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: errorColor, width: 1)),
                        errorStyle: TextStyle(color: errorColor, fontFamily: danaMedium, fontSize: 10),
                        disabledBorder: InputBorder.none,
                        counter: Text(""),
                      ),
                      onFieldSubmitted: (text) {
                        setState(() {
                          enteredNumber = text;
                          if (_formKey.currentState!.validate()) {
                            if (enteredNumber.length == 11) {
                              _loginBloc.add(EnterPhoneEvent(phoneNumber: enteredNumber));
                            } else {
                              print("phone is null");
                            }
                          }
                        });
                      },
                      onChanged: (text) {
                        setState(() {
                          enteredNumber = text;
                        });
                      },
                      keyboardType: TextInputType.number,
                      style: const TextStyle(fontFamily: danaMedium, fontSize: 16, color: textColor),
                      validator: mobileValidator,
                      maxLength: 11,
                    ),
                  ),
                  if (isClicked)
                    Container(
                      margin: const EdgeInsets.only(right: 20, left: 12, bottom: 32),
                      padding: EdgeInsets.symmetric(horizontal: (S.of(context).LabelNumberPhone.isNotEmpty) ? 8 : 0),
                      transform: Matrix4.translationValues(0, -8, 0),
                      color: Colors.white,
                      //alignment: Alignment.center,
                      child: Text(S.of(context).LabelNumberPhone, style: TextStyle(color: error ? errorColor : purpleMainColor, fontFamily: danaMedium, fontSize: 12)),
                    ),
                ],
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  print(enteredNumber);
                  if (enteredNumber.length == 11) {
                    _loginBloc.add(EnterPhoneEvent(phoneNumber: enteredNumber));
                  } else {
                    print("phone is null");
                  }
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 12, left: 12),
                child: Container(
                  alignment: Alignment.center,
                  height: 48,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: (enteredNumber.length == 11) ? purpleMainColor : Color(0xffD8D8D8), borderRadius: BorderRadius.circular(14)),
                  child: Text(
                    S.of(context).SendVerificationCode,
                    style: const TextStyle(fontSize: 16, color: Color(0xffffffff), fontFamily: danaMedium),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
              },
              child: Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(top: 12, right: 12),
                child: Text.rich(
                  TextSpan(text: S.of(context).ByEnteringMam, style: const TextStyle(fontSize: 12, color: Color(0xff404040), fontFamily: danaMedium), children: [
                    TextSpan(
                      text: S.of(context).TermsAndConditions,
                      style: const TextStyle(fontSize: 12, color: greenMainColor, fontFamily: danaMedium),
                    ),
                    const TextSpan(text: " "),
                    TextSpan(
                      text: S.of(context).IAcceptMam,
                      style: const TextStyle(fontSize: 12, color: Color(0xff404040), fontFamily: danaMedium),
                    )
                  ]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  String? mobileValidator(dynamic value) {
    if (value == null || value.isEmpty) {
      error = true;
      return S.of(context).PleaseEnterYourPhoneNumber;
    } else if (value.startsWith("09") != true) {
      return S.of(context).MobileNumberMustStartWith09;
    } else if (value.length != 11) {
      return S.of(context).PhoneNumberMustBe11Digits;
    }

    return null;
  }
}
