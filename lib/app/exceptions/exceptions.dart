import "package:flutter/material.dart";

enum ErrorReportType {
  Dialog,
  SnackBar,
}

TextStyle textStyle = TextStyle(color: Colors.red, fontWeight: FontWeight.bold);

abstract class CustomException {
  late ErrorReportType reportType;

  CustomException([var message]);

  String toString();

  List<Text> textWidgets();
}

class ValidationException implements CustomException {
  Map? message;
  ErrorReportType reportType = ErrorReportType.Dialog;

  ValidationException([this.message]);

  String toString() {
    final errors = message?.values.map((e) => e[0]).join("\n");
    return errors!;
  }

  List<Text> textWidgets() {
    final errors = message?.values
        .map(
          (e) => Text(
            e[0],
            style: textStyle,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
          ),
        )
        .toList();
    return errors!;
  }
}

class AuthenticationException implements CustomException {
  String? message;
  ErrorReportType reportType = ErrorReportType.Dialog;

  AuthenticationException([this.message]);

  String toString() {
    return this.message!;
  }

  List<Text> textWidgets() {
    final errors = [Text("انتهت الجلسة قم باعدة تسجيل الدخول")];
    return errors;
  }
}

class AuthorizationException implements CustomException {
  String? message;
  ErrorReportType reportType = ErrorReportType.Dialog;

  AuthorizationException([this.message]);

  String toString() {
    return this.message!;
  }

  List<Text> textWidgets() {
    final errors = [Text(this.message!)];
    return errors;
  }
}

class ConnectionException implements CustomException {
  String? message;
  ErrorReportType reportType;

  ConnectionException([this.message, this.reportType = ErrorReportType.Dialog]);

  String toString() {
    return this.message ?? "";
  }

  List<Text> textWidgets() {
    final errors = [
      Text(
        this.message ?? "",
        textAlign: TextAlign.right,
      )
    ];
    return errors;
  }
}

class BadrequestException implements CustomException {
  String? message;
  ErrorReportType reportType;

  BadrequestException([this.message, this.reportType = ErrorReportType.Dialog]);

  String toString() {
    return this.message ?? "";
  }

  List<Text> textWidgets() {
    final errors = [
      Text(
        this.message ?? "",
        textAlign: TextAlign.right,
      )
    ];
    return errors;
  }
}
