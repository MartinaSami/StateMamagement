bool isEmail(email) {
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  RegExp regExp = new RegExp(p);

  return regExp.hasMatch(email);
}

bool isPhoneNumber(String em) {
  String p = r'^01[0|1|2|5]{1}[0-9]{8}$';

  RegExp regExp = new RegExp(p);

  return regExp.hasMatch(em);
}

bool isValidatePassword(String password) {
  return password.length > 7;
}
