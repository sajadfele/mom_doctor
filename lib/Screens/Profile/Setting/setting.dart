import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mom_doctor/Helper/constant.dart';
import 'package:mom_doctor/Screens/Profile/Setting/dynamic_form.dart';
import 'package:mom_doctor/Screens/Profile/model/dynamic_forms_model.dart';
import 'package:mom_doctor/Screens/Profile/repository/profile_repository.dart';
import 'package:mom_doctor/Screens/splash_screen.dart';
import 'package:mom_doctor/generated/l10n.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  List<DynamicFormsModel> dynamicForms=[];

  String? privacy;

  String? termsOfUse;

  String? contactUs;

  String? aboutUs;


  Future<void> getDynamicForms() async {
    var result=await ProfileRepository().getDynamicForms();
    if(result!=null){
     dynamicForms=result;
     dynamicForms.forEach((element) {
       if(element.name==S.of(context).Privacy){
         privacy=element.content;
       }else if(element.name==S.of(context).TermsOfUse){
         termsOfUse=element.content;
       }else if(element.name==S.of(context).contactUs){
         contactUs=element.content;
       }else if(element.name==S.of(context).aboutUs){
         aboutUs=element.content;
       }
     });
      setState(() {

      });
    }
  }

   String? token;
  checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token= await prefs.getString('token');
    setState(() {

    });
  }
  @override
  void initState() {
    checkLogin();
    getDynamicForms();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: const Color(0xff000000).withOpacity(0.1),
                offset: const Offset(0, 2.0),
                blurRadius: 10.0,
              )
            ]),
            child: AppBar(
              leadingWidth: 30,
              elevation: 0.0,
              title: Text(
                S.of(context).Setting,
                style: const TextStyle(fontSize: 16, fontFamily: danaMedium, color: textColor),
              ),
            ),
          )),
      body: Column(
        children: [
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: (){
              Navigator.push(context, CupertinoPageRoute(builder: (context)=>ShowDynamicForm(title: S.of(context).Privacy,content: privacy!,)));
            },
            child: Container(
              padding: const EdgeInsets.only(left: 16,top: 16, right: 16,bottom: 16),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Image.asset("assets/images/Terms and Privacy.png",height: 24,width: 24,),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          S.of(context).Privacy,
                          style: const TextStyle(fontSize: 14, fontFamily: danaLight, color: textColor),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 11.5,
                    width: 6.5,
                    margin: const EdgeInsets.only(left: 12),
                    child: Image.asset("assets/images/dropRight.png"),
                  )
                ],
              ),
            ),
          ),
          // if(isLast)
          Container(
            height: 1,
            color: borderLightColor,
            width: MediaQuery.of(context).size.width,
            //margin: EdgeInsets.all(16),
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: (){
              Navigator.push(context, CupertinoPageRoute(builder: (context)=>ShowDynamicForm(title:S.of(context).TermsOfUse,content: termsOfUse!,)));
            },
            child: Container(
              padding: const EdgeInsets.only(left: 16,top: 16, right: 16,bottom: 16),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Image.asset("assets/images/aboutUs.png",height: 24,width: 24,),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          S.of(context).TermsOfUse,
                          style: const TextStyle(fontSize: 14, fontFamily: danaLight, color: textColor),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 11.5,
                    width: 6.5,
                    margin: const EdgeInsets.only(left: 12),
                    child: Image.asset("assets/images/dropRight.png"),
                  )
                ],
              ),
            ),
          ),
          // if(isLast)
          Container(
            height: 1,
            color: borderLightColor,
            width: MediaQuery.of(context).size.width,
            //margin: EdgeInsets.all(16),
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: (){
              Navigator.push(context, CupertinoPageRoute(builder: (context)=>ShowDynamicForm(title:S.of(context).contactUs,content: contactUs!,)));
            },
            child: Container(
              padding: const EdgeInsets.only(left: 16,top: 16, right: 16,bottom: 16),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Image.asset("assets/images/aboutUs.png",height: 24,width: 24,),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          S.of(context).contactUs,
                          style: const TextStyle(fontSize: 14, fontFamily: danaLight, color: textColor),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 11.5,
                    width: 6.5,
                    margin: const EdgeInsets.only(left: 12),
                    child: Image.asset("assets/images/dropRight.png"),
                  )
                ],
              ),
            ),
          ),
          // if(isLast)
          Container(
            height: 1,
            color: borderLightColor,
            width: MediaQuery.of(context).size.width,
            //margin: EdgeInsets.all(16),
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: (){
              Navigator.push(context, CupertinoPageRoute(builder: (context)=>ShowDynamicForm(title:S.of(context).aboutUs, content: aboutUs!, )));
            },
            child: Container(
              padding: const EdgeInsets.only(left: 16,top: 16, right: 16,bottom: 16),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Image.asset("assets/images/aboutUs.png",height: 24,width: 24,),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          S.of(context).aboutUs,
                          style: const TextStyle(fontSize: 14, fontFamily: danaLight, color: textColor),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 11.5,
                    width: 6.5,
                    margin: const EdgeInsets.only(left: 12),
                    child: Image.asset("assets/images/dropRight.png"),
                  )
                ],
              ),
            ),
          ),
          // if(isLast)
          Container(
            height: 1,
            color: borderLightColor,
            width: MediaQuery.of(context).size.width,
            //margin: EdgeInsets.all(16),
          ),
          GestureDetector(
            onTap: (){
              Share.shareWithResult(
                "https://Cyberoxi.com",
              );
              setState(() {

              });
            },
            child: Container(
              padding: const EdgeInsets.only(left: 16,top: 16, right: 16,bottom: 16),
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Row(
                      children: [
                        Image.asset("assets/images/Share with friends.png",height: 24,width: 24,),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          S.of(context).ShareWithFriends,
                          style: const TextStyle(fontSize: 14, fontFamily: danaLight, color: textColor),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 11.5,
                    width: 6.5,
                    margin: const EdgeInsets.only(left: 12),
                    child: Image.asset("assets/images/dropRight.png"),
                  )
                ],
              ),
            ),
          ),
          if(token!=null && token!=null)
          Container(
            height: 1,
            color: borderLightColor,
            width: MediaQuery.of(context).size.width,
          ),
          if(token!=null && token!=null)
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              showSheetLogout(context);
            },
            child: Container(
              padding: const EdgeInsets.only(left: 16,top: 16, right: 16,bottom: 16),
              width: MediaQuery.of(context).size.width,
              child: Container(
                child: Row(
                  children: [
                    Image.asset("assets/images/Logout.png",height: 24,width: 24,),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      S.of(context).LogOut,
                      style: const TextStyle(fontSize: 14, fontFamily: danaLight, color: errorColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Spacer(),
          Container(
            padding: const EdgeInsets.only(bottom: 32),
            child: Column(
              children: [
                Image.asset("assets/images/logo-mom-small.png",height: 33,width: 103,),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  "App Version 0.0.1",
                  style: TextStyle(fontSize: 12, color: textColor,fontWeight: FontWeight.w400),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void showSheetLogout(context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        //isScrollControlled: true,
        builder: (BuildContext bc) {
          return Container(
            height: 195,
            decoration: const BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(24), topLeft: Radius.circular(24)), color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 25),
                  height: 4,
                  width: 72,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: const Color(0xffd8d8d8)),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  child: Row(
                    children: [
                      Image.asset("assets/images/Logout.png",height: 24,width: 24, color: Colors.black),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        S.of(context).LogOut,
                        style: const TextStyle(fontSize: 14, fontFamily: danaMedium, color: textColor),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.only(top: 18, right: 12),
                  child: Text(
                    S.of(context).AreYouSureYouWantToLogOutOfYourAccount,
                    style: const TextStyle(fontSize: 12, fontFamily: danaMedium, color: textColor),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 12, right: 12, top: 32, bottom: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 48,
                          width: MediaQuery.of(context).size.width / 2.2,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), color: shadowColor),
                          child: Text(
                            S.of(context).Back,
                            style: const TextStyle(fontSize: 14, fontFamily: danaMedium, color: textColor),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          await logOut();
                          Navigator.pushAndRemoveUntil(context, CupertinoPageRoute(builder: (context) => const SplashScreen()), (Route<dynamic> route) => false);
                          setState(() {});
                        },
                        child: Container(
                          alignment: Alignment.center,
                          height: 48,
                          width: MediaQuery.of(context).size.width / 2.2,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), border: Border.all(width: 1, color: errorColor)),
                          child: Text(
                            S.of(context).Exit,
                            style: const TextStyle(fontSize: 14, fontFamily: danaMedium, color: errorColor),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove("token");
    await prefs.remove("userId");
    setState(() {});
  }

  Widget listDynamicForms(DynamicFormsModel dynamicForm, bool isLast) {
    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: (){
            Navigator.push(context, CupertinoPageRoute(builder: (context)=>ShowDynamicForm(title:dynamicForm.name!,content:dynamicForm.content!)));
          },
          child: Container(
            padding: const EdgeInsets.only(left: 16,top: 16, right: 16,bottom: 16),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      Image.asset("assets/images/aboutUs.png",height: 24,width: 24,),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        dynamicForm.name.toString(),
                        style: const TextStyle(fontSize: 14, fontFamily: danaLight, color: textColor),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 11.5,
                  width: 6.5,
                  margin: const EdgeInsets.only(left: 12),
                  child: Image.asset("assets/images/dropRight.png"),
                )
              ],
            ),
          ),
        ),
       // if(isLast)
        Container(
          height: 1,
          color: borderLightColor,
          width: MediaQuery.of(context).size.width,
          //margin: EdgeInsets.all(16),
        ),
      ],
    );
  }
}
