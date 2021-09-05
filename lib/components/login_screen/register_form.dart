import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hw10/utils/validate_email.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isSuccess = false;

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isSuccess = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isSuccess
        ? const Text('Вы успешно зарегистрировались')
        : Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  key: const Key('registerFormFieldFirstName'),
                  decoration: const InputDecoration(labelText: 'Имя'),
                  validator: (value) {
                    if (value == '') return 'Введите имя';
                    return null;
                  },
                ),
                TextFormField(
                  key: const Key('registerFormFieldLastName'),
                  decoration: const InputDecoration(labelText: 'Фамилия'),
                  validator: (value) {
                    if (value == '') return 'Введите фамилию';
                    return null;
                  },
                ),
                TextFormField(
                  key: const Key('registerFormFieldPhone'),
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: const InputDecoration(labelText: 'Телефон'),
                  validator: (value) {
                    if (value == '') return 'Заполните поле телефон';
                    return null;
                  },
                ),
                TextFormField(
                  key: const Key('registerFormFieldEmail'),
                  decoration: const InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == '') return 'Заполните поле email';
                    if (!validateEmail(value: value ?? '')) {
                      return 'Email не корректный';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  key: const Key('registerSubmitForm'),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Text('Отправить'),
                  ),
                  onPressed: _handleSubmit,
                ),
              ],
            ),
          );
  }
}
