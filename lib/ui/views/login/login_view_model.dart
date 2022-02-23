import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:statemanagmenetstacked/app/app.locator.dart';
import 'package:statemanagmenetstacked/app/app.router.dart';
import 'package:statemanagmenetstacked/app/services/auth_service.dart';
import 'package:statemanagmenetstacked/ui/shared/utils.dart';

class LoginViewModel extends BaseViewModel {
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode phoneFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();

  final AuthService? _authService = locator<AuthService>();
  final NavigationService? _navigationService = locator<NavigationService>();

  late Map<String, Map<String, dynamic>> inputsControlls;

  Map<String, dynamic> formValues = {"phoneNumber": null, "password": null};

  LoginViewModel() {
    this.inputsControlls = {
      "phoneNumber": {
        "controller": TextEditingController(),
        "validator": (phone) {
          print("phone = $phone");

          return isPhoneNumber(phone)
              ? null
              : "Please enter a valid Phone number";
        },
        "validationMessage": null
      },
      "password": {
        "controller": TextEditingController(),
        "validator": (password) =>
            password.length < 8 ? "Please enter a valid password" : null,
        "validationMessage": null
      }
    };
  }

  bool validate() {
    bool valid = false;

    for (final inputKey in inputsControlls.keys) {
      final Map input = inputsControlls[inputKey]!;
      String? selectedValue;

      selectedValue = input["controller"].text.trim();

      inputsControlls[inputKey]!["validationMessage"] =
          input["validator"](selectedValue!.trim());

      if (inputsControlls[inputKey]!["validationMessage"] != null) {
        valid = false;
        break;
      }
      valid = true;
    }
    notifyListeners();
    return valid;
  }

  void save() {
    this.inputsControlls.forEach((key, value) {
      var selectedValue;
      final Map input = value;

      selectedValue = input["controller"].text.trim();

      formValues[key] = selectedValue;
    });
  }

  void logIn() async {
    if (!this.validate()) return;
    setBusy(true);
    this.save();

    var result = await this._authService!.register(formValues);

    setBusy(false);
    if (result) {
      _navigationService!.navigateTo(Routes.homeView);
    }
  }
}
