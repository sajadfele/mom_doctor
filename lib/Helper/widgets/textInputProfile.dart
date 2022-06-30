import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mom_doctor/Helper/constant.dart';

class TextInputProfile extends StatefulWidget {
  final String? label;
  final String? hint;
  final Function(String text)? onFieldSubmitted;
  final Function(String text)? onFieldChanged;
  final TextEditingController? controller;
  final TextInputType? type;
  final int? maxLength;
  final FormFieldValidator? validator;
  final int? maxLine;
  final TextAlign? textAlign;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputAction? textInputAction;
  final Widget? counter;
  final TextStyle? textStyle;
  final TextDirection? textDirection;
  final StrutStyle? strutStyle;
  final TextStyle? labelStyle;
  final String? initialValue;
  final int? minLines;

  TextInputProfile(
      {this.textDirection,
      this.minLines,
      this.initialValue,
      this.textStyle,
      this.labelStyle,
      this.strutStyle,
      this.counter,
      this.textInputAction,
      this.suffixIcon,
      this.prefixIcon,
      this.inputFormatters,
      this.label,
      this.hint,
      this.controller,
      this.onFieldSubmitted,
      this.onFieldChanged,
      this.type,
      this.maxLength,
      this.maxLine,
      this.textAlign,
      this.validator});

  @override
  State<TextInputProfile> createState() => _TextInputProfileState();
}

class _TextInputProfileState extends State<TextInputProfile> {
  FocusNode _focus = FocusNode();
  bool isClicked = false;

  @override
  void initState() {
    super.initState();
    _focus.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    _focus.removeListener(_onFocusChange);
    _focus.dispose();
  }

  void _onFocusChange() {
    setState(() {
      isClicked = _focus.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        TextFormField(
            inputFormatters: widget.inputFormatters,
            focusNode: _focus,
            controller: widget.controller,
            textAlign: widget.textAlign!,
            cursorColor: greenMainColor,
            style: widget.textStyle,
            onFieldSubmitted: widget.onFieldSubmitted,
            onChanged: widget.onFieldChanged,
            validator: widget.validator,
            keyboardType: widget.type,
            maxLength: widget.maxLength,
            minLines: widget.minLines,
            maxLines: widget.maxLine,
            strutStyle: widget.strutStyle,
            textInputAction: widget.textInputAction,
            textDirection: widget.textDirection,
            initialValue: widget.initialValue,
            decoration: InputDecoration(
              prefixIcon: widget.prefixIcon,
              hintStyle: TextStyle(color: grayMainColor, fontFamily: danaMedium, fontSize: 16),
              suffixIcon: widget.suffixIcon,
              counter: widget.counter,
              labelStyle: widget.labelStyle,
              hintText: widget.hint ?? "",
              contentPadding:  EdgeInsets.only(top: 5, bottom:(widget.minLines!=null)?20:0, left: 18, right: 18),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: purpleMainColor, width: 1)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: textColor, width: 1)),
              errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: errorColor, width: 1)),
              focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: errorColor, width: 1)),
              errorStyle: TextStyle(color: errorColor, fontFamily: danaMedium, fontSize: 10),
              disabledBorder: InputBorder.none,
            )),
        Container(
          margin: const EdgeInsets.only(right: 20, left: 12, bottom: 32),
          padding: EdgeInsets.only(right: 8, left: 12),
          transform: Matrix4.translationValues(0, -8, 0),
          color: Colors.white,
          //alignment: Alignment.center,
          //height: 15,
          child: Text(widget.label ?? "", style: TextStyle(color: (isClicked) ? purpleMainColor : textColor, fontFamily: danaMedium, fontSize: 12)),
        ),
      ],
    );
  }
}
