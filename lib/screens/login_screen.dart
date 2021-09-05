import 'package:flutter/material.dart';
import 'package:hw10/components/login_screen/login_form.dart';
import 'package:hw10/components/login_screen/register_form.dart';

enum FormType { login, register }

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FormType _formType = FormType.login;

  _switchForm() {
    setState(() {
      _formType =
          _formType == FormType.login ? FormType.register : FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(40.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Align(
                      key: Key(
                        _formType == FormType.login
                            ? 'loginHeader'
                            : 'registerHeader',
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        _formType == FormType.login
                            ? 'Вход'
                            : 'Регистрация',
                        style: Theme.of(context).textTheme.headline4,
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _formType == FormType.login
                        ? LoginForm()
                        : RegisterForm(),
                  ],
                ),
              ),
            ),

            Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    _formType == FormType.register
                        ? 'Уже есть аккаунт?'
                        : 'Еще нет аккаунта?',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    key: const Key('switchFormButton'),
                    child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                          text: _formType == FormType.login
                              ? 'Регистрация'
                              : 'Вход',
                        )
                      ], style: Theme.of(context).textTheme.bodyText1),
                    ),
                    onPressed: _switchForm,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
