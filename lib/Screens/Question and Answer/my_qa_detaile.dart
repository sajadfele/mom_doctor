import 'package:age_calculator/age_calculator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mom_doctor/Helper/constant.dart';
import 'package:mom_doctor/Helper/widgets/textInputProfile.dart';
import 'package:mom_doctor/Screens/Question%20and%20Answer/model/my_qas_model.dart';
import 'package:mom_doctor/Screens/Question%20and%20Answer/repository/QaRepository.dart';
import 'package:mom_doctor/generated/l10n.dart';
import 'package:progressive_image/progressive_image.dart';

class QaDetail extends StatefulWidget {
  QaModel myQa;

  QaDetail({Key? key, required this.myQa}) : super(key: key);

  @override
  State<QaDetail> createState() => _QaDetailState();
}

class _QaDetailState extends State<QaDetail> {
  List<AnswerModel> answers = [];

  QaModel? qa;

  bool send=false;

  Future<void> getSingleQa() async {
    var result = await MyQasRepository().SingleQa(qaId: widget.myQa.id!);
    if (result != null) {
      qa = result;
      await getAnswerByQaId(qaId: qa!.id!);
      setState(() {});
    }
  }

  Future<void> getAnswerByQaId({required String qaId}) async {
    var result = await MyQasRepository().answersByQaId(qaId: qaId);
    if (result != null) {
      answers = result;
      setState(() {});
    }
  }
  String answer="";
  Future<void> AnswerToQuestion() async {
    var result = await MyQasRepository().answerToQuestion(qaId: qa!.id!, answer: answer);
    if (result ==200) {
      getSingleQa();
      send=true;
      setState(() {});
    }
  }

