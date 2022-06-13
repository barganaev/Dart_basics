import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skill_box_homeworks/hw_10/validate_email.dart';

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
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            key: Key('fieldEmail'),
            validator: (value) {
              if (value == '') return 'Введите email';
              if (!validateEmail(value!)) // TODO: Used ! sign
                return 'Поле email заполнено не корректно';
              return null;
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextFormField(
            key: Key('fieldPhone'),
            validator: (value) {
              if (value == '') return 'Введите телефон';
              return null;
            },
            decoration: InputDecoration(labelText: 'Phone'),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly // TODO: Not sure about this code
              // WhitelistingTextInputFormatter.digitsOnly
            ],
          ),
          RaisedButton(
            key: Key('fieldSubmit'),
            child: Text('Отправить'),
            onPressed: () {
              if (_formKey.currentState!.validate()) { // TODO: Used ! sign
                _formKey.currentState?.save();
                setState(() {
                  successMessage = true;
                });
              }
            },
          ),
          if (successMessage) Text('Добро пожаловать'),
        ],
      ),
    );
  }
}
