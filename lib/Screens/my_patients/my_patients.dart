import 'package:flutter/material.dart';

class MyPatients extends StatefulWidget {
  final VoidCallback goToMainPage;
  const MyPatients({Key? key,required this.goToMainPage}) : super(key: key);

  @override
  State<MyPatients> createState() => _MyPatientsState();
}

class _MyPatientsState extends State<MyPatients> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("MyPatients"),
      ),
    );
  }
}
