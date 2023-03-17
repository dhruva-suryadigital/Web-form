import 'package:flutter/material.dart';
import 'package:form_web/pages/mobile_form.dart';
import 'constants.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: const TextStyle(fontSize: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Constants.transparentColor,
          elevation: 0,
        ),
        primarySwatch: Constants.primaryColor,
      ),
      home: const MobileForm(),
    );
  }
}
