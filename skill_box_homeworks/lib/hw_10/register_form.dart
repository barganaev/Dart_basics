import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skill_box_homeworks/hw_10/validate_email.dart';

class RegisterForm extends StatefulWidget {
  RegisterForm({Key? key}) : super(key: key);

  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isSuccess = false;
  void _handleSubmit() {
    if (_formKey.currentState!.validate()) { // TODO: Used ! sign
      setState(() {
        _isSuccess = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            key: Key('fieldRegName'),
            decoration: InputDecoration(labelText: 'First name'),
            validator: (value) {
              if (value == '') return 'Введите имя';
              return null;
            },
          ),
          TextFormField(
            key: Key('fieldRegLastName'),
            decoration: InputDecoration(labelText: 'Last name'),
            validator: (value) {
              if (value == '') return 'Введите фамилию';
              return null;
            },
          ),
          TextFormField(
            key: Key('fieldRegPhone'),
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              // WhitelistingTextInputFormatter.digitsOnly
              FilteringTextInputFormatter.digitsOnly // TODO: Not sure about this code
            ],
            decoration: InputDecoration(labelText: 'Phone'),
            validator: (value) {
              if (value == '') return 'Заполните поле телефон';
              return null;
            },
          ),
          TextFormField(
            key: Key('fieldRegEmail'),
            decoration: InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (value == '') return 'Заполните поле email';
              if (!validateEmail(value!)) return 'Емейл не корректный'; // TODO: Used ! sign
              return null;
            },
          ),
          RaisedButton(
            key: Key('fieldSend'),
            child: Text('Отправить'),
            onPressed: _handleSubmit,
          ),
          if (_isSuccess) Text('Вы успешно зарегистрировались')
        ],
      ),
    );
  }
}
