import 'package:adove/app/global/helpers/constraints.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormTextWidget extends StatelessWidget {
  final TextEditingController controller;
  final bool isObscureText;
  final String hinText;

  const FormTextWidget({Key? key, 
    required this.controller,
    required this.hinText,
    this.isObscureText = false,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isObscureText,
      style: TextStyle(
          fontSize: kH2,
          color: Colors.black,
          fontFamily: 'Myriad'
      ),
      decoration: InputDecoration(
       hintText: hinText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(7.0)),
        labelStyle: TextStyle(
          fontSize: kH2,
          color: Colors.grey,
          fontFamily: 'Myriad'
      ),
      ),
    );
  }
}