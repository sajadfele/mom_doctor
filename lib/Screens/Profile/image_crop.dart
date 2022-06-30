
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_crop/image_crop.dart';
import 'package:mom_doctor/Helper/constant.dart';
import 'package:mom_doctor/Screens/Profile/repository/profile_repository.dart';
import 'package:mom_doctor/generated/l10n.dart';

class ImageCropper extends StatefulWidget {
  File? imageFile;

  ImageCropper({this.imageFile});

  @override
  _ImageCropperState createState() => _ImageCropperState();
}

class _ImageCropperState extends State<ImageCropper> {
  bool imageIsSend=false;

  /*late EditProfileBloc _editeProfileBloc;*/


  @override
  void initState() {
    /*_editeProfileBloc=BlocProvider.of<EditProfileBloc>(context);*/
    super.initState();
  }

  Future<void> updateImageProfile(File file) async {
    var result = await ProfileRepository().updateImageDoctor(file:file);
    if(result==200){
      imageIsSend=true;
    }
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
            title: const Text("برش عکس",style: TextStyle(fontSize: 16, fontFamily: danaMedium,color: Colors.black)),
          ),
        ),
      ),
      body: _buildCropImage(),
    );
  }

  final cropKey = GlobalKey<CropState>();

  Widget _buildCropImage() {
    return Column(
     // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(

          margin: const EdgeInsets.only(top: 150),
          height: 360,
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          child: Crop(
            key: cropKey,
            image: FileImage(widget.imageFile!),
            aspectRatio: 3.0 /3.0,
          ),
        ),
        const Spacer(),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () async {
            final crop = cropKey.currentState;
            final area = crop!.area;

            if (area != null) {
              final croppedImage = await ImageCrop.cropImage(file: widget.imageFile!, area: area);
               await updateImageProfile(croppedImage);
              Navigator.pop(context,imageIsSend);
              if(imageIsSend) {
                ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  duration: const Duration(seconds: 2),
                  margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  behavior: SnackBarBehavior.floating,
                  content: const Text('عکس حساب کاربری با موفقیت تغییر کرد', style: TextStyle(fontFamily: danaMedium),),
                ),
              );
              }
              setState(() {

              });

            }
          },
          child: Container(
            margin: const EdgeInsets.only(left: 12,right: 12,bottom: 15),
            height: 48,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: purpleMainColor,
            ),
            alignment: Alignment.center,
            child: Text(S.of(context).ImageCrop,style: const TextStyle(fontSize: 14,fontFamily: danaMedium,color: Colors.white),),
          ),
        )
      ],
    );
  }
}