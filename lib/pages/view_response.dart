import '../constants.dart';
import '../models/form_data.dart';
import 'package:flutter/material.dart';

class ViewResponse extends StatelessWidget {
  final FormResponse formResponse;

  const ViewResponse({Key? key, required this.formResponse}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: const Text(
          'Form',
          style: Constants.appBarStyle,
        ),
      ),
      body: Padding(
        padding: Constants.formPadding,
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: ListView(
                children: [
                  const Text(
                    'Your Response',
                    style: Constants.responsePageStyle,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'What is your name?',
                    style: Constants.responseStyle,
                  ),
                  const SizedBox(height: 10),
                  Text(formResponse.name ?? ""),
                  const SizedBox(height: 16),
                  const Text(
                    'When were you born?',
                    style: Constants.responseStyle,
                  ),
                  const SizedBox(height: 10),
                  Text(formResponse.dob ?? ""),
                  const SizedBox(height: 16),
                  const Text(
                    'What gender do you identify as?',
                    style: Constants.responseStyle,
                  ),
                  const SizedBox(height: 10),
                  Text(formResponse.gender?.name ?? ""),
                  const SizedBox(height: 16),
                  const Text(
                    'What is your country of origin?',
                    style: Constants.responseStyle,
                  ),
                  const SizedBox(height: 10),
                  Text(formResponse.country ?? ""),
                  const SizedBox(height: 16),
                  const Text(
                    'What is your opinion on climate crisis?',
                    style: Constants.responseStyle,
                  ),
                  const SizedBox(height: 10),
                  Text(formResponse.opinion ?? ""),
                ],
              ),
            ),
            ElevatedButton(
              style: Constants.buttonStyle,
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go back'),
            ),
          ],
        ),
      ),
    );
  }
}
