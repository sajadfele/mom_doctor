import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:mom_doctor/Helper/constant.dart';
import 'package:mom_doctor/Screens/Login/bolc/login_bloc.dart';
import 'package:mom_doctor/generated/l10n.dart';
import 'package:persian_number_utility/persian_number_utility.dart';


class VerifyPhone extends StatefulWidget {
  String? numberPhone;

  VerifyPhone({Key? key, this.numberPhone}) : super(key: key);

  @override
  State<VerifyPhone> createState() => _VerifyPhoneState();
}

class _VerifyPhoneState extends State<VerifyPhone> {
  TextEditingController _mobileController = TextEditingController();

  String? verifyCode;

  final _formKey = GlobalKey<FormState>();

  bool isShow = true;
  final int timerMaxSeconds = 120;

  int currentSeconds = 0;

  late Timer timer;

  late LoginBloc _loginBloc;

  bool focus = true;

  bool error = false;

  String get timerText =>
      ' ${((timerMaxSeconds - currentSeconds) % 60).toString().padLeft(2, '0')} :'
          '${((timerMaxSeconds - currentSeconds) ~/ 60).toString().padLeft(2, '0')} ' +
      S.of(context).SendVerifyCode;

  startTimeout([int? milliseconds]) {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        currentSeconds = timer.tick;
        if (timer.tick >= timerMaxSeconds) {
          timer.cancel();
          isShow = true;
        }
      });
    });
  }

  @override
  void initState() {
    startTimeout();
    _focus.addListener(_onFocusChange);
    _loginBloc = BlocProvider.of<LoginBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    isShow = false;
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

  MaskedTextController maskedTextController = MaskedTextController(mask: '0     -     0     -     0     -     0');

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        _loginBloc.emit(IsNotEnterPhoneState());
        return false;
      },
      child: Scaffold(
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
                S.of(context).EnterAuthCode,
                style: const TextStyle(fontSize: 18, color: purpleMainColor, fontFamily: danaBold),
              ),
            ),
            Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.only(top: 12, right: 14),
                child: Row(
                  children: [
                    Text.rich(
                      TextSpan(text: S.of(context).ConfirmationCodeWas + " ", style: const TextStyle(fontSize: 14, color: grayMainColor, fontFamily: danaMedium), children: [
                        TextSpan(text: widget.numberPhone.toString()),
                        TextSpan(
                          text: " " + S.of(context).SentTo,
                          style: const TextStyle(fontSize: 14, color: grayMainColor, fontFamily: danaMedium),
                        ),
                      ]),
                    ),
                    GestureDetector(
                      onTap: () {
                        _loginBloc.emit(IsNotEnterPhoneState());
                      },
                      child: Text(
                        " (" + S.of(context).Change + ")",
                        style: TextStyle(fontSize: 14, color: purpleMainColor, fontFamily: danaMedium),
                      ),
                    )
                  ],
                )),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(top: 32, right: 12, left: 12, bottom: 10),
              child: Stack(
                children: [
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: maskedTextController,
                      textAlign: TextAlign.center,
                      focusNode: _focus,
                      textDirection: TextDirection.ltr,
                      cursorColor: purpleMainColor,
                      decoration: InputDecoration(
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
                          verifyCode = text.replaceAll("     -     ", "");
                          if (_formKey.currentState!.validate()) {
                            if (timer.isActive == false) {
                              _loginBloc.add(EnterPhoneEvent(phoneNumber: widget.numberPhone));
                              startTimeout();
                              setState(() {});
                            } else if (verifyCode != null) {
                              _loginBloc.add(VerifyCodeEvent(numberPhone: widget.numberPhone, verifyCode: verifyCode));
                            } else {
                              print("phone is null");
                            }

                          }
                        });
                      },
                      onChanged: (text) {
                        setState(() {
                          verifyCode = text.replaceAll("     -     ", "");
                        });
                      },
                      keyboardType: TextInputType.phone,
                      style: const TextStyle(fontFamily: danaMedium, fontSize: 16, color: purpleMainColor),
                      validator: verifyCodeValidator,
                      maxLength: 37,
                    ),
                  ),
                  if (isClicked)
                    Container(
                      margin: const EdgeInsets.only(right: 20, left: 12, bottom: 32),
                      padding: EdgeInsets.symmetric(horizontal: (S.of(context).LabelVerifyCode.isNotEmpty) ? 8 : 0),
                      transform: Matrix4.translationValues(0, -8, 0),
                      color: Colors.white,
                      //alignment: Alignment.center,
                      child: Text(S.of(context).LabelVerifyCode, style: TextStyle(color: error ? errorColor : purpleMainColor, fontFamily: danaMedium, fontSize: 12)),
                    ),
                  if (isClicked == false)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _focus.hasFocus;
                        });
                      },
                      child: Container(
                        height: 48,
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 18),
                        child: Text(S.of(context).DigitVerificationCode, style: TextStyle(color: grayMainColor, fontFamily: danaMedium, fontSize: 16)),
                      ),
                    )
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(bottom: 24, left: 12, right: 12),
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    if (timer.isActive == false) {
                      _loginBloc.add(EnterPhoneEvent(phoneNumber: widget.numberPhone));
                      startTimeout();
                      setState(() {});
                    } else if (verifyCode != null) {
                      _loginBloc.add(VerifyCodeEvent(numberPhone: widget.numberPhone, verifyCode: verifyCode));
                    } else {
                      print("phone is null");
                    }

                  }
                  setState(() {});
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 48,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: (verifyCode != null && verifyCode!.isNotEmpty || timer.isActive == false) ? purpleMainColor : Color(0xffD8D8D8), borderRadius: BorderRadius.circular(14)),
                  child: Text(
                    (timer.isActive == false && verifyCode == null && verifyCode!.isEmpty)
                        ? S.of(context).SendVerifyCode2
                        : (verifyCode != null && verifyCode!.isNotEmpty)
                            ? S.of(context).Confirmation
                            : timerText.toPersianDigit(),
                    style: TextStyle(fontSize: 16, color: (verifyCode != null) ? Colors.white : Color(0xffffffff), fontFamily: danaMedium),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? verifyCodeValidator(value) {
    if (value == null || value.isEmpty) {
      error = true;
      return S.of(context).PleaseEnterTheLoginCode;
    } else if (value.length != 37) {
      return S.of(context).TheLoginCodeMustBe4Digits;
    }

    return null;
  }
}