  @override
  void initState() {
    getSingleQa();
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
              (qa!=null)?S.of(context).QuestionDetail + " " + qa!.code.toString():"",
              style: const TextStyle(fontSize: 16, fontFamily: danaMedium, color: textMainColor),
            ),
            actions: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 12),
                child: Text(
                  (qa!=null && qa!.status == "VERIFIED") ? S.of(context).waitingForAnAnswer : "",
                  style: TextStyle(fontSize: 12, fontFamily: danaMedium, color: pendingColor),
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: (qa!=null)?
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 16, left: 12, right: 12),
              alignment: Alignment.centerRight,
              decoration: boxDecoration,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 16, top: 16),
                    child: Text(
                      (qa!.user!.bdate != null)
                          ? (qa!.user!.sex == "MALE")
                              ? "خانم " " " + age(qa!.user!.bdate.toString()).toString() + " " + " ساله پرسیده"
                              : "آقا" " " + age(qa!.user!.bdate.toString()).toString() + " " + "ساله پرسیده"
                          : (qa!.user!.sex == "MALE")
                              ? "خانمی پرسیده"
                              : "آقایی پرسیده",
                      style: const TextStyle(fontSize: 12, fontFamily: danaMedium, color: textColor),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 16, right: 16, top: 12),
                    child: Text(
                      qa!.subject.toString(),
                      style: const TextStyle(fontSize: 14, fontFamily: danaBold, color: textColor),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 16, right: 16, top: 12),
                    child: Text(
                      qa!.question.toString(),
                      style: const TextStyle(fontSize: 14, fontFamily: danaLight, color: textColor),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(right: 16, top: 16, bottom: 16),
                    height: 36,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return listTag(qa!.topics![index]);
                      },
                      itemCount: (qa! != null) ? qa!.topics!.length : 0,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              itemBuilder: (context, index) {
                return listAnswers(answers[index]);
              },
              itemCount: (answers != null) ? answers.length : 0,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
            ),
          ],
        ):
        Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height,
            child: const CircularProgressIndicator(
              color: greenMainColor,
            )),
      ),
      bottomNavigationBar: Container(
        height: 72,
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Color(0xff000000).withOpacity(0.1),
            blurRadius: 5,
          )
        ]),
        child: InkWell(
          onTap: () {
            showSheetAnswerToThisQuestion(context);
            setState(() {});
          },
          child: Container(
            height: 48,
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(border: Border.all(width: 1, color: purpleMainColor), borderRadius: BorderRadius.circular(14)),
            child: Text(
              S.of(context).TheAnswerToThisQuestion,
              style: TextStyle(fontSize: 16, fontFamily: danaMedium, color: purpleMainColor),
            ),
          ),
        ),
      ),
    );
  }

  Widget listTag(Topics topics) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.only(left: 12),
      padding: const EdgeInsets.only(left: 8, right: 8),
      height: 36,
      decoration: BoxDecoration(border: Border.all(width: 1, color: purpleMainColor), borderRadius: BorderRadius.circular(28)),
      child: Text(
        topics.name.toString(),
        style: const TextStyle(fontSize: 14, fontFamily: danaLight, color: purpleMainColor),
      ),
    );
  }

  Widget listAnswers(AnswerModel answer) {
    return Container(
      margin: const EdgeInsets.only(left: 12, right: 12, top: 16),
      decoration: boxDecoration,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 16, top: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(48), border: Border.all(width: 1, color: greenMainColor)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(48),
                      child: ProgressiveImage(
                        fit: BoxFit.cover,
                        placeholder: const AssetImage("assets/images/Place_Holder.png"),
                        thumbnail: NetworkImage(
                          (answer.doctor != null) ? answer.doctor!.profileImage.toString() : "",
                        ),
                        image: NetworkImage(
                          (answer.doctor != null) ? answer.doctor!.profileImage.toString() : "",
                        ),
                        height: 48,
                        width: 48,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 1.7,
                        child: Text(
                          answer.doctor!.firstName.toString() + " " + answer.doctor!.lastName.toString(),
                          style: const TextStyle(color: greenMainColor, fontSize: 14, fontFamily: danaBold),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.7,
                        margin: const EdgeInsets.only(top: 9),
                        child: Text(
                          (answer.doctor!.medicalFields != null) ? answer.doctor!.medicalFields!.first.name.toString() : "نوع تخصص مشخص نشده است",
                          style: const TextStyle(color: textMainColor, fontSize: 12, fontFamily: danaMedium),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Text(
              answer.answer.toString(),
              style: const TextStyle(fontSize: 14, fontFamily: danaLight, color: textColor),
              textAlign: TextAlign.justify,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16),
            width: MediaQuery.of(context).size.width,
            height: 1,
            color: borderLightColor,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () async {
                    bool isLiked = (answer.isUserLiked != null && answer.isUserLiked!);
                    //await setLikeOrDisLike(isLiked: isLiked, ansId: answer.id!, type: "LIKE");
                    //await getQuestionById(qaId: widget.qaId);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 16, bottom: 16, left: 8),
                    padding: const EdgeInsets.only(right: 16, left: 12),
                    height: 48,
                    width: MediaQuery.of(context).size.width / 2.41,
                    decoration: BoxDecoration(
                        color: (answer.isUserLiked == true) ? greenMainColor : Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(width: 1, color: (answer.isUserLiked == true) ? Colors.white : greenMainColor)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.thumb_up_rounded,
                          color: (answer.isUserLiked == true) ? Colors.white : greenMainColor,
                        ),
                        Text(
                          answer.likeCount.toString(),
                          style: TextStyle(fontSize: 14, fontFamily: danaMedium, color: (answer.isUserLiked == true) ? Colors.white : greenMainColor),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    bool isLiked = (answer.isUserLiked != null && answer.isUserLiked == false);
                    //await setLikeOrDisLike(isLiked: isLiked, ansId: answer.id!, type: "DISLIKE");
                    //await getQuestionById(qaId: widget.qaId);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 16, left: 16),
                    padding: const EdgeInsets.only(right: 16, left: 12),
                    height: 48,
                    width: MediaQuery.of(context).size.width / 2.41,
                    decoration: BoxDecoration(
                      color: (answer.isUserLiked == false) ? errorColor : Colors.white,
                      border: Border.all(width: 1, color: errorColor),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.thumb_down_off_alt_outlined,
                          color: (answer.isUserLiked == false) ? Colors.white : errorColor,
                        ),
                        Text(
                          answer.disLikeCount.toString(),
                          style: TextStyle(fontSize: 14, fontFamily: danaMedium, color: (answer.isUserLiked == false) ? Colors.white : errorColor),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  DateTime? birthday;

  DateDuration duration = DateDuration();

  age(date) {
    birthday = DateTime.parse(date);
    duration = AgeCalculator.age(birthday!);
    return duration.years;
  }

  void showSheetAnswerToThisQuestion(context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        builder: (BuildContext bc) {
          return SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
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
                    alignment: Alignment.centerRight,
                    margin: const EdgeInsets.only(right: 16),
                    child: Text(
                      S.of(context).RecordTheAnswer,
                      style: const TextStyle(fontSize: 16, fontFamily: danaBold, color: textColor),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
                    child: TextFormField(
                      textAlign: TextAlign.right,
                      maxLines: 4,
                      cursorColor: purpleMainColor,
                      decoration: InputDecoration(

                        hintText: S.of(context).YouAreAllowedToTypeUpTo2500CharactersForThisQuestion,
                        hintStyle: TextStyle(fontSize: 16, fontFamily: danaLight, color: grayMainColor),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: grayMainColor, width: 1)),
                        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: purpleMainColor, width: 1)),
                      ),
                      style: TextStyle(color: textMainColor, fontFamily: danaMedium, fontSize: 16),
                      keyboardType: TextInputType.text,
                     onChanged: (text){
                       setState(() {
                         answer=text;
                       });
                     },
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 12, right: 12, top: 24, bottom: 16),
                    child: InkWell(
                      onTap: () async {
                        if(answer.isNotEmpty){
                          await AnswerToQuestion();
                          Navigator.pop(context);
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 48,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(14), color: purpleMainColor),
                        child: Text(
                          S.of(context).RecordTheAnswer,
                          style:  TextStyle(fontSize: 16, fontFamily: danaMedium, color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
