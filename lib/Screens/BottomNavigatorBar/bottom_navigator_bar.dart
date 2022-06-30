import 'package:flutter/material.dart';
import 'package:mom_doctor/Helper/constant.dart';
import 'package:mom_doctor/Screens/Profile/model/doctor_model.dart';
import 'package:mom_doctor/Screens/Profile/profile.dart';
import 'package:mom_doctor/Screens/Profile/repository/profile_repository.dart';
import 'package:mom_doctor/Screens/Question%20and%20Answer/question_and_answer.dart';
import 'package:mom_doctor/Screens/my_patients/my_patients.dart';
import 'package:mom_doctor/generated/l10n.dart';
import 'package:mom_doctor/main.dart';
import 'package:progressive_image/progressive_image.dart';
import 'package:shared_preferences/shared_preferences.dart';




class BottomNavigatorBar extends StatefulWidget {



  @override
  BottomNavigatorBarState createState() => BottomNavigatorBarState();

}

class BottomNavigatorBarState extends State<BottomNavigatorBar> {
  int tab_index = 0;

  bool login = true;

  DoctorModel? doctorDetail;

  bool isLogin=false;

  Future<void> getUserDetail() async {
    DoctorModel result = await ProfileRepository().getDoctorDetail();
    if (result != null) {
      setState(() {
        doctorDetail = result;
      });
    }
  }
  String? token;
  String? docId;
  checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    token= await prefs.getString('token');
    docId= await prefs.getString('docId');
    if(token!=null  && token!.isNotEmpty){
      await getUserDetail();
      setState(() {
      });
    }

  }

  @override
  void initState() {

    MyApp.mainPageController.addListener(() {
      checkLogin();
    });

    checkLogin();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(child: _buildMainPageView()),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        unselectedLabelStyle: const TextStyle(
          color: textColor,
          fontSize: 10,
          fontFamily: danaMedium,
        ),
        selectedLabelStyle: const TextStyle(
          color: greenMainColor,
          fontSize: 10,
          fontFamily: danaMedium,
        ),
        selectedItemColor: purpleMainColor,
        selectedIconTheme: const IconThemeData(color: greenMainColor),
        items: [
          BottomNavigationBarItem(
            activeIcon: Container(
                height: 20,
                width: 18,
                child: Image.asset(
                  "assets/images/My patients.png",
                  color: purpleMainColor,
                )),
            icon: Container(height: 20, width: 18, child: Image.asset("assets/images/My patients.png")),
            label:S.of(context).MyPatients,
          ),
          BottomNavigationBarItem(
            activeIcon: Container(
                height: 20,
                width: 18,
                child: Image.asset(
                  "assets/images/QA.png",
                  color: purpleMainColor,
                )),
            icon: Container(height: 17.5, width: 16, child: Image.asset("assets/images/QA.png")),
            label: S.of(context).QuestionAndAnswer,
          ),
          BottomNavigationBarItem(
            activeIcon: Container(
                height: 20,
                width: 20,
                //padding: EdgeInsets.all(2),
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(width:(doctorDetail != null)?1:0, color: (doctorDetail != null)? purpleMainColor:Colors.white)),
                child: ClipRRect(borderRadius: BorderRadius.circular(20), child: Image.network((doctorDetail!=null)?doctorDetail!.profileImage.toString():""),
                )),
            icon: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(width: (doctorDetail != null)?1:0, color:(doctorDetail != null)? borderLightColor:Colors.white)),
                child:  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: ProgressiveImage(
                      fit: BoxFit.cover,
                      placeholder: const AssetImage("assets/images/Place_Holder.png"),
                      thumbnail: NetworkImage(
                        (doctorDetail!=null)?doctorDetail!.profileImage.toString() : "",
                      ),
                      image: NetworkImage(
                        (doctorDetail!=null)?doctorDetail!.profileImage.toString() : "",
                      ),
                      height: 20,
                      width: 20,
                    ),)),
            label:S.of(context).Profile ,
          ),
        ],
        onTap: (index) {
          MyApp.mainPageController.jumpToPage(index);
          //mainPageController.jumpToPage(index);
          setState(() {
            tab_index = index;
          });
        },
        currentIndex: tab_index,
      ),
    );
  }
/*   PageController mainPageController = PageController(
    initialPage: 0,
    keepPage: true,
  );*/


  void goToMainPage() {
    //mainPageController.jumpToPage(0);
    MyApp.mainPageController.jumpToPage(0);
  }

  _buildMainPageView() {
    return PageView.builder(
      physics: const NeverScrollableScrollPhysics(),
      controller: MyApp.mainPageController,
      onPageChanged: (index) {
        setState(() {
          tab_index = index;
        });
      },
      itemCount: 3,
      itemBuilder: (context, index) {
        return _makeMainPage(context, index);
      },
    );
  }

  _makeMainPage(BuildContext context, int index) {
    tab_index = index;
    switch (tab_index) {
      case 0:
        {
          return MyPatients(
            goToMainPage: goToMainPage,
          );
        }
      case 1:
        {
          return QuestionAndAnswer(
            goToMainPage: goToMainPage,
          );
        }
      case 2:
        {
          return Profile(
            goToMainPage: goToMainPage,
          );
        }
      default:
        {
          return MyPatients(
            goToMainPage: goToMainPage,
          );
        }
    }
  }
}

