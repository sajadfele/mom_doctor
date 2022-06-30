import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mom_doctor/Helper/constant.dart';

class MyTextInput extends StatefulWidget {
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
  final TextStyle? counterStyle;
  final String? initialValue;

  MyTextInput(
      {this.textDirection,
      this.textStyle,
      this.initialValue,
      this.counterStyle,
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
      required this.textAlign,
      this.validator});

  @override
  State<MyTextInput> createState() => _MyTextInputState();
}

class _MyTextInputState extends State<MyTextInput> {
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
            cursorColor: purpleMainColor,
            style: widget.textStyle,
            onFieldSubmitted: widget.onFieldSubmitted,
            onChanged: widget.onFieldChanged,
            validator: widget.validator,
            keyboardType: widget.type,
            maxLength: widget.maxLength,
            maxLines: widget.maxLine,
            strutStyle: widget.strutStyle,
            textInputAction: widget.textInputAction,
            textDirection: widget.textDirection,
            initialValue: widget.initialValue,

            decoration: InputDecoration(
              counterStyle: widget.counterStyle,
              prefixIcon: widget.prefixIcon,
              hintStyle: TextStyle(color: grayMainColor, fontFamily: danaMedium, fontSize: 16),
              suffixIcon: widget.suffixIcon,
              counter: widget.counter,
              hintText: widget.hint ?? "",
              contentPadding: const EdgeInsets.only(top: 5, bottom: 5, left: 18, right: 18),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color:purpleMainColor, width: 1)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: grayMainColor, width: 1)),
              errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: errorColor, width: 1)),
              focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: errorColor, width: 1)),
              errorStyle: TextStyle(color: errorColor, fontFamily: danaMedium, fontSize: 10),
              disabledBorder: InputBorder.none,
            )),
        if (isClicked)
          Container(
            margin: const EdgeInsets.only(right: 20, left: 12, bottom: 32),
            padding: EdgeInsets.symmetric(horizontal: (widget.label!.isNotEmpty) ? 8 : 0),
            transform: Matrix4.translationValues(0, -8, 0),
            color: Colors.white,
            //alignment: Alignment.center,
            child: Text(widget.label ?? "", style: TextStyle(color: purpleMainColor, fontFamily: danaMedium, fontSize: 12)),
          ),
      ],
    );
  }
}
