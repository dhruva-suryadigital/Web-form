import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import '../constants.dart';
import '../models/form_data.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  TextEditingController dateInputController = TextEditingController();
  TextEditingController nameInputController = TextEditingController();
  bool _checkBoxState = false;
  bool _areFieldsEmpty = false;
  Gender? _gender;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FormResponse formResponse = FormResponse();
  String? _dropDownValue;

  void _isEmpty() {
    setState(() {
      if ((dateInputController.text.isNotEmpty) &&
          (nameInputController.text.isNotEmpty)) {
        _areFieldsEmpty = true;
      } else {
        _areFieldsEmpty = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Constants.formPadding,
      child: Column(
        children: [
          Expanded(
            flex: 15,
            child: ListView(
              children: [
                Form(
                  key: _formKey,
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                      if (constraints.maxWidth > 480) {
                        return Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: nameField(),
                                ),
                                const SizedBox(width: 32),
                                Expanded(
                                  child: dobField(),
                                ),
                              ],
                            ),
                            const SizedBox(height: 32),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: genderField(),
                                ),
                                const SizedBox(width: 32),
                                Expanded(
                                  child: countryField(),
                                ),
                              ],
                            ),
                            const SizedBox(height: 32),
                            opinionFiled(),
                            const SizedBox(height: 32),
                            checkboxField(),
                          ],
                        );
                      } else {
                        return Column(
                          children: [
                            nameField(),
                            const SizedBox(height: 32),
                            dobField(),
                            const SizedBox(height: 32),
                            genderField(),
                            const SizedBox(height: 32),
                            countryField(),
                            const SizedBox(height: 32),
                            opinionFiled(),
                            const SizedBox(height: 32),
                            checkboxField(),
                          ],
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ElevatedButton(
              style: Constants.buttonStyle,
              onPressed: (_checkBoxState && _areFieldsEmpty)
                  ? () {
                      bool validate = _formKey.currentState!.validate();
                      if (validate) {
                        _formKey.currentState!.save();
                        AlertDialog alert = AlertDialog(
                          actionsPadding: EdgeInsets.zero,
                          shape: Constants.alertShape,
                          content: const Text(
                            'Successfully submitted the form!',
                            style: Constants.alertContentStyle,
                          ),
                          actions: [
                            const Divider(thickness: 1),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  OutlinedButton(
                                    style: Constants.actionStyle,
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text(
                                      'close',
                                      style: Constants.alertStyle,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  OutlinedButton(
                                    style: Constants.actionStyle,
                                    onPressed: () {},
                                    child: const Text(
                                      'View Response',
                                      style: Constants.alertStyle,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                ],
                              ),
                            ),
                          ],
                        );
                        showDialog(
                          context: context,
                          builder: (context) {
                            return alert;
                          },
                        );
                      }
                    }
                  : null,
              child: const Text('submit'),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox createGenderTile(Gender value) {
    return SizedBox(
      height: 25,
      child: Row(
        children: [
          Radio(
            value: value,
            groupValue: _gender,
            onChanged: (value) {
              setState(() {
                _gender = value!;
              });
              formResponse = formResponse.copyWith(gender: _gender);
            },
          ),
          Text(value.name),
        ],
      ),
    );
  }

  Column nameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "What is your name?",
          style: Constants.mainStyle,
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: nameInputController,
          decoration: const InputDecoration(
            contentPadding: Constants.fieldPadding,
            hintText: 'Name*',
          ),
          onSaved: (value) {
            formResponse = formResponse.copyWith(name: value);
          },
          onChanged: (value) {
            _isEmpty();
          },
          validator: (value) {
            if (value!.length < 3) {
              return '\u26A0 Name should have at-least 3 characters';
            } else {
              return null;
            }
          },
        ),
      ],
    );
  }

  Column dobField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'When were you born?',
          style: Constants.mainStyle,
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 48,
          child: TextFormField(
            controller: dateInputController,
            keyboardType: TextInputType.datetime,
            decoration: const InputDecoration(
              contentPadding: Constants.fieldPadding,
              suffixIcon: Icon(Icons.calendar_today_outlined),
              hintText: 'Date of Birth*',
            ),
            onTap: () async {
              DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1920),
                  lastDate: DateTime(2024));

              if (pickedDate != null) {
                dateInputController.text = formatDate(
                  pickedDate,
                  [dd, '/', mm, '/', yyyy],
                );
              }
            },
            onChanged: (value) {
              _isEmpty();
            },
            onSaved: (value) {
              formResponse = formResponse.copyWith(dob: value);
            },
          ),
        ),
      ],
    );
  }

  Column genderField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'What gender do you identify as?',
          style: Constants.mainStyle,
        ),
        const SizedBox(height: 10),
        createGenderTile(Gender.male),
        createGenderTile(Gender.female),
        createGenderTile(Gender.other),
      ],
    );
  }

  Column opinionFiled() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'What is your opinion on the climate crisis?',
          style: Constants.mainStyle,
        ),
        const SizedBox(height: 10),
        TextFormField(
          maxLines: 3,
          decoration: const InputDecoration(
            contentPadding: Constants.fieldPadding,
            hintText: 'Enter your message',
          ),
          onSaved: (value) {
            formResponse = formResponse.copyWith(opinion: value);
          },
        ),
      ],
    );
  }

  Column countryField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'What is your country of origin?',
          style: Constants.mainStyle,
        ),
        const SizedBox(height: 10),
        DropdownButtonFormField(
          hint: const Text('Select a Country'),
          icon: const Icon(Icons.keyboard_arrow_down),
          items: Constants.country
              .map(
                (String selectCountry) => DropdownMenuItem(
                  value: selectCountry,
                  child: Text(selectCountry),
                ),
              )
              .toList(),
          onChanged: (selected) {
            _dropDownValue = selected!;
            formResponse = formResponse.copyWith(country: _dropDownValue);
          },
        ),
      ],
    );
  }

  Row checkboxField() {
    return Row(
      children: [
        Checkbox(
            value: _checkBoxState,
            onChanged: (value) {
              _isEmpty();
              setState(() {
                _checkBoxState = value!;
              });
            }),
        const Text('I agree to the terms and conditions'),
      ],
    );
  }
}
