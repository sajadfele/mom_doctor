import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:mom_doctor/Helper/constant.dart';
import 'package:mom_doctor/Screens/Profile/bloc/profile_bloc.dart';
import 'package:mom_doctor/Screens/Profile/model/doctor_model.dart';
import 'package:mom_doctor/Screens/Profile/model/insur_model.dart';
import 'package:mom_doctor/generated/l10n.dart';


class FinancialInformation extends StatefulWidget {
  String? dateOfBirth;
  String? address;
  String? email;
  String? description;
  String? officeNumber;
  String? bio;
  DoctorModel? doctorDetail;
  List<dynamic>? listMedicalFields;
  List<dynamic>? listInsurList;
  FinancialInformation({Key? key,this.doctorDetail,this.bio,this.description,this.officeNumber,this.email,this.address,this.dateOfBirth, this.listMedicalFields, this.listInsurList}) : super(key: key);

  @override
  State<FinancialInformation> createState() => _FinancialInformationState();
}

class _FinancialInformationState extends State<FinancialInformation> {
  TextEditingController _controllerOffline = TextEditingController();
  TextEditingController  _controllerOnline = TextEditingController();
  static const _locale = 'en';

  String? AttendanceVisit;

  String? onlineVisit;

  String? shabaNumber;

  late ProfileBloc _profileBloc;
  String _formatNumber(String s) => NumberFormat.decimalPattern(_locale).format(int.parse(s));
  String get _currency => NumberFormat.compactSimpleCurrency(locale: _locale).currencySymbol;

