import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:form_web/pages/view_response.dart';
import 'package:form_web/widgets.dart';
import '../constants.dart';
import '../models/form_data.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController _dateInputController = TextEditingController();
  final TextEditingController _nameInputController = TextEditingController();
  bool _isChecked = false;
  bool _areFieldsEmpty = false;
  Gender? _gender;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FormResponse _formResponse = FormResponse();
  String? _dropDownValue;

  void _isEmpty() {
    setState(() {
      if ((_dateInputController.text.isNotEmpty) &&
          (_nameInputController.text.isNotEmpty)) {
        _areFieldsEmpty = true;
      } else {
        _areFieldsEmpty = false;
      }
    });
  }

  void _onChange(value) {
    setState(() {
      _formResponse = _formResponse.copyWith(gender: value);
      _gender = value;
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
                                  child: _getNameField(),
                                ),
                                const SizedBox(width: 32),
                                Expanded(
                                  child: _getDobField(),
                                ),
                              ],
                            ),
                            const SizedBox(height: 32),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: _getGenderField(),
                                ),
                                const SizedBox(width: 32),
                                Expanded(
                                  child: _getCountryField(),
                                ),
                              ],
                            ),
                            const SizedBox(height: 32),
                            _getOpinionFiled(),
                            const SizedBox(height: 32),
                            _getCheckboxField(),
                          ],
                        );
                      } else {
                        return Column(
                          children: [
                            _getNameField(),
                            const SizedBox(height: 32),
                            _getDobField(),
                            const SizedBox(height: 32),
                            _getGenderField(),
                            const SizedBox(height: 32),
                            _getCountryField(),
                            const SizedBox(height: 32),
                            _getOpinionFiled(),
                            const SizedBox(height: 32),
                            _getCheckboxField(),
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
              onPressed: (_isChecked && _areFieldsEmpty)
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
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ViewResponse(
                                              formResponse: _formResponse),
                                        ),
                                      );
                                    },
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

  Column _getNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "What is your name?",
          style: Constants.mainStyle,
        ),
        const SizedBox(height: 10),
        TextFormField(
          controller: _nameInputController,
          decoration: const InputDecoration(
            contentPadding: Constants.fieldPadding,
            hintText: 'Name*',
          ),
          onSaved: (value) {
            _formResponse = _formResponse.copyWith(name: value);
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

  Column _getDobField() {
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
            readOnly: true,
            controller: _dateInputController,
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
                _dateInputController.text = formatDate(
                  pickedDate,
                  [dd, '-', mm, '-', yyyy],
                );
              }
            },
            onChanged: (value) {
              _isEmpty();
            },
            onSaved: (value) {
              _formResponse = _formResponse.copyWith(dob: value);
            },
          ),
        ),
      ],
    );
  }

  Column _getGenderField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'What gender do you identify as?',
          style: Constants.mainStyle,
        ),
        const SizedBox(height: 10),
        for (var value in Gender.values)
          GenderTile(
            value: value,
            groupValue: _gender,
            onChange: _onChange,
          ),
      ],
    );
  }

  Column _getOpinionFiled() {
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
            _formResponse = _formResponse.copyWith(opinion: value);
          },
        ),
      ],
    );
  }

  Column _getCountryField() {
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
            _formResponse = _formResponse.copyWith(country: _dropDownValue);
          },
        ),
      ],
    );
  }

  Row _getCheckboxField() {
    return Row(
      children: [
        Checkbox(
            value: _isChecked,
            onChanged: (value) {
              _isEmpty();
              setState(() {
                _isChecked = value!;
              });
            }),
        const Text('I agree to the terms and conditions'),
      ],
    );
  }
}
