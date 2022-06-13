import 'package:flutter/material.dart';
import 'package:skill_box_homeworks/hw_10/login_form.dart';
import 'package:skill_box_homeworks/hw_10/register_form.dart';

enum FormType { login, register }

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}
class _LoginViewState extends State<LoginView> {
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
      appBar: AppBar(),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            _formType == FormType.login ? 'Вход' : 'Регистрация',
                            style: Theme.of(context).textTheme.headline4,
                            textAlign: TextAlign.start,
                          ),
                        ),
                        _formType == FormType.login
                            ? LoginForm()
                            : RegisterForm(),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _formType == FormType.login
                          ? 'Уже есть аккаунт?'
                          : 'Еще нет аккаунта? ',
                    ),
                    FlatButton(
                      child: RichText(
                        text: TextSpan(children: [
                          TextSpan(
                            text: _formType == FormType.login
                                ? 'Войти'
                                : 'Регистрация',
                          )
                        ], style: Theme.of(context).textTheme.bodyText1),
                      ),
                      onPressed: _switchForm,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}