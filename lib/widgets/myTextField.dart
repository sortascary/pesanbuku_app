import 'package:flutter/material.dart';

class Mytextfield extends StatelessWidget {
  final String hintText;
  final bool isObsecure;
  final TextEditingController controller;

  final Color fillColor;
  final bool filled;

  final double borderRadius;

  final Icon? prefixIcon;
  final IconButton? suffixIcon;

  const Mytextfield(
      {super.key,
      required this.hintText,
      required this.isObsecure,
      required this.controller,
      required this.fillColor,
      required this.filled,
      required this.borderRadius,
      this.prefixIcon,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: controller,
        obscureText: isObsecure,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          filled: filled,
          fillColor: fillColor,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide.none),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide.none),
            prefixIcon: prefixIcon, 
            suffixIcon: suffixIcon
        ),
      ),
    );
  }
}
