import 'package:flutter/material.dart';

class TextFieldStyled extends StatefulWidget {
  const TextFieldStyled({Key? key}) : super(key: key);

  @override
  _TextFieldStyledState createState() => _TextFieldStyledState();
}

class _TextFieldStyledState extends State<TextFieldStyled> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              children: [
                TextField(
                  cursorColor: Colors.purple,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors.purple
                    ),
                    suffixIcon: Icon(Icons.search, color: Colors.purple,),
                    // iconColor: Colors.purple,
                    // suffixIconColor: Colors.purple,
                    labelText: 'Search',
                    hintText: 'Введите значение',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.purple),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.purple),
                      borderRadius: BorderRadius.circular(15)
                    )
                  ),
                ),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(top: 5, left: 10),
                    child: Text('Поле для поиска заметок', style: TextStyle(fontWeight: FontWeight.w300),),
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
