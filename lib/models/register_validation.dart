import 'package:flutter/widgets.dart';

String? nameValidation(String? name) {
  if (name!.length < 4) {
    return "Name must be at least 4 characters";
  }
  return null;
}

String? emailValidation(String? email) {
  if (email!.isEmpty) {
    return "Email can not be empty";
  }
  if (!email!.contains("@")) {
    return "Enter valid Email";
  }
  if (!email!.contains(".com")) {
    return "Enter valid Email";
  }
  return null;
}

String? phoneValidation(String? phone) {
  if (phone!.length != 11) {
    return "Phone must be 11 number";
  }
  return null;
}

String? passwordValidation(String? password) {
  if (password!.isEmpty) {
    return "Password is required";
  }
  if (password.length < 9) {
    return "Password must be at least 8 characters";
  }
  return null;
}

String? passwordConfirmaionValidation(String? passwordConfirmaion, TextEditingController passwordController) {
  if (passwordConfirmaion! != passwordController.text ) {
    return "Password not match";
  }if (passwordConfirmaion.isEmpty) {
    return "Password confirmaion is required";
  }
return null;
}
