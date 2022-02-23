import 'package:flutter/material.dart';
// import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:statemanagmenetstacked/app/app.locator.dart';

class LoadingOverlay {
  final navigationService = locator<NavigationService>();
  bool isLoading = false;
  Future<void>? dialog;
  void hide() {
    this.isLoading = false;
    navigationService.popRepeated(1);
  }

  void show(String message) {
    final dialog = showDialog(
      context: StackedService.navigatorKey!.currentContext!,
      barrierDismissible: false,
      builder: (ctx) => _FullScreenLoader(message: message),
    );

    this.dialog = dialog;
  }

  Future<T> during<T>(Future<T> future, [String message = ""]) {
    this.isLoading = true;
    show(message);
    return future.whenComplete(() {
      if (this.isLoading) {
        this.hide();
      }
    });
  }
}

class _FullScreenLoader extends StatelessWidget {
  final String? message;

  const _FullScreenLoader({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(0, 0, 0, 0.5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          const SizedBox(
            height: 20,
          ),
          Text(
            message ?? "",
            style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.white,
                fontSize: 18),
          )
        ],
      ),
    );
  }
}
