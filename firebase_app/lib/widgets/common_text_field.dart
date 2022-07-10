import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final int maxLines;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final String? Function(dynamic)? validator;
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  const CommonTextField({
    Key? key,
    required this.controller,
    this.textInputAction,
    this.keyboardType,
    this.maxLines = 1,
    this.onChanged,
    this.onFieldSubmitted,
    this.validator,
    this.hintText = "",
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: TextFormField(
        // autovalidateMode: AutovalidateMode.always,
        controller: controller,
        cursorColor: Colors.red,
        cursorHeight: 25,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        maxLines: maxLines,
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        onChanged: onChanged,
        onFieldSubmitted: onFieldSubmitted,
        obscureText: obscureText,
        validator: validator,
        decoration: InputDecoration(
          fillColor: Colors.yellow,
          focusColor: Colors.brown,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.pink)),
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.pink)),
          // UnderlineInputBorder,
          errorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.yellow)),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.pink, width: 1.5),
          ),
          focusedErrorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.yellow)),
        ),
      ),
    );
  }
}
