import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hw10/utils/validate_email.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool successMessage = false;

  @override
  Widget build(BuildContext context) {
    return successMessage
        ? const Text('Добро пожаловать')
        : Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  key: const Key('loginFieldEmailKey'),
                  validator: (value) {
                    if (value == '') return 'Введите email';
                    if (!validateEmail(value: value ?? '')) {
                      return 'Поле email заполнено не корректно';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  key: const Key('loginFieldPhoneKey'),
                  validator: (value) {
                    if (value == '') return 'Введите телефон';
                    return null;
                  },
                  decoration: const InputDecoration(labelText: 'Телефон'),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  key: const Key('loginSubmitButton'),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text('Отправить'),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      setState(() {
                        successMessage = true;
                      });
                    }
                  },
                ),
              ],
            ),
          );
  }
}
