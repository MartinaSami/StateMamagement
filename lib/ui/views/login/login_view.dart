import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:statemanagmenetstacked/ui/shared/app_colors.dart';
import 'package:statemanagmenetstacked/ui/shared/ui_helpers.dart';
import 'package:statemanagmenetstacked/ui/views/login/login_view_model.dart';
import 'package:statemanagmenetstacked/ui/widgets/busy_button.dart';
import 'package:statemanagmenetstacked/ui/widgets/input_field.dart';

class LoginView extends StatelessWidget {
  // FocusNode focus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      builder: (context, model, child) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(25),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    verticalSpaceMedium,
                    Container(
                      height: 80,
                      width: double.infinity,
                      child: Image.asset(
                        'assets/images/nutrition_logo.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Expanded(child: Container()),
                    Text(
                      'Sign In',
                      style: TextStyle(color: placeHolderColor, fontSize: 40),
                    ),
                    verticalSpaceMedium,
                    Container(
                      child: InputField(
                        nextFocusNode: model.passwordFocusNode,
                        onChanged: (s) {},
                        placeholder: 'Phone Number',
                        textInputType: TextInputType.phone,
                        controller:
                            model.inputsControlls["phoneNumber"]!["controller"],
                        fieldFocusNode: model.phoneFocusNode,
                        validationMessage: model.inputsControlls[
                            "phoneNumber"]!["validationMessage"],
                      ),
                    ),
                    verticalSpaceTiny,
                    Container(
                      child: InputField(
                        onChanged: (s) {},
                        password: true,
                        placeholder: 'Password',
                        controller:
                            model.inputsControlls["password"]!["controller"],
                        fieldFocusNode: model.passwordFocusNode,
                        validationMessage: model
                            .inputsControlls["password"]!["validationMessage"],
                      ),
                    ),
                    verticalSpaceMedium,
                    verticalSpaceMedium,
                    BusyButton(
                      child: Text(
                        "Sign In",
                        style: TextStyle(color: backgroundColor),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                      color: buttonColor,
                      busy: model.isBusy,
                      onPressed: () {
                        model.logIn();
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
