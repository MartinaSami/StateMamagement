import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:statemanagmenetstacked/app/app.locator.dart';

import '../services/loading_overlay_service.dart';
import 'exceptions.dart';

class ExceptionHandler {
  dynamic error;
  BuildContext context;
  List<Text> textWidgets = <Text>[];
  final loadingOverlay = locator<LoadingOverlay>();
  final navigationService = locator<NavigationService>();

  ExceptionHandler({required this.context, this.error}) {
    if (error is CustomException) {
      this.textWidgets = (error as CustomException).textWidgets();
    } else {
      this.textWidgets.add(Text(error.toString()));
      this.showErrorDialog();
    }
    if (error is CustomException &&
        error.reportType == ErrorReportType.Dialog) {
      this.showErrorDialog();
    } else if (error is CustomException &&
        error.reportType == ErrorReportType.SnackBar) {
      this.showErrorSnackBar();
    }
  }

  void showErrorDialog() async {
    if (loadingOverlay.isLoading) {
      loadingOverlay.dialog?.whenComplete(() {
        showErrorDialog();
      });
      loadingOverlay.hide();
      return;
    }

    showDialog(
      context: context,
      useRootNavigator: true,
      builder: (ctx) {
        return AlertDialog(
          title: Text(
            "خطاء",
            textAlign: TextAlign.right,
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: this.textWidgets,
            ),
          ),
          actions: [
            FlatButton(
              child: Text("حسناً"),
              onPressed: () {
                if (this.error is AuthenticationException) {
                  // TODO: Add navigation out side when error
                  // navigationService.clearStackAndShow(Routes.loginView);
                  return;
                }

                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

  void showErrorSnackBar() {}
}
