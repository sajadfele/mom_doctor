import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:mom_doctor/Screens/Profile/model/dynamic_forms_model.dart';

import '../../../Helper/constant.dart';

class ShowDynamicForm extends StatefulWidget {
  String content;
  String title;
   ShowDynamicForm({Key? key,required this.content,required this.title  }) : super(key: key);

  @override
  State<ShowDynamicForm> createState() => _ShowDynamicFormState();
}

class _ShowDynamicFormState extends State<ShowDynamicForm> {
  List<DynamicFormsModel>? dynamicForms;

  bool error=false;


  @override
  void initState() {
    if(widget.title==null && widget.content==null)
      error=true;
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
                  (widget.title!=null)?widget.title.toString():"",
                style: const TextStyle(fontSize: 16, fontFamily: danaMedium, color: textColor),
              ),
            ),
          )),
      body: (error==false)?SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 24,left: 12,right: 12),
          child:Html(data: widget.content,
              style: {
                // tables will have the below background color
                "p": Style(
                  fontSize: const FontSize(14),fontFamily: danaMedium,color: textColor,
                  textAlign: TextAlign.justify,
                ),
                "tr": Style(
                  fontSize: const FontSize(14),fontFamily: danaMedium,color: textColor,
                  textAlign: TextAlign.justify,
                ),
                "th": Style(
                  fontSize: const FontSize(14),fontFamily: danaMedium,color: textColor,
                  textAlign: TextAlign.justify,
                ),
                "td": Style(
                  padding: const EdgeInsets.all(6),
                  alignment: Alignment.topLeft,
                ),
                "h1": Style(fontSize: const FontSize(14),fontFamily: danaMedium,color: textColor,
                  textAlign: TextAlign.justify,),
              }
          )
        ),
      ):
      Container(
        alignment: Alignment.center,
        child: const Text("قوانین و مقرراتی تعیین نشده",style: const TextStyle(fontSize: 14,fontFamily: danaMedium,color: textColor),),
      )
      ,
    );
  }
}
