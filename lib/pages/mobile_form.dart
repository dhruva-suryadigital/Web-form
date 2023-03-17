import '../constants.dart';
import 'package:flutter/material.dart';
import 'form_page.dart';

class MobileForm extends StatelessWidget {
  const MobileForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Form',
          style: Constants.appBarStyle,
        ),
      ),
      body: const FormPage(),
    );
  }
}
