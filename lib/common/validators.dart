import 'package:flutter/material.dart';

class Validator {

  validateEmail(BuildContext context, String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (value.length == 0 ) {
      return "Email tidak boleh kosong";
    } else if (!regex.hasMatch(value)) {
      return "Email tidak valid";
    }
    return null;
  }

  validatePassword(BuildContext context, String value) {
    String pattern = r'(^[a-zA-Z0-9]*$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Password tidak boleh kosong";
    } else if(value.length < 8) {
      return "Password tidak boleh kurang dari 8 digit";
    } else if(value.length > 15) {
      return "Password tidak boleh lebih dari 15 digit";
    } else if (!regExp.hasMatch(value)) {
      return "Password tidak valid";
    }
    return null;
  }

}