  @override
  void initState() {
    _profileBloc = BlocProvider.of<ProfileBloc>(context);
    _controllerOffline = new TextEditingController(text: widget.doctorDetail!.offlinePrice.toString());
    _controllerOnline = new TextEditingController(text: widget.doctorDetail!.onlinePrice.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(top: 27, left: 12, right: 12),
              decoration: boxDecoration,
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 40,right: 16,left: 16),
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(width: 1,color: textColor)
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              alignment: Alignment.bottomCenter,
                              width: MediaQuery.of(context).size.width-110,
                              child: TextFormField(

                                textAlign: TextAlign.end,
                                controller: _controllerOffline,
                                cursorColor: purpleMainColor,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none/*OutlineInputBorder()*/,
                                  disabledBorder: InputBorder.none,
                                ),
                                onChanged: (string) {
                                  string = '${_formatNumber(string.replaceAll(',', ''))}';
                                  _controllerOffline.value = TextEditingValue(
                                    text: string,
                                    selection: TextSelection.collapsed(offset: string.length),
                                  );
                                  AttendanceVisit=string.replaceAll(",", "");
                                },
                                keyboardType: TextInputType.number,
                                style: const TextStyle(fontFamily: danaMedium, fontSize: 16, color: textColor),
                              ),
                            ),
                            Text("تومان",style: TextStyle(fontSize: 14,fontFamily: danaMedium,color: textColor),)
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        alignment: Alignment.center,
                        width: 110,
                        margin: const EdgeInsets.only(top: 30, right: 36),
                        child: Text(
                          S.of(context).TheCostOfAAttendanceVisit,
                          style: TextStyle(fontSize: 12, fontFamily: danaMedium, color: textColor),
                        ),
                      )
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 33,right: 16,left: 16),
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(width: 1,color: textColor)
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              alignment: Alignment.bottomCenter,
                              width: MediaQuery.of(context).size.width-110,
                              child: TextFormField(
                                textAlign: TextAlign.end,
                                controller: _controllerOnline,
                                cursorColor: purpleMainColor,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none/*OutlineInputBorder()*/,
                                  disabledBorder: InputBorder.none,

                                ),
                                onChanged: (string) {
                                  string = '${_formatNumber(string.replaceAll(',', ''))}';
                                  _controllerOnline.value = TextEditingValue(
                                    text: string,
                                    selection: TextSelection.collapsed(offset: string.length),
                                  );
                                  onlineVisit=string.replaceAll(",", "");
                                },
                                keyboardType: TextInputType.number,
                                style: const TextStyle(fontFamily: danaMedium, fontSize: 16, color: textColor),
                              ),
                            ),
                            Text("تومان",style: TextStyle(fontSize: 14,fontFamily: danaMedium,color: textColor),)
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        alignment: Alignment.center,
                        width: 100,
                        margin: const EdgeInsets.only(top: 23, right: 36),
                        child: Text(
                          S.of(context).OnlineVisitFee,
                          style: TextStyle(fontSize: 12, fontFamily: danaMedium, color: textColor),
                        ),
                      )
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 33,right: 16,left: 16,bottom: 30),
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(width: 1,color: textColor)
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.bottomCenter,
                              width: MediaQuery.of(context).size.width-110,
                              child: TextFormField(
                                initialValue: widget.doctorDetail!.shebaNumber.toString(),
                                textAlign: TextAlign.end,
                                  inputFormatters: [
                                    MaskedTextInputFormatter(
                                      mask: 'xxxx-xxxx-xxxx-xxxx',
                                      separator: '-',
                                    ),
                                  ],

                                cursorColor: purpleMainColor,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  enabledBorder: InputBorder.none/*OutlineInputBorder()*/,
                                  disabledBorder: InputBorder.none,

                                ),
                                onChanged: (text) {
                                  shabaNumber=text;
                                  setState(() {

                                  });
                                },
                                keyboardType: TextInputType.number,
                                style: const TextStyle(fontFamily: danaMedium, fontSize: 16, color: textColor),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 18),
                                child: Text("- IR",style: TextStyle(fontSize: 14,fontFamily: danaMedium,color: textColor),))
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        alignment: Alignment.center,
                        width: 60,
                        margin: const EdgeInsets.only(top: 23, right: 36),
                        child: Text(
                          S.of(context).ShabaNumber,
                          style: TextStyle(fontSize: 12, fontFamily: danaMedium, color: textColor),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              alignment: Alignment.center,
              width: 100,
              margin: const EdgeInsets.only(top: 15, right: 36),
              child: Text(
                S.of(context).FinancialInformation,
                style: TextStyle(fontSize: 14, fontFamily: danaBold, color: purpleMainColor),
              ),
            )
          ],
        )
      ),
      bottomNavigationBar: Container(
        height: 72,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [BoxShadow(color: const Color(0xff000000).withOpacity(0.2), blurRadius: 4)]),
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            _profileBloc.add(SaveChangeEvent(
              listMedicalFields: widget.listMedicalFields,
              listInsurList: widget.listInsurList,
              bio: widget.bio,
              description: widget.description,
              officeNumber: widget.officeNumber,
              email: widget.email,
              address: widget.address,
              dateOfBirth: widget.dateOfBirth,
              offlineVisit:AttendanceVisit,
              onlineVisit:onlineVisit,
              shabaNumber:shabaNumber,
            ));

          },
          child: Container(
            margin: const EdgeInsets.all(12),
            height: 48,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(14),color: purpleMainColor),
            child: Text(
              S.of(context).SaveChanges,
              style: const TextStyle(fontSize: 16, fontFamily: danaMedium, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
class MaskedTextInputFormatter extends TextInputFormatter {
  final String mask;
  final String separator;

  MaskedTextInputFormatter({
    required this.mask,
    required this.separator,
  }) { assert(mask != null); assert (separator != null); }

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    if(newValue.text.length > 0) {
      if(newValue.text.length > oldValue.text.length) {
        if(newValue.text.length > mask.length) return oldValue;
        if(newValue.text.length < mask.length && mask[newValue.text.length - 1] == separator) {
          return TextEditingValue(
            text: '${oldValue.text}$separator${newValue.text.substring(newValue.text.length-1)}',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          );
        }
      }
    }
    return newValue;
  }
}
