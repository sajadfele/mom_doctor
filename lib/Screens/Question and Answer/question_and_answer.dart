import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mom_doctor/Helper/constant.dart';
import 'package:mom_doctor/Screens/Question%20and%20Answer/model/my_qas_model.dart';
import 'package:mom_doctor/Screens/Question%20and%20Answer/my_qa_detaile.dart';
import 'package:mom_doctor/Screens/Question%20and%20Answer/repository/QaRepository.dart';
import 'package:mom_doctor/generated/l10n.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import 'model/qa_answer_model.dart';

class QuestionAndAnswer extends StatefulWidget {
  final VoidCallback goToMainPage;
  const QuestionAndAnswer({Key? key,required this.goToMainPage}) : super(key: key);

  @override
  State<QuestionAndAnswer> createState() => _QuestionAndAnswerState();
}

class _QuestionAndAnswerState extends State<QuestionAndAnswer> with TickerProviderStateMixin{

  TabController? tabController;

  List<QaModel>? all;



  List<QaAnswer>? hasBeenAnswered;

  bool loading=false;

  List<QaModel>? waitingForAnAnswer;

  Future<void> getAllMyQas({String? status}) async {
    var result = await MyQasRepository().getAllMyQas();
    if (result != null) {
      all=result.content ;
      loading=false;
      setState(() {});
    }
  }
  Future<void> getWaitingForAnAnswer() async {
    var result = await MyQasRepository().myQasWaitingForAnAnswer();
    if (result != null) {
      waitingForAnAnswer=result.content ;
      loading=false;
      setState(() {});
    }
  }
  Future<void> getMyQasHasBeenAnswered() async {
    var result = await MyQasRepository().myQasHasBeenAnswered();
    if (result != null) {
      hasBeenAnswered=result.content ;
      loading=false;
      setState(() {});
    }
  }


  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    getAllMyQas();
    getWaitingForAnAnswer();
    getMyQasHasBeenAnswered();
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width, 95),
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
            elevation: 0,
            title: Text(
              S.of(context).MyQuestionsAndAnswers,
              style: const TextStyle(fontSize: 16, fontFamily: danaMedium, color: textColor),
            ),
            bottom: PreferredSize(
              preferredSize: Size(MediaQuery.of(context).size.width, 0),
              child: Column(
                children: [
                  Container(
                    height: 1,
                    width: MediaQuery.of(context).size.width,
                    color: borderLightColor,
                  ),
                  Container(
                    alignment: Alignment.centerRight,
                    height: 38,
                    child: TabBar(
                      controller: tabController,
                      isScrollable: true,
                      labelColor: purpleMainColor,
                      indicatorColor: purpleMainColor,
                      labelStyle: const TextStyle(fontSize: 14, fontFamily: danaMedium, color: grayMainColor),
                      unselectedLabelStyle: const TextStyle(fontSize: 14, fontFamily: danaMedium, color: grayMainColor),
                      unselectedLabelColor: grayMainColor,
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: [
                        Tab(
                          child: Row(
                            children: [
                              Text(S.of(context).All),
                            ],
                          ),
                        ),
                        Tab(
                          child: Row(
                            children: [
                              Text(S.of(context).waitingForAnAnswer),
                              if(waitingForAnAnswer!=null && waitingForAnAnswer!.length!=0)
                                Container(
                                  margin: const EdgeInsets.only(right: 4),
                                  height: 20,
                                  width: 20,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(color: borderLightColor, borderRadius: BorderRadius.circular(7)),
                                  child: Text(
                                    waitingForAnAnswer!.length.toString(),
                                    style: const TextStyle(fontSize: 10, fontFamily: danaMedium, color: grayMainColor),
                                  ),
                                )
                            ],
                          ),
                        ),
                        Tab(
                          child: Row(
                            children: [
                              Text(S.of(context).HasBeenAnswered),
                              if(hasBeenAnswered!=null && hasBeenAnswered!.length!=0)
                                Container(
                                  margin: const EdgeInsets.only(right: 4),
                                  height: 20,
                                  width: 20,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(color: borderLightColor, borderRadius: BorderRadius.circular(7)),
                                  child: Text(
                                    hasBeenAnswered!.length.toString(),
                                    style: const TextStyle(fontSize: 10, fontFamily: danaMedium, color: grayMainColor),
                                  ),
                                )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 16),
            child:  (all!=null)?( all!.isNotEmpty)? Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width/3,
                        padding: EdgeInsets.only(right: 12),
                        child: Text(
                          S.of(context).QuestionCode,
                          style: const TextStyle(fontSize: 12, fontFamily: danaMedium, color: grayMainColor),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width/3,
                        child: Text(
                          S.of(context).History,
                          style: const TextStyle(fontSize: 12, fontFamily: danaMedium, color: grayMainColor),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width/3,
                        child: Text(
                          S.of(context).Topic,
                          style: const TextStyle(fontSize: 12, fontFamily: danaMedium, color: grayMainColor),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 12, right: 12, top: 8),
                  height: 1,
                  color: borderLightColor,
                  width: MediaQuery.of(context).size.width,
                ),
                ListView.builder(
                  itemBuilder: (context, index) {
                    return listAll(all![index]);
                  },
                  itemCount: (all != null) ? all!.length : 0,
                  shrinkWrap: true,
                )
              ],
            ):
            Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(top: 100),
              child: Column(
                children: [
                  Image.asset("assets/images/nothingsFound.png",height: 200,width: 200,),
                  const SizedBox(
                    height: 44,
                  ),
                  Text(S.of(context).NothingFound,
                    style: const TextStyle(fontSize: 14,fontFamily: danaMedium,color: grayMainColor),
                  )
                ],
              ),
            ):
            Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height,
                child: const CircularProgressIndicator(
                  color: purpleMainColor,
                ))

            ,
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 16),
            child: (waitingForAnAnswer!=null)?(waitingForAnAnswer!.isNotEmpty)?Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width/3,
                        padding: EdgeInsets.only(right: 12),
                        child: Text(
                          S.of(context).QuestionCode,
                          style: const TextStyle(fontSize: 12, fontFamily: danaMedium, color: grayMainColor),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width/3,
                        child: Text(
                          S.of(context).History,
                          style: const TextStyle(fontSize: 12, fontFamily: danaMedium, color: grayMainColor),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width/3,
                        child: Text(
                          S.of(context).Topic,
                          style: const TextStyle(fontSize: 12, fontFamily: danaMedium, color: grayMainColor),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 16),
                  height: 1,
                  color: borderLightColor,
                  width: MediaQuery.of(context).size.width,
                ),
                ListView.builder(
                  itemBuilder: (context, index) {
                    return listWaitingForAnAnswer(waitingForAnAnswer![index]);
                  },
                  itemCount: (waitingForAnAnswer != null) ? waitingForAnAnswer!.length : 0,
                  shrinkWrap: true,
                )
              ],
            ):
            Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(top: 100),
              child: Column(
                children: [
                  Image.asset("assets/images/nothingsFound.png",height: 200,width: 200,),
                  const SizedBox(
                    height: 44,
                  ),
                  Text(S.of(context).NothingFound,
                    style: const TextStyle(fontSize: 14,fontFamily: danaMedium,color: grayMainColor),
                  )
                ],
              ),
            ):
            Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height,
                child: const CircularProgressIndicator(
                  color: purpleMainColor,
                ))

            ,
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 16),
            child:(hasBeenAnswered!=null )?( hasBeenAnswered!.isNotEmpty)? Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 24),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width/3,
                        padding: EdgeInsets.only(right: 12),
                        child: Text(
                          S.of(context).QuestionCode,
                          style: const TextStyle(fontSize: 12, fontFamily: danaMedium, color: grayMainColor),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width/3,
                        child: Text(
                          S.of(context).History,
                          style: const TextStyle(fontSize: 12, fontFamily: danaMedium, color: grayMainColor),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width/3,
                        child: Text(
                          S.of(context).Topic,
                          style: const TextStyle(fontSize: 12, fontFamily: danaMedium, color: grayMainColor),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 12, right: 12, top: 8, bottom: 16),
                  height: 1,
                  color: borderLightColor,
                  width: MediaQuery.of(context).size.width,
                ),
                ListView.builder(
                  itemBuilder: (context, index) {
                    return listHasBeenAnswered(hasBeenAnswered![index]);
                  },
                  itemCount: (hasBeenAnswered != null) ? hasBeenAnswered!.length : 0,
                  shrinkWrap: true,
                )
              ],
            ):
            Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(top: 100),
              child: Column(
                children: [
                  Image.asset("assets/images/nothingsFound.png",height: 200,width: 200,),
                  const SizedBox(
                    height: 44,
                  ),
                  Text(S.of(context).NothingFound,
                    style: const TextStyle(fontSize: 14,fontFamily: danaMedium,color: grayMainColor),
                  )
                ],
              ),
            ):
            Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height,
                child: const CircularProgressIndicator(
                  color: purpleMainColor,
                ))

            ,
          ),

        ],
      ),
    );
  }
  Widget listAll(QaModel allMyQa ) {
    return Column(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () async {
            await Navigator.push(context, CupertinoPageRoute(builder: (context)=>QaDetail(myQa:allMyQa)));
            setState(() {

            });
          },
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.only( top: 16, bottom: 16),
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/3,
                  padding: EdgeInsets.only(right: 12),
                  child: Text(
                    allMyQa.code.toString(),
                    style: const TextStyle(fontSize: 12, fontFamily: danaMedium, color: textColor),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width/3,
                  child: Text(
                    allMyQa.created.toString().toPersianDate(),
                    style: const TextStyle(fontSize: 12, fontFamily: danaMedium, color: textColor),
                  ),
                ),
                Container(

                  width: MediaQuery.of(context).size.width / 3,
                  padding: EdgeInsets.only(left: 12),
                  child: Text(allMyQa.subject.toString(), style: const TextStyle(fontSize: 12, fontFamily: danaMedium, color: textColor), maxLines: 1, overflow: TextOverflow.ellipsis),
                ),

              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 12, right: 12),
          height: 1,
          color: borderLightColor,
          width: MediaQuery.of(context).size.width,
        ),
      ],
    );
  }

  Widget listWaitingForAnAnswer(QaModel waitingForAnswer) {
    return Column(
      children: [
        GestureDetector(
          onTap: () async {
            await Navigator.push(context, CupertinoPageRoute(builder: (context)=>QaDetail(myQa:waitingForAnswer)));
          },
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/3,
                  padding: EdgeInsets.only(right: 12),
                  child: Text(
                    waitingForAnswer.code.toString(),
                    style: const TextStyle(fontSize: 12, fontFamily: danaMedium, color: textColor),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width/3,
                  child: Text(
                    waitingForAnswer.created.toString().toPersianDate(),
                    style: const TextStyle(fontSize: 12, fontFamily: danaMedium, color: textColor),
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width / 3,
                    padding: EdgeInsets.only(left: 12),
                    child: Text(
                      waitingForAnswer.subject.toString(),
                      style: const TextStyle(fontSize: 12, fontFamily: danaMedium, color: textColor),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    )),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 12, right: 12, top: 16, bottom: 16),
          height: 1,
          color: borderLightColor,
          width: MediaQuery.of(context).size.width,
        ),
      ],
    );
  }

  Widget listHasBeenAnswered(QaAnswer hasBeenAnswer) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            //Navigator.push(context, CupertinoPageRoute(builder: (context)=>MyQaDetail(myQa:verifiedMyQa)));
          },
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width/3,
                  padding: EdgeInsets.only(right: 12),
                  child: Text(
                    hasBeenAnswer.question!.code??"بدون کد",
                    style: const TextStyle(fontSize: 12, fontFamily: danaMedium, color: textColor),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width/3,
                  child: Text(
                    hasBeenAnswer.created.toString().toPersianDate(),
                    style: const TextStyle(fontSize: 12, fontFamily: danaMedium, color: textColor),
                  ),
                ),
                Container(
                    width: MediaQuery.of(context).size.width / 3,
                    padding: EdgeInsets.only(left: 12),
                    child: Text(
                      hasBeenAnswer.question!.subject.toString(),
                      style: const TextStyle(fontSize: 12, fontFamily: danaMedium, color: textColor),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    )),

              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 12, right: 12, top: 16, bottom: 16),
          height: 1,
          color: borderLightColor,
          width: MediaQuery.of(context).size.width,
        ),
      ],
    );
  }
}
