import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:statemanagmenetstacked/app/app.locator.dart';
import 'package:statemanagmenetstacked/app/app.router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Color(0xffF0F0F0),
          appBarTheme: AppBarTheme(backgroundColor: Color(0xFFEFEFEF))),
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
    );
  }
}